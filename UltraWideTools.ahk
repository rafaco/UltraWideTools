;
;   Copyright 2021 Rafael Acosta Alvarez
;    
;   Licensed under the Apache License, Version 2.0 (the "License");
;   you may not use this file except in compliance with the License.
;   You may obtain a copy of the License at
;    
;        http://www.apache.org/licenses/LICENSE-2.0
;    
;   Unless required by applicable law or agreed to in writing, software
;   distributed under the License is distributed on an "AS IS" BASIS,
;   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;   See the License for the specific language governing permissions and
;   limitations under the License.


; Auto-execute section
    #NoEnv                          ; Recommended for performance and compatibility with future AutoHotkey releases.
    ;#Warn                          ; Enable warnings to assist with detecting common errors.
    SendMode Input                  ; Recommended for new scripts due to its superior speed and reliability.
    #SingleInstance Force           ; Only one instance
    #MaxThreadsPerHotkey 1          ; Only one thread
    
    ;; Metadata
    ScriptVersion       := "v1.0.0"
    ScriptTitle         := "UltraWideTools"
    ScriptDescription   := "This application allows to manage window sizes in ultra wide monitor"
    ProjectDescription  := "This project is open source project and it's licensed under Apache 2.0. Our source code and additional informations can be found at our Github repository"
    ScriptSite          := "https://github.com/rafaco/UltraWideTools"
    
return ; End of auto-execute section


; Labels

; Shortcut: Win + Del --> Make active window the Left window in a 3 column layout
#Del::
    ThreeColumnsArrangement(1)
    return

; Shortcut: Win + End --> Make active window the Center window in a 3 column layout
#End::
    ThreeColumnsArrangement(2)
    return

; Shortcut: Win + PageDown --> Make active window the Right window in a 3 column layout
#PgDn::
    ThreeColumnsArrangement(3)
    return


; Functions

ThreeColumnsArrangement(columnPosition)
{
    activeWindowId := GetActiveWindowId()
    RestoreWindow(activeWindowId)
    activeWindowMonitor := GetMonitorContainigWindow(activeWindowId)
    dispositions := GetDispositionProportions(columnPosition)
    ProportionallyMaximize(activeWindowId, activeWindowMonitor, dispositions)
}

GetActiveWindowId()
{
    WinGet, active_id, ID, A
    return active_id
}

RestoreWindow(windowId)
{
    WinGet, maximizedStatus, MinMax, ahk_id %windowId%
    if (maximizedStatus != 0){
        WinRestore, ahk_id %windowId%
    }
}

GetMonitorContainigWindow(windowId)
{
  SysGet, numberOfMonitors, MonitorCount
  WinGetPos, winX, winY, winWidth, winHeight, ahk_id %windowId%
  winMidX := winX + winWidth / 2
  winMidY := winY + winHeight / 2
  Loop %numberOfMonitors%
  {
    SysGet, monArea, Monitor, %A_Index%
    ;MsgBox, Monitor %A_Index%: %monAreaLeft% -> %monAreaRight%
    if (winMidX > monAreaLeft && winMidX < monAreaRight && winMidY < monAreaBottom && winMidY > monAreaTop)
      return A_Index
  }
  return 0
}

GetDispositionProportions(columnPosition)
{
    if (columnPosition = 1) {
        return Array({margin: 0, width: 1/3}
                    ,{margin: 0, width: 1/4})
    }
    else if (columnPosition = 2) {
        return Array({margin: 1/3, width: 1/3}
                    ,{margin: 1/4, width: 1/2})
    }
    else if (columnPosition = 3) {
        return Array({margin: 2/3, width: 1/3}
                    ,{margin: 3/4, width: 1/4})
    }
}

ProportionallyMaximize(windowId, monitorPosition, dispositions){
    SysGet, boundingCoordinates, MonitorWorkArea, monitorPosition
    resolutionWidth     := boundingCoordinatesRight - boundingCoordinatesLeft
    resolutionHeight    := boundingCoordinatesBottom - boundingCoordinatesTop

    evenMargin          := Floor(dispositions[1].margin * resolutionWidth)
    evenWidth           := Floor(dispositions[1].width * resolutionWidth)
    WinGetPos, winX, winY, winWidth, winHeight, ahk_id %windowId%
    
    isEven := (winX = evenMargin) AND (winY = 0) AND (winWidth = evenWidth) AND (winHeight = resolutionHeight)
    if (isEven){
        wideMargin      := Floor(dispositions[2].margin * resolutionWidth)
        wideWidth       := Floor(dispositions[2].width * resolutionWidth)
        WinMove, ahk_id %windowId%, , wideMargin, 0, wideWidth, resolutionHeight
        return
    }

    WinMove, ahk_id %windowId%, , evenMargin, 0, evenWidth, resolutionHeight
}
