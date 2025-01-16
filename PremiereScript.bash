#!/bin/bash

# Bash script for running Premiere on Linux.

# Directory info
echo "IMPORTANT: Ensure that you know the paths to your Wine system32 directory, Premiere Pro installation, and Windows system32 directory."
echo "Default Wine system32 directory is usually: ~/.wine/drive_c/windows/system32/"
echo "Modify the paths accordingly if your setup differs."
echo

# Prompt for Wine system32 directory
read -p "Enter the Wine system32 directory path [Default: ~/.wine/drive_c/windows/system32/]: " wine_system32_dir
wine_system32_dir=${wine_system32_dir:-~/.wine/drive_c/windows/system32/}

# Calculate the root Wine directory
wine_root_dir=$(dirname "$wine_system32_dir")

# Prompt for Premiere Pro installation directory
read -p "Enter the Premiere Pro installation directory [Default: c:/premiere_pro]: " premiere_dir
premiere_dir=${premiere_dir:-c:/premiere_pro}
if [ ! -d "$premiere_dir" ]; then
  echo "Error: Directory '$premiere_dir' does not exist. Exiting."
  exit 1
fi

# Prompt for Windows system32 directory
read -p "Enter the Windows system32 directory path [Default: /run/media/username/Windows/System32/]: " windows_system32_dir
windows_system32_dir=${windows_system32_dir:-/run/media/username/Windows/System32/}
if [ ! -d "$windows_system32_dir" ]; then
  echo "Error: Directory '$windows_system32_dir' does not exist. Exiting."
  exit 1
fi

# Premiere Pro modifications
echo "Modifying Premiere Pro installation..."

# icuuc69.dll modification
if [ -f "$premiere_dir/icuuc69.dll" ]; then
  cp "$premiere_dir/icuuc69.dll" "$premiere_dir/icuuc.dll"
  echo "Copied and renamed icuuc69.dll to icuuc.dll"
else
  echo "Warning: icuuc69.dll not found in $premiere_dir"
fi

# icuin69.dll modification
if [ -f "$premiere_dir/icuin69.dll" ]; then
  cp "$premiere_dir/icuin69.dll" "$premiere_dir/icuin.dll"
  echo "Copied and renamed icuin69.dll to icuin.dll"
else
  echo "Warning: icuin69.dll not found in $premiere_dir"
fi

# Wine modifications
echo "Modifying Wine system32 directory..."

# Copy msxml3.dll
if [ -f "$windows_system32_dir/msxml3.dll" ]; then
  cp "$windows_system32_dir/msxml3.dll" "$wine_system32_dir"
  echo "Copied msxml3.dll from Windows to Wine system32"
else
  echo "Warning: msxml3.dll not found in $windows_system32_dir"
fi

# Copy msxml3r.dll
if [ -f "$windows_system32_dir/msxml3r.dll" ]; then
  cp "$windows_system32_dir/msxml3r.dll" "$wine_system32_dir"
  echo "Copied msxml3r.dll from Windows to Wine system32"
else
  echo "Warning: msxml3r.dll not found in $windows_system32_dir"
fi

# Copy opengl32.dll
if [ -f "$windows_system32_dir/opengl32.dll" ]; then
  cp "$windows_system32_dir/opengl32.dll" "$wine_system32_dir"
  echo "Copied opengl32.dll from Windows to Wine system32"
else
  echo "Warning: opengl32.dll not found in $windows_system32_dir"
fi

echo "All done!"
echo "Please carefully read the Github instructions before reporting issues!"
echo "As some additional steps are required!"
