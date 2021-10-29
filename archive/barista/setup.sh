# Clone repository
if [ ! -d "barista" ]; then
    git clone git@github.com:soumya92/barista.git
fi

# Copy custom configuration
mkdir -p barista/mybar
cp mybar.go barista/mybar
cd barista

# Get golang sources
go get github.com/martinohmann/barista-contrib/modules/keyboard
go get barista.run/modules/volume/pulseaudio

# Setup the barista.run package
go get barista.run

# Edit build.sh and change TARGET_FILE
sed -i 's%TARGET_FILE=[^$]*%TARGET_FILE="mybar/mybar.go"%' build.sh

# Build the bar
./build.sh -o moe-bar -i mybar/mybar.go
chmod +x moe-bar
sudo mv moe-bar /usr/bin/moe-bar

# Clean up
rm -r mybar

# Restart i3
i3-msg restart
