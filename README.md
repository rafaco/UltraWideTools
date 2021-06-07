# UltraWideTools
<p align="center">
  <a href="https://www.microsoft.com/es-es/windows" alt="Operative System">
      <img src="https://img.shields.io/badge/Operative_System-Windows-blue.svg?style=flat-square"/></a>
  <a href="https://www.autohotkey.com" alt="Powered by">
      <img src="https://img.shields.io/badge/Powered_by-AutoHotKey-green.svg?style=flat-square"/></a>
  <a href="https://git.io/UMB" alt="ShortLink">
      <img src="https://img.shields.io/badge/ShortLink-git.io%2FUMB-blueviolet.svg?style=flat-square"/></a>
</p>

**This application allows to arrange your windows in a three columns layout by using keyboard shortcuts**

Standard Windows shortcuts for the arrangement of your windows (```Win + Arrows```) only provide halfs and quarters layout, but it lack a three columns layout. Nowadays ultra wide and super ultra wide monitors usage are getting extended, and in this kind of monitor a three columns layout is specially usefull.

This script add 3 shortcuts to your Windows to directly arrange the active window into a column of a 3 columns layout: ```Win + Del```, ```Win + End``` and ```Win + PageDown```.

- The shortcuts arrange the active windows. To activate a window just click it or use ```Alt + Tab```.
- Three columns, one shortcut for each column:
    - Left column shortcut: ```Win + Del```
    - Center column shortcut: ```Win + End```
    - Right column shortcut: ```Win + PageDown```
- Two distributions, press the same shortcut again to change it for that column:
    - ```Even```: 33% - 33% - 33%
    - ```Wide```: 25% - 50% - 25%
- Values are dinamically calculated using your monitor size
- Multiple monitor are supported

## Layouts
### Even distribution

<table>
<tr>
<th align="center">
<img width="294" height="1">
<p> 
<small>
Left Column (33%)
</small>
</p>
</th>
<th align="center">
<img width="294" height="1">
<p> 
<small>
Center Column (33%)
</small>
</p>
</th>
<th align="center">
<img width="294" height="1">
<p> 
<small>
Right Column (33%)
</small>
</p>
</th>
</tr>
<tr>
<td align="center">
  
```Win + Del```
  
</td>
<td align="center">
  
```Win + End```
  
</td>
<td align="center">
  
```Win + PageDown```
  
</td>
</tr>
</table>

### Wide center distribution

<table>
<tr>
<th align="center">
<img width="220" height="1">
<p> 
<small>
Left Column (25%)
</small>
</p>
</th>
<th align="center">
<img width="442" height="1">
<p> 
<small>
Center Column (50%)
</small>
</p>
</th>
<th align="center">
<img width="220" height="1">
<p> 
<small>
Right Column (25%)
</small>
</p>
</th>
</tr>
<tr>
<td align="center">
  
2x ```Win + Del```
<br>  
or ```Win + Del + Del```
  
</td>
<td align="center">
  
2x ```Win + End```
<br>  
or ```Win + End + End```
  
</td>
<td align="center">
  
2x ```Win + PageDown```
<br>  
or ```Win + PageDown + PageDown```
  
</td>
</tr>
</table>

# Set up

## Download a build

For a quick start, just **download** ```UltraWideTools.exe``` from our [latest release](https://github.com/rafaco/UltraWideTools/releases/latest):

<p align="center">
    <a href="https://github.com/rafaco/UltraWideTools/releases/latest/download/UltraWideTools.exe" alt="Latest Download">
        <img src="https://img.shields.io/badge/Latest_Download-UltraWideTools.exe-brightgreen.svg?style=for-the-badge&logo=github"/></a>
</p>

Windows will alert you about the risks of running an exe file from an "Unknown source", because I dont pay for an official Microsoft certificate (around 300-400$/year). This doesn't mean that a virus has been found and you are not adding an exception to your antivirus by accepting this dialog. Your antivirus will keep working in background and it will alert you later on in case a virus get found, what should never happen.

## Build your own exe

To avoid previous inconvenience, you can always **generate your own exe** from our sources. An exe file generated on your PC are not considered from "Unknown source" and you will not recive any alert when running it for the first time. This is easier than it sound and you dont need any developer/coding skills to do it:

1. Clone [this repository](https://github.com/rafaco/UltraWideTools.git) in a local folder on your PC.
2. Download and install [AutoHotKey for Windows](https://www.autohotkey.com/) in your PC.
3. Open Ahk2Exe.exe from the installation folder or from Start->Programs->AutoHotkey->"Convert .ahk to .exe".
4. Select our script file as source ([UltraWideTools.ahk](https://github.com/rafaco/UltraWideTools/blob/master/UltraWideTools.ahk)), any local folder as destination and our icon as custom icon ([images/icon.ico](https://github.com/rafaco/UltraWideTools/blob/master/images/icon.ico)).
5. Press 'Convert' and your exe will be created in your destination folder.

## Auto run on window startup

Simply add a shortcut to our exe file in your Windows 'Startup' folder: ```%appdata%\Microsoft\Windows\Start Menu\Programs\Startup```

Do NOT set the shortcut to run as admin, it's not needed and Win10 will not run it on startup in that case.


# Usage

1. Run ```UltraWideTools.exe``` on your PC. Our icon will appear in your system tray (in the right-side of the Windows Taskbar)
2. Activate any of your windows. Just click on it or use ```Alt + Tab```
3. Press ```Win + Del```, ```Win + End``` or ```Win + PageDown``` to position that windows in the left, center or right column. It will use ```Even``` distribution.
4. Press the same icon twice to select ```WideCenter``` distribution, where the center column is wider and the sides are thiner
5. Activate any other windows and repeat it but using another column position


# Contributing
There are many ways to contribute starting from giving us a GitHub :star:, recommending this library to your friends :loudspeaker: or sending us your [feedback/bug/request](https://github.com/rafaco/UnlimitedMultiBattles/issues/new) :love_letter:. Pull requests are more then welcome :nerd_face:.


# License
```
Copyright 2021 Rafael Acosta Alvarez

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
