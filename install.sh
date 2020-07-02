#!/usr/bin/env bash

# specify your bashrc/zshrc/bash_profile
shell_file=".bash_profile"

if [[  -d "flutter" ]]; then
  echo "flutter is installed"
  flutter --version
else
  # remove previous repo
  rm -rf ./flutter
  # only download the latest stable version
  git clone https://github.com/flutter/flutter.git -b stable --depth 1
  # append flutter bin to env path
  echo "# adding flutter support at `date`" >> ~/"$shell_file"
  echo "export PATH=\"\$PATH:`pwd`/flutter/bin\"" >> ~/"$shell_file"
  echo "your $shell_file has been modified to include path support for flutter"
fi

echo "precaching essential libraries"
# the followig will trigger binary download and install
flutter precache 

# show any missing dependencies
echo "Some additional dependencies you might want to install on your own"
flutter doctor

echo "installing CocoaPods, used for pushing apps to a physical ios device"
sudo gem install cocoapods
pod setup

