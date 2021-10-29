package main

// Import some stuff
import (
	"time"
    "strings"
	"barista.run"
	"barista.run/bar"
	"barista.run/base/click"
	"barista.run/colors"
	"barista.run/group/collapsing"
	"barista.run/modules/battery"
	"barista.run/modules/clock"
	"barista.run/modules/cputemp"
    "barista.run/modules/media"
	"barista.run/modules/meminfo"
    "barista.run/modules/netinfo"
	"barista.run/modules/sysinfo"
	"barista.run/modules/volume"
    "barista.run/modules/volume/pulseaudio"
    "barista.run/modules/wlan"
	"barista.run/outputs"
	"barista.run/pango"
	"barista.run/pango/icons/mdi"
	"github.com/martinlindhe/unit"
    "github.com/martinohmann/barista-contrib/modules/keyboard"
    "github.com/martinohmann/barista-contrib/modules/keyboard/xkbmap"
	colorful "github.com/lucasb-eyer/go-colorful"
)

var spacer = pango.Text(" ").XXSmall()

func ifLeft(dofn func()) func(bar.Event) {
    return func(e bar.Event) {
        if e.Button == bar.ButtonLeft {
            dofn()
        }
    }
}

// Main
func main() {
	mdi.Load("/usr/share/icons/barista/MaterialDesign-Webfont")

    // Colors setup (gruvbox)
	colors.LoadBarConfig()
    iconColor, _ :=  colorful.Hex("#928374")
    bad, _ := colorful.Hex("#FB2934")
    degraded, _ := colorful.Hex("#FABD2F")
    good, _ := colorful.Hex("#B8BB28")

    colors.Set("dim-icon", iconColor)
    colors.Set("bad", bad)
    colors.Set("degraded", degraded)
    colors.Set("good", good)

    // Date configuration
	localdate := clock.Local().Output(time.Second, func(now time.Time) bar.Output {
        return outputs.Pango(
            pango.Icon("mdi-calendar").Color(colors.Scheme("dim-icon")),
            spacer,
            now.Format("Mon Jan 2"),
        )
    })

    // Clock configuration
	localtime := clock.Local().Output(time.Second, func(now time.Time) bar.Output {
        return outputs.Pango(
            pango.Icon("mdi-clock-outline").Color(colors.Scheme("dim-icon")),
            spacer,
            now.Format("15:04:05"),
        )
    })

    // Battery configuration
	buildBattOutput := func(i battery.Info, disp *pango.Node) *bar.Segment {
        battery_level := i.RemainingPct()

        // If no battery or full, hide widget
		if i.Status == battery.Disconnected || i.Status == battery.Unknown {
			return nil
		}

        // If not charging and remaining time is 0 --> Battery already full (maybe at 80% or more, ASUS stuff)
		if i.Status != battery.Charging && i.RemainingTime() == 0 {
			return nil
        }

        // Battery icon
		iconName := "battery"
		if i.Status == battery.Charging {
			iconName += "-charging"
		}

        // Battery level
		switch {
            case battery_level <= 33:
                iconName += "-low"
            case battery_level > 33 && battery_level < 66:
                iconName += "-medium"
            case battery_level >= 66:
                iconName += "-high"
		}

		out := outputs.Pango(pango.Icon("mdi-" + iconName), disp)

        // Battery color
		switch {
            case battery_level < 10:
                out.Urgent(true)
            case battery_level <= 20:
                out.Color(colors.Scheme("bad"))
            case battery_level > 20 && battery_level < 35:
                out.Color(colors.Scheme("degraded"))
		}

		return out
	}

	var showBatteryLevel, showBatteryTime func(battery.Info) bar.Output

	battery_level := battery.All()
	showBatteryLevel = func(i battery.Info) bar.Output {
		out := buildBattOutput(i, pango.Textf("%d%%", i.RemainingPct()))
		if out == nil {
			return nil
		}
		return out.OnClick(click.Left(func() {
			battery_level.Output(showBatteryTime)
		}))
	}

	showBatteryTime = func(i battery.Info) bar.Output {
		rem := i.RemainingTime()
		out := outputs.Pango(
            pango.Icon("mdi-battery-heart-variant"),
            spacer,
            pango.Textf("%d:%02d", int(rem.Hours()), int(rem.Minutes())%60),
        )

		return out.OnClick(click.Left(func() {
			battery_level.Output(showBatteryLevel)
		}))
	}
	battery_level.Output(showBatteryLevel)

    // Volume configuration
    volume_level := volume.New(pulseaudio.DefaultSink()).Output(func(v volume.Volume) bar.Output {
		if v.Mute {
			return outputs.
				Pango(pango.Icon("mdi-volume-off")).
				Color(colors.Scheme("degraded"))
		}

		current_volume := v.Pct()
        iconName := "mdi-volume-"
		switch {
            case current_volume <= 33:
                iconName += "low"
            case current_volume > 33 && current_volume < 66:
                iconName += "medium"
            case current_volume >= 66:
                iconName += "high"
		}

		return outputs.Pango(
			pango.Icon(iconName),
			spacer,
			pango.Textf("%2d%%", current_volume),
		)
	})

    // CPU load (instant and average)
	loadAvg := sysinfo.New().Output(func(s sysinfo.Info) bar.Output {
        out := outputs.Pango(
            pango.Icon("mdi-weight"),
            spacer,
            pango.Textf("I:%0.2f A:%0.2f", s.Loads[0], s.Loads[2]),
        )

		// Load averages are unusually high for a few minutes after boot.
        // so don't add colours until 10 minutes after system start.
		if s.Uptime < (10 * time.Minute) {
			return out
		}

		switch {
            case s.Loads[0] > 128, s.Loads[2] > 64:
                out.Urgent(true)
            case s.Loads[0] > 64, s.Loads[2] > 32:
                out.Color(colors.Scheme("bad"))
            case s.Loads[0] > 32, s.Loads[2] > 16:
                out.Color(colors.Scheme("degraded"))
		}
		return out
	})

    // Free RAM
	freeMem := meminfo.New().Output(func(m meminfo.Info) bar.Output {
		used_memory := 100 - ((m["MemAvailable"] / m["MemTotal"]) * 100)

        out := outputs.Pango(
            pango.Icon("mdi-memory"),
            spacer,
            pango.Textf("%0.2f%%", used_memory),
        )

		switch {
            case used_memory >= 95:
                out.Urgent(true)
            case used_memory >= 80:
                out.Color(colors.Scheme("bad"))
            case used_memory >= 65:
                out.Color(colors.Scheme("degraded"))
            case used_memory >= 50:
                out.Color(colors.Scheme("good"))
		}
		return out
	})

    // CPU Temperature
	temp := cputemp.New().RefreshInterval(2 * time.Second).Output(func(temp unit.Temperature) bar.Output {
        out := outputs.Pango(
            pango.Icon("mdi-fan"),
            spacer,
            pango.Textf("%2d℃", int(temp.Celsius())),
        )
        switch {
            case temp.Celsius() > 90:
                out.Urgent(true)
            case temp.Celsius() > 80:
                out.Color(colors.Scheme("bad"))
            case temp.Celsius() > 70:
                out.Color(colors.Scheme("degraded"))
        }
        return out
    })

    // Keyboard layout
    keyboard := xkbmap.New("us", "it").Output(func(layout keyboard.Layout) bar.Output {
		return outputs.Pango(
            pango.Icon("mdi-keyboard"),
            spacer,
            pango.Textf("%s", strings.ToUpper(layout.Name)),
        )
    })

    // Ethernet widget
    ethernet := netinfo.New().Output(func(s netinfo.State) bar.Output {
        // Check only for ethernet interfaces
        if strings.HasPrefix(s.Name, "enp") {
            if len(s.IPs) > 0 {
                return outputs.Pango(pango.Icon("mdi-lan-connect"))
            } else {
                return outputs.Pango(pango.Icon("mdi-lan-disconnect"))
            }
        } else {
            return nil
        }
    })

    // Wifi widget
    wifi := wlan.Any().Output(func (i wlan.Info) bar.Output {
        switch {
            case i.Connected():
                return outputs.Pango(pango.Icon("mdi-wifi-strength-4"))
            case i.Connecting():
                return outputs.Pango(pango.Icon("mdi-wifi-strength-1-alert"))
            case !i.Connected():
                return outputs.Pango(pango.Icon("mdi-wifi-strength-off"))
            default:
                return nil
        }
    })

    // Mediaplayer widget
    mediaplayer := media.Auto("chromium*").Output(func(m media.Info) bar.Output {
        if !m.Connected() || m.Stopped() {
            return nil
        }

        out := new(outputs.SegmentGroup)
        out.Append(outputs.Pango(pango.Icon("mdi-skip-previous")).OnClick(ifLeft(m.Previous)))

        if m.Playing() {
            out.Append(outputs.Pango(pango.Icon("mdi-pause")).OnClick(ifLeft(m.Pause)))
        } else {
            out.Append(outputs.Pango(pango.Icon("mdi-play")).OnClick(ifLeft(m.Play)))
        }

        out.Append(outputs.Pango(pango.Icon("mdi-skip-next")).OnClick(ifLeft(m.Next)))
        return out
    })

	group, _ := collapsing.Group(temp, freeMem, loadAvg, keyboard)

	panic(barista.Run(
		group,
        mediaplayer,
		volume_level,
        wifi,
        ethernet,
		battery_level,
        localdate,
		localtime,
	))
}
