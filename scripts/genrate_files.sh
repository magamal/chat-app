#!/bin/bash
cd ..
excluded=("android/" "web/" "ios/" "linux/" "macos/" "assets/" "build/" "scripts/" "windows/" "test/")
for d in */; do    # Check if the directory name is in the exclusion list
   if [[ " ${excluded[@]} " =~ " $d " ]]; then
     continue  # Skip excluded folder
      fi
    cd "$d"
    echo "$d"
    flutter clean
    flutter pub get
    flutter pub run build_runner build --delete-conflicting-outputs
    cd ..
done