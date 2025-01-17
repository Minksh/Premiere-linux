# Premiere-linux
Bash script/guide for running Adobe Premiere on Linux distributions based on https://forum.mattkc.com/viewtopic.php?t=337 (Thanks Lego Island guy)

# A Windows 10 install / or files from the system32 folder are required.

## What's working?

- [x] Mercury Playback Engine (Partial) OpenCL on AMD/Intel(?)/Nvidia(?) GPUs (Nvidia should use CUDA instead) (Check the forum link)
- [x] Most of the user interface (Although it is a bit slow in certain tabs)
- [ ] Hardware encoding for H.264 and H.265 (on export)

#### Keep in mind this script is only tested for Adobe Premiere v24.0.3.2, no Adobe, nor Microsoft files are provided on this page!
#### Adobe Premiere must be installed using Windows since the installer does not like Wine ;(

## I ran the script, what now?
Ensure the winetricks package is installed.
If your wine path differers from the default ~/.wine/ run the follwing command:

```sh
export WINEDIR=/my/wine/dir/
```

Then in the same terminal run 

```sh
winetricks dxvk gdiplus fontsmooth=rgb corefonts
```
Finally run 

```sh
winecfg
```
And add the following DLL overrides

![image](https://github.com/user-attachments/assets/03b2e869-c43f-4a6f-a343-4aadefe88c13)

You are now ready to use OpenCL, just don't forget to enable it under File> Project settings > General

![image](https://github.com/user-attachments/assets/3ecb3c9c-57b8-41aa-b8ad-99db93d561b2)

## I found X workaround for Y issue!

Please post it to the issues tab! I will update the guide and/or install script!

# Q&A

## Why do you use the opengl32 dll from Windows? 
The builtin version of opengl32 may cause non functional video previews. 



