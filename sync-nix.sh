#!/run/current-system/sw/bin/bash

# Pull and Push dotfiles script #
set -euo pipefail

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Pull nix-config from /etc/nixos to repo
pull_nix_config() {
	echo -e "${YELLOW}Pulling nix-config from /etc/nixos...${NC}"

	if [ -d /etc/nixos ]; then
		rm -rf nixos
		cp -r /etc/nixos .
		rm nixos/flake.lock
		echo -e "${GREEN}✓ nix-config pulled successfully${NC}"
	else
		echo -e "${RED}✗ Error: /etc/nixos directory not found${NC}"
		return 1
	fi
}

# Push nix-config from repo to /etc/nixos
push_nix_config() {
	echo -e "${YELLOW}Pushing nix-config to /etc/nixos...${NC}"

	COMMIT_FILE="/etc/nixos/.commit"
	REPO_NIXOS="./nixos"
	SHOULD_UPDATE=false

	# Check if repo nixos directory exists
	if [ ! -d "$REPO_NIXOS" ]; then
		echo -e "${RED}✗ Error: ./nixos directory not found in repo${NC}"
		return 1
	fi

	# Check if .commit file exists
	if [ ! -f "$COMMIT_FILE" ]; then
		# File doesn't exist - get short commit hash and create it
		echo -e "${YELLOW}No .commit file found, creating one...${NC}"

		# Get short commit hash
		SHORT_COMMIT=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown")
		echo "$SHORT_COMMIT" >"$COMMIT_FILE"

		# Copy new config to /etc/nixos
		cp -r "$REPO_NIXOS"/* /etc/nixos/
		echo -e "${GREEN}✓ .commit file created with: $SHORT_COMMIT${NC}"
		echo -e "${GREEN}✓ nix-config pushed to /etc/nixos${NC}"
		SHOULD_UPDATE=true
	else
		# File exists - compare commit hashes
		echo -e "${YELLOW}Comparing commit hashes...${NC}"

		STORED_COMMIT=$(cat "$COMMIT_FILE")
		CURRENT_COMMIT=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown")

		if [ "$CURRENT_COMMIT" = "$STORED_COMMIT" ]; then
			# Commits match - verify /etc/nixos has no changes
			echo -e "${GREEN}✓ Commit hashes match ($CURRENT_COMMIT)${NC}"
			echo -e "${YELLOW}Checking for changes in /etc/nixos...${NC}"

			DIFF_OUTPUT=$(diff -r "$REPO_NIXOS" /etc/nixos --exclude=.commit --exclude=flake.lock 2>&1 || true)

			if [ -n "$DIFF_OUTPUT" ]; then
				echo -e "${RED}✗ Differences found between repo and /etc/nixos:${NC}"
				echo -e "${RED}$DIFF_OUTPUT${NC}"
				echo -e "${RED}✗ Aborting push operation${NC}"
				return 1
			else
				echo -e "${GREEN}✓ Configurations are identical${NC}"
				echo -e "${GREEN}✓ nix-config already synced${NC}"
			fi
		else
			# Commits don't match - current commit is newer
			echo -e "${YELLOW}Current commit ($CURRENT_COMMIT) differs from stored commit ($STORED_COMMIT)${NC}"
			echo -e "${YELLOW}Updating .commit file and syncing /etc/nixos...${NC}"

			# Update the commit file with current commit
			echo "$CURRENT_COMMIT" >"$COMMIT_FILE"

			# Copy new config to /etc/nixos
			cp -r "$REPO_NIXOS"/* /etc/nixos/
			echo -e "${GREEN}✓ .commit file updated to: $CURRENT_COMMIT${NC}"
			echo -e "${GREEN}✓ nix-config pushed to /etc/nixos${NC}"
			SHOULD_UPDATE=true
		fi
	fi

	# Launch nix-update only if we made changes
	if [ "$SHOULD_UPDATE" = true ]; then
		echo -e "${YELLOW}Launching nix-update...${NC}"

		# Alias: nix-update
		sudo nix flake update --flake /etc/nixos && sudo nixos-rebuild switch --upgrade --accept-flake-config --flake /etc/nixos && flatpak update -y
	fi
}

# Main script logic
main() {
	if [ $# -eq 0 ]; then
		echo "Usage: $0 <command>"
		echo ""
		echo "Commands:"
		echo "  pull    - Pull nix-config from /etc/nixos"
		echo "  push    - Push nix-config to /etc/nixos and run nix-update"
		return 1
	fi

	case "$1" in
	pull)
		pull_nix_config
		;;
	push)
		push_nix_config
		;;
	*)
		echo -e "${RED}✗ Unknown command: $1${NC}"
		echo "Available commands: pull, push"
		return 1
		;;
	esac
}

main "$@"
