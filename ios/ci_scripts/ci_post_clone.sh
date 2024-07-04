#!/bin/sh

# Fail this script if any subcommand fails.
set -e

# The default execution directory of this script is the ci_scripts directory.
cd $CI_PRIMARY_REPOSITORY_PATH # change working directory to the root of your cloned repo.

# Install Flutter using git.
git clone https://github.com/flutter/flutter.git --depth 1 -b stable $HOME/flutter
export PATH="$PATH:$HOME/flutter/bin"

# Install Flutter artifacts for iOS (--ios), or macOS (--macos) platforms.
flutter precache --ios

# Install Flutter dependencies.
flutter pub get

# Dynamically generate a .env file
echo "PURCHASES_APPLE_API_KEY=${PURCHASES_APPLE_API_KEY}" > $CI_PRIMARY_REPOSITORY_PATH/.env
echo "PURCHASES_GOOGLE_API_KEY=${PURCHASES_GOOGLE_API_KEY}" >> $CI_PRIMARY_REPOSITORY_PATH/.env
echo "SUPABASE_URL=${SUPABASE_URL}" >> $CI_PRIMARY_REPOSITORY_PATH/.env
echo "SUPABASE_KEY=${SUPABASE_KEY}" >> $CI_PRIMARY_REPOSITORY_PATH/.env
echo "STAMEN_KEY=${STAMEN_KEY}" >> $CI_PRIMARY_REPOSITORY_PATH/.env

# Install CocoaPods using Homebrew.
HOMEBREW_NO_AUTO_UPDATE=1 # disable homebrew's automatic updates.
brew install cocoapods

# Install CocoaPods dependencies.
cd ios && pod install # run `pod install` in the `ios` directory.

exit 0