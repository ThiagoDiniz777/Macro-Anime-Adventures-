/*

huge thanks to:
yuh for heavily inspiring  the macro + some functions
------------------------------------------------------------
credit to invalid for namek macro

Contributions:
base code: faxi
configs: keirahela

*/

#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\Lib\gui.ahk
#Include %A_ScriptDir%\Lib\FindText.ahk
#Include %A_ScriptDir%\Lib\OCR-main\Lib\OCR.ahk
#Include %A_ScriptDir%\Lib\WebhookOptions.ahk
#Include %A_ScriptDir%\Lib\keybinds.ahk

global MacroStartTime := A_TickCount

SendMode "Event"
RobloxWindow := "ahk_exe RobloxPlayerBeta.exe"
UnitExistence := "|<>*91$66.btzzzzzzyDzXlzzzzzzyDzXlzzzzzzyDzXlzzzyzzyDbXlUS0UM3UC1XlUA0UE30A1XlW4EXl34AMXlX0sbXXC80XVX4MbXX6A1U3UA0bk30ARk7UC0bk3UA1sDUz8bw3kC1zzbyszzzzzzzzbw1zzzzzzzzby3zzzzzzzzzzjzzzzzzU"
MaxUpgrade := "|<>*134$53.0000000007U3k00000TUDk00001XUsk000033XVU0000636300800A3M6TzwS0M3UDrjRa0k70S0AS61U40s0EMAD001U0k0Ty41331k1zwA6673k7zsQAAS7UTzkwsMQC0TzVzkk0M0Tz3zVk0kETy7z3k1VkzwTz7kX7nzzzzzzzzzzzzzzzzzzw"
MaxUpgrade2 := "|<>*146$47.D07U0001z0Tk000371lU00067z3zzzzw7w7zzzzs7kDzzzzk7UTzSzzUC0w0MwD081k0UkS00301U1w82663U3sMAAC7UDkssMwD0zVvkksQ0z3zVU0k0y7z3U1UUwDy7U33VszyDX6Dbzzzzzzzzzzzzzzzy"
MaxUpgrade3 := "|<>*91$49.Dk7s00004M3600006633000031X1U0001UP0nzr3kkD0PzynAM3UD06D3A0U70331a00301U1X20VVUs1lVUklsS1kkssMwD0kMSQAC70AA/u603036413U1UUn20Vs0ksNX0My4NqMTUDnzzlwU"
VoteStart := "|<>*95$38.ryzzzzlz7zlzwDVzwTzXszz7zsSC30Q7770E40klU410C8sklVXUACAM0w7X360T1s1kEbsz0Q40zDsTVUM"
LobbyText := "|<>*134$56.0000000000k00U10000T00y1w000Cs0RkvU003606AAM000lU1X36000AMzMwlswS36zyDwTzjslw7WD4ST6AS0M1k33lX7060A0MMPlkkVX366DwQS8sFkk3z772C4QC1zlkkV327UTw40M0k1wDz1UC0Q0z3zsQ7WD4TkzzzzzzzzwTzzzzzzzy7zzzzzzzzXzzzzzzzzszs"
AreasText := "|<>*108$36.zs007zyzztzzwTzzzzwTzTzzsA4613tA421/k4M0F3k4M4FXXUQ603bmy713zzzzzzU"
MatchmakeUI := "|<>*129$83.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzUzzzzzzzzzzzzz0zzzzzzzw7zzzw1zzzzzzzkDzzzs3zzzzzzzUTzzzs7zzzzzzz0zzzzkTzzzzzzy1zzzzzzzzzzzzw3zzzzzzzzzzzzs7zzzzzzzzzzzzkDy0Tw7UsDzzzzUTk0Ds7007zzzz0z00DUA007zzzy1w00D0M007zzzw3k00S0k00Dzzzs7U00Q1U00DzzzkC0S0s3060TzzzUQ1y0k60y0zzzz0s7w1UA1y1zzzy1kDs30M3w3zzzw3UTk60k7s7zy7k70TUA1UDkDzs70C0Q0s30TUTzk00S001k60z0zzU01w007UA1y1zz007w00D0M3w3zz00Dw00y0k7s7zz01zw03y1kDkDzzU7zy0Tw7UzkTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs"
CaptchaExistence := "|<>*100$131.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwDzzzzzzzs3zzzzzzzzzzzkDzzzzzzz01zzzzzzy7zzzUTzzzzzzs00zzzzzzs7zzz0zzzzzzzU01zzzzzzkDzzy1zzzzzzy003zzzzzzUTzzw3zzzzzzs007zzzzzz0zzzs7zzzzzzk7wTzzzzzy1zyTkDzzzzzz0Tzz0UsEDk0DU7UEDz0Uzy1zzw01U0DU0S0300Dw01zw3zzk0300C00s0600Dk03zsDzz00600C01U0A00T007zkTzw00A00A0200M00Q00DzUzzs30M3US1w1lk70s30Tz0zzkD0kDUw3s7zUT1kD0zy1zzUz1UT1s7kTz0y3Uz1zw1zz1w30y3kDUzy1w31w3zw1zC1s61s7UT0zw3s61s7zs0sA00A00D0y0Es7kA00Dzs00A00M00y0C00kDUQ00Tzs00M00k01y0A01UT0s00zzs00s01U07w0Q030y3s01zzs03s0300zw1w0C1w7s03zzw0TwCC1rzy3y1y7wDwCDzzzzzzzw3zzzzzzzzzzzzzzzzzzzzs7zzzzzzzzzzzzzzzzzzzzkDzzzzzzzzzzzzzzzzzzzzUTzzzzzzzzzzzzzzzzzzzz0zzzzzzzzzzzzzzzzzzzzy3zzzzzzzzzzzzzzzzzzzzy7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
Matchmaking := "|<>*93$73.zzzzzzzzzzzzzzlzzzsszzzzk08zzzwATzzzs04Tzzy6Dzzzw03zzzz3zzzzy7zzzzzVzzzzz3zX4DwElW7w8U7lU3s0Mk1w0E1sk0w0AM0Q080wM0A06A06040SAC6736737W7z6D37VX3VXl3zX7VVklXkkkVzlXkk0MlsM0EzslsQ0AMwC08zwMwC06AS7U4TyATDlb6DbxXzzzzzzzzzzzlzzzzzzzzzzs0zzzzzzzzzzw0zzzzzzzzzzy0zzzzzzzzzzzty"
AutoAbility := "|<>*83$21.zzzzzzzwD4S0kXl28wS03Xk0QSH7nWMy0n7sCQzzzzU"
ClaimText := "|<>*127$71.00000000000000A7s01y000007zTs07w00000Tzlk0AQ00003k7VU0MM0000D03300kk0000Q0667zXzsw01k0AAzzzzzy031ysTrjTSyS0C7zky0AA0EQ0QCTVs0MM00Q0ss73U0kk00M1lkC711VVUUk3VnwC73333VU73zsQS666737y3tksQAAAC7zy01Uk0MMMQDzy030k0kkksTzy061U1VVVkzzz0y3kX77XXzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
LoadingScreen := "|<>*87$90.U07zzzzzzzzzzzz000Tzzzzzzzzzzz0007zzzzzzzzzzz0001zzzzzzzzzzz0000zzzzzzzzzzz0000Tzzzzzzzzzz0000Dzzzzzzzzzz00007zzzzzzzzzz00003zzzzzzzzzz0Ds01zzzzzzzzzz0Dy01zzzzzzzzzz0DzU0y0zw1y0s1z0Dzk0w0zw0w0k0T0Dzs0w0Tw0w000D0Dzs0Q0Tw0w00070Dzw0Q0Tw0w00030Dzw0Q0Tw0w00030Dzw0Q0Tw0w00010Dzw0Q0Tw0w00010Dzw0Q0Tw0w03000Dzw0Q0Tw0w0Dk00Dzw0Q0Tw0w0Ts00Dzs0Q0Tw0w0Ts00Dzs0w0Tw0w0Tw00Dzk0w0Tw0w0Tw00DzU0w0Ts0w0Tw00Dz01w0Ds0w0Tw00Dw01y07k0w0Tw000003y0000w0Tw000007y0000w0Tw00000Dz0000w0Tw00000Dz0000w0Tw00000zzU000w0Tw00001zzk000w0Tw00003zzs040w0Tw0000Dzzw0A0y0zw0U01zzzzUy1z1zy1U"
ReplayText := "|<>*101$71.Tk0000Dk0001zs0000FU00000Q0001V000000A00032000000M00064000000Py7zA8TzwD3kw7NbMFnD8m4Vk3U3ka08P0D30703VM0ES0Q406033U0ksE08QA46711kkU0k0MQAC73U10100ksMMC7U60107UkksQB08D23j01Uk0P0kK40C070k0m10Y40A0O1U1a63AQ0sFa3kXAAyDjzky7xzwEkkA7tV01U0VVU000320000220000640000AA0000AM0000AE0000DU0000TU0000600000C1"
DeathText := "|<>*100$22.zzzzUzUw3w3l7l6ASAMtstXbXaASAQFgFkAEDUlUzzzzU"
Text := "|<>*30$71.0000007zzzzy000000Dzzzzw000000Tzzzzs000000zzzzzk000001zzzzzU000003zzzzz0000007zzzzy000000Dzzzzw000000Tzzzzs000000zzzzzk000001zzzzzU000003zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
HauntedAcademy := "|<>*87$137.zzzzzzzzzzzwzzzzzzzbzzzwSDzzzzyDzzkzszzzzy7zzzswTzzzzwTzzVzlzzzzwDzzzlszzzzzszzz3z1zzzzsTzzzXlsaSN7UQ7k7y3wDWS0sCFz03UAQE20k70Ds3kC0s10A0y060MsU410A0Tl70M1U60M1w0AMll6CCAMlz26BlX6AMl3swFlXWCAM0lXy08T76AE1X7lslX64QMszX7s08z6AMkD6DXlU608skkr0DlwE60M1VCAT7XUC0FlUU70T3sEC0s30AMyTbWS9bbVkT4zDtky9sbUtn"
cancel_boton := "|<>*138$82.zzwDzzzzzzzszzzz0DzzzzzzzXzzzs0TzzzzzzyDzzz01zzzzzzzszzzsDjzzzzrz7XzzzVzw0k3w3k6DzzyDzU307U60Mzzzszw0A0A0kEXzzzXzkkkkkz72DzzyDz7X7X7w08zzzsTwQASATk1XzzzkMk0lskX3y7zzz01037X040MDzzy060ASC0M1Uzzzy1y8lsy7k73zU"
verificaçao_de_caminho := 0
global lose_streak := 0
global DesiredRuns := 1
global RunCount := 0

SetupMacro() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    if WinExist(RobloxWindow) {
        WinActivate(RobloxWindow)
        Sleep 50
        WinMove(27, 15, 800, 600, RobloxWindow)
        Sleep 50
    }
    if WinExist("Taxi Winter Event Farm") {
        Sleep 50
        WinActivate("Taxi Winter Event Farm")
        Sleep 100
    }
}

InitializeMacro() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    global MacroStartTime := A_TickCount

    ; Reiniciar contador

    AddToLog("Iniciando macro - Execuções restantes: " DesiredRuns)


    if WinExist("Taxi Auto-Challenge") {
        WinActivate("Taxi Auto-Challenge")
    }

    if WinExist(RobloxWindow) {
        WinMove(27, 15, 800, 600, RobloxWindow)
        WinActivate(RobloxWindow)
        Sleep 100
    }
    else {
        MsgBox("You must have ROBLOX open in order to start the macro (microsoft roblox doesnt work)", "Error T4", "+0x1000",)
        return
    }

    if (ok := FindText(&X, &Y, 746, 476, 862, 569, 0, 0, AreasText)) {
        GoToRaids()
    }
    else {
        MsgBox("You must be in the lobby with default camera angle to start the macro.", "Error T3", "+0x1000",)
        return
    }
}

SetDefaultKeyboard(localeID) {
    static SPI_SETDEFAULTINPUTLANG := 0x005A, SPIF_SENDWININICHANGE := 2
    Lan := DllCall("LoadKeyboardLayout", "Str", Format("{:08x}", LocaleID), "Int", 0)
    binaryLocaleID := Buffer(4, 0)
    NumPut("UInt", LocaleID, binaryLocaleID)
    DllCall("SystemParametersInfo", "UInt", SPI_SETDEFAULTINPUTLANG, "UInt", 0, "Ptr", binaryLocaleID, "UInt", SPIF_SENDWININICHANGE)
    for hwnd in WinGetList()
        PostMessage 0x50, 0, Lan, , hwnd
}

BetterClick(x, y, LR := "Left") { ; credits to yuh for this, lowk a life saver
    MouseMove(x, y)
    MouseMove(1, 0, , "R")
    MouseClick(LR, -1, 0, , , , "R")
    Sleep(50)
}

GoToRaids() {

    Sleep 500
    SendInput ("{Tab}")
    AddToLog("For support, make sure to click on the discord icon above")

    AddToLog("Iniciando macro - Execuções restantes: " DesiredRuns)
    if (RunCount >= DesiredRuns) {
        AddToLog("Execuções concluídas - Retornando ao lobby")
        AddToLog("Pressionando F3 10 vezes...")

        SendInput "{F3}"
        Sleep 2000

    }

    AddToLog("Attempting to go to raids...")

    ; go to play area
    BetterClick(89, 302) ; play
    Sleep 1000

    ; Segura a tecla 'a' por 2800ms
    SendInput ("{a down}")
    Sleep 2800
    SendInput ("{a up}")
    Sleep 1000
    ; Segura a tecla 's' por 2800ms
    SendInput ("{s down}")
    Sleep 2800
    SendInput ("{s up}")
    Sleep 800

    ; Clica na posição (478, 189) três vezes
    BetterClick(478, 189)
    Sleep 300
    BetterClick(478, 189)
    Sleep 300


    ; Envia o texto "Key (Cursed Womb)"
    Send("Key (Cursed Womb)")
    Sleep 3000
    AddToLog("teste2")
    
    

    ; Clica nas posições específicas
    BetterClick(214, 291)
    Sleep 150
    BetterClick(348, 376)
    Sleep 1000
    if (!ok:= FindText(&X,&Y,361, 542, 507, 596, 0, 0, cancel_boton)){
        AddToLog(" error: Key cursed")
        BetterClick(660, 200)
        SendInput ("{Tab}")
        
        
        GoToRaids()
    }   
    LoadedLoop()
    OnSpawnSetup()
    PressVoteStart()
    StartedLoop()
    TryPlacingUnits()
}


Replaying() {
    global RunCount, DesiredRuns

    ; Verificar antes de incrementar
    if (RunCount >= DesiredRuns) {
        AddToLog("Todas execuções concluídas! (" DesiredRuns "/" DesiredRuns ")")
        SoundBeep(1000, 500)
        return
    }


    AddToLog("Iniciando execução " RunCount "/" DesiredRuns)

    ; Código existente para reconectar
    loop {
        if (ok := FindText(&X, &Y, 10, 70, 350, 205, 0, 0, LoadingScreen)) {
            AddToLog("Carregando próxima fase...")
            break
        }
        if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart)) {
            break
        }
        Reconnect()
        Sleep 1000
    }
    if (RunCount >= DesiredRuns) {
        AddToLog("Execuções concluídas - Retornando ao lobby")
        AddToLog("Pressionando F3 10 vezes...")
        Loop 1 {
            SendInput "{F3}"
            Sleep 150 ; Pausa de 150ms entre cada pressionamento para evitar problemas
        }

    }
    ; Restante do código para nova fase
    LoadedLoop()
    StartedLoop()
    OnSpawnSetup()
    TryPlacingUnits()
}

StopMacro() {
    SaveLocal
    if ControlGetVisible(keybindsGui) {
        return
    }
    Reload()
}
; Define the rectangle coordinates
global startX := 200, startY := 290, endX := 450, endY := 200
global step := 50 ; Step size for grid traversal
global successfulCoordinates := [] ; Array to store successful placements
global successThreshold := 3 ; Number of successful placements needed
global Hillx := 0
global Hilly := 0

PlaceHillUnit(slot := 1) {
    global 
    global Hillx
    global Hilly
    SendInput(slot)
    Sleep 100
    PixelSearch(&Hx, &Hy, 400, 160, 600, 235, 0x00A000, 30)
    Sleep 100
    AddToLog(Hx)
    AddToLog(Hy)
    BetterClick(Hx, Hy)
    Sleep 100
    SendInput("q")

    if IsPlacementSuccessful() {
        Sleep 15
        Hillx := Hx
        Hilly := Hy
        return true
    }
    return false
}

PlaceUnit(x, y, slot := 1) {
    SendInput(slot)
    Sleep 50
    BetterClick(x, y)
    Sleep 50
    SendInput("q")

    ; Check if placement is successful
    if IsPlacementSuccessful() {
        Sleep 15
        return true
    }
    return false
}

IsPlacementSuccessful() {

    Sleep 3000
    if (ok := FindText(&X, &Y, 78, 182, 400, 451, 0, 0, UnitExistence)) {
        AddToLog("Placed unit successfully")
        BetterClick(329, 184) ; close upg menu
        return true
    }
    return false
}

#Requires AutoHotkey v2.0

#Include %A_ScriptDir%\Lib\Gdip_All.ahk

TryPlacingUnits() {
    global startX, startY, endX, endY, step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run

    x := startX ; Initialize x only once
    y := startY ; Initialize y only once

    ; Iterate through all slots (1 to 6)
    for slotNum in [1, 2, 3, 4, 5, 6] {
        enabled := "Enabled" slotNum
        enabled := %enabled%
        enabled := enabled.Value
        hill := "Hill" slotNum
        hill := %hill%
        hill := hill.Value
        placements := "Placement" slotNum
        placements := %placements%
        placements := placements.Text


        ; Skip if the slot is not enabled
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0

        if (hill = 1) {
            while (placementCount < placements) {
                if PlaceHillUnit(slotNum) {
                    placementCount++
                    successfulCoordinates.Push({ x: Hillx, y: Hilly })
                    AddToLog("Placed " placementCount "/" placements ".")
                }
                if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }
                BetterClick(210, 555) ; move mouse
                if ShouldStopUpgrading(1) {
                    AddToLog("Stopping due to finding lobby  condition.")
                    return Replaying()
                }
                Reconnect()
            }
        }

        ; Continue placement for the current slot
        if !(hill = 1) {
            while (placementCount < placements && y >= endY) { ; Rows
                while (placementCount < placements && x <= endX) { ; Columns
                    if PlaceUnit(x, y, slotNum) {
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y }) ; Track successful placements
                    }
                    if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                    {
                        BetterClick(373, 237)
                    }
                    BetterClick(565, 563) ; move mouse
                    if ShouldStopUpgrading(1) {
                        AddToLog("Stopping due to finding lobby  condition.")
                        return Replaying()
                    }
                    Reconnect()
                    x += step - 20 ; Move to the next column
                }
                if x > endX {
                    x := startX ; Reset x for the next row
                    y -= (-step - 25) ; Move to the next row
                }
            }
            Reconnect()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        Reconnect()
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}


UpgradeUnits() {
    global successfulCoordinates

    AddToLog("Beginning unit upgrades.")

    while true { ; Infinite loop to ensure continuous checking
        for index, coord in successfulCoordinates {

            AddToLog("passei pelo if")
            if CheckforNextButton() {
                global RunCount += 1
                AddToLog("deus e bom deu certo porra.")
                successfulCoordinates := []
                return GoToRaids()
            }

            if IsMaxUpgrade() {
                AddToLog("Max upgrade reached for: X" coord.x " Y" coord.y)
                successfulCoordinates.RemoveAt(index) ; Remove the coordinate
                continue ; Skip to the next coordinate
            }
            Sleep(2000)

            UpgradeUnit(coord.x, coord.y)
            Sleep(200)
            if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
            {
                BetterClick(373, 237)
            }
            BetterClick(565, 563) ; move mouse
            Reconnect()
        }

        ; If all units are maxed, still check for stopping condition
        if successfulCoordinates.Length = 0 {
            Reconnect()
            BetterClick(720, 510)
            if ShouldStopUpgrading() {
                AddToLog("Stopping due to finding return to lobby button.")
                return Replaying()
            }
            Sleep(2000) ; Prevent excessive looping

        }

        Reconnect()
    }
}


UpgradeUnit(x, y) {
    BetterClick(x, (y - 3))
    BetterClick(264, 363) ; upgrade
}

IsMaxUpgrade() {
    Sleep 500
    if (ok := FindText(&X, &Y, 142, 346, 406, 472, 0, 0, MaxUpgrade) or (ok := FindText(&X, &Y, 142, 346, 406, 472, 0, 0, MaxUpgrade2)) or (ok := FindText(&X, &Y, 142, 346, 406, 472, 0, 0, MaxUpgrade3)))
    {
        return true
    }
}

ShouldStopUpgrading(sleepamount := 300) {
    Sleep sleepamount
    if CheckForReplayButton() {
        if (WebhookCheckbox.Value = 1) {
            SendWebhook()
        }
        BetterClick(485, 115)
        return true
    }
}

OnSpawn() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    OnSpawnSetup()
}

LookDown() {
    MouseMove(400, 300)
    loop 20 {
        SendInput("{WheelUp}")
        Sleep 50
    }
    Sleep 200
    MouseGetPos(&x, &y)
    MouseMove(400, 300)
    SendInput(Format("{Click {} {} Left}", x, y + 150))

    loop 20 {
        SendInput("{WheelDown}")
        Sleep 50
    }
}

LoadedLoop() {
    AddToLog("Waiting to load in")
    loop {
        Sleep 1000
        if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart))
        {
            AddToLog("Loaded in")
            Sleep 1000
            break
        }
        Reconnect()
    }
    chat := ChatToSend.Value
    if (ChatStatusBox.Value = 1 && StrLen(chat) > 0) {
        AddToLog("Sending chat")
        SendChat()
    }
}

PressVoteStart() {
    sleep 1000
    BetterClick(350, 103) ; click yes
    BetterClick(350, 100) ; click yes
    BetterClick(350, 97) ; click yes
}

StartedLoop() {
    loop {
        Sleep 1000
        if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart))
        {
            continue
        }
        AddToLog("Game started")
        break
    }
}

LobbyLoop() {
    loop {
        Sleep 1000
        if (ok := FindText(&X, &Y, 746, 476, 862, 569, 0, 0, AreasText))
        {
            break
        }
        Reconnect()
    }
    AddToLog("Returned to lobby, going back to raids")
    return GoToRaids()
}

CheckForLobbyButton() {
    if (ok := FindText(&X, &Y, 273, 103, 482, 214, 0, 0, LobbyText))
    { if (RunCount >= DesiredRuns) {
        AddToLog("Execuções concluídas - Retornando ao lobby")
        AddToLog("Pressionando F3 10 vezes...")
        Loop 1 {
            SendInput "{F3}"
            Sleep 150 ; Pausa de 150ms entre cada pressionamento para evitar problemas
        }

    }
        return true
    }
}


Checkforloss() {
    if (ok := FindText(&X, &Y, 412 - 150000, 109 - 150000, 412 + 150000, 109 + 150000, 0, 0, DeathText))
    {
        return true
    }
    return false
}

CheckForReplayButton() {
    if (ok := FindText(&X, &Y, 273, 103, 482, 214, 0, 0, LobbyText)) {
        ; Verificar se atingiu o limite
        if (RunCount >= DesiredRuns) {
            AddToLog("Execuções concluídas - Retornando ao lobby")
            AddToLog("Pressionando F3 10 vezes...")
            Loop 1 {
                Sleep 2000
                AddToLog("alcançou o limit")
                SendInput "{F3}"
                Sleep 100 ; Pausa de 150ms entre cada pressionamento para evitar problemas
            }

        }
        return true
    }
    return false
}
CheckforNextButton() {
    NextButton := "|<>*124$49.70s000007ly0003s6AnU001y33Mk001X1VwNyCClkkSDzzjsyM77UQyM3A1XU4C81a0lU3040n40llk7VtX0M0w7lslkA0S3swMs6Dy0wCQS30C0C1yDVk277Uz7sw3bnszzzzzzzzzzzzzzzzzU"

    if (ok := FindText(&X, &Y, 355 - 150000, 441 - 150000, 355 + 150000, 441 + 150000, 0, 0, NextButton)) {
        AddToLog("fui chamado next button")


        AddToLog("Iniciando macro - Execuções restantes: " DesiredRuns)
        if (RunCount >= DesiredRuns) {
            AddToLog("Execuções concluídas - Retornando ao lobby")
            AddToLog("Pressionando F3 10 vezes...")
            Loop 1 {
                SendInput "{F3}"
                Sleep 150 ; Pausa de 150ms entre cada pressionamento para evitar problemas
            }

        }
        loop 5 {
            BetterClick(348, 391) ; next
            Sleep 200
        }
        Sleep 3000
        AddToLog("fui chamado next button pt2")
        if (RunCount >= DesiredRuns) {
            AddToLog("Execuções concluídas - Retornando ao lobby")
            AddToLog("Pressionando F3 10 vezes...")
            Loop 1 {
                SendInput "{F3}"
                Sleep 150 ; Pausa de 150ms entre cada pressionamento para evitar problemas
            }

        }
        loop 5 {
            BetterClick(335, 119) ; next
            Sleep 200
        }
        Sleep 30000
        return true
    }
    return false
}

SendChat() {
    SendInput("/")
    Sleep 250
    chat := ChatToSend.Value
    if (ChatStatusBox.Value = 1 && StrLen(chat) > 0) {
        for char in StrSplit(chat) {
            Send(char)
            Sleep(Random(100, 200))  ; Optional delay between each keypress
        }
    }
    Sleep 1200
    SendInput("{Enter}")
    Sleep 250
}

TPtoSpawn() {
    BetterClick(27, 574) ; setings
    Sleep 1000
    BetterClick(400, 287)
    Sleep 600
    loop 5 {
        Sleep 150
        SendInput("{WheelDown 1}") ; scroll
    }
    Sleep 600
    BetterClick(523, 221) ; tp to spawn
    Sleep 600
    BetterClick(582, 150) ; exit settings

}

DebugOCR() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    ocrResult := OCR.FromRect(266, 309, 603 - 266, 352 - 309, , 2)

    if ocrResult {
        BetterClick(414, 342)
        AddToLog("Captcha Detected: " ocrResult.Text)

        ; Clean up the captcha string
        captcha := StrReplace(ocrResult.Text, " ")  ; Remove spaces
        if (StrLen(captcha) <= 1 || RegExMatch(captcha, "[A-Za-z]")) {
            AddToLog("invalid captcha retrying")
        }

        ; Remove special characters like /, -, and .
        captcha := RegExReplace(captcha, "[/.\-_,]")

        ; Send each character
        Send(captcha)
        ;for char in StrSplit(captcha) {
        ;    Send(char)
        ;    Sleep(Random(25, 75))  ; Optional delay between each keypress
        ;}
    } else {
        AddToLog("NO CAPTCHA FOUND.")
    }
}

AntiCaptcha() {
    ; Perform OCR on the defined region directly
    ocrResult := OCR.FromRect(266, 309, 603 - 266, 352 - 309, , 2)

    ; Display OCR results
    if ocrResult {
        BetterClick(414, 342) ; Click to focus on captcha input
        AddToLog("Captcha Detected: " ocrResult.Text)

        ; Clean up the captcha string
        captcha := StrReplace(ocrResult.Text, " ")  ; Remove spaces
        if (StrLen(captcha) <= 1 || RegExMatch(captcha, "[A-Za-z]")) {
            AddToLog("invalid captcha retrying")
            BetterClick(584, 192) ; close captcha
            return
        }

        ; Remove special characters like /, -, and .
        captcha := RegExReplace(captcha, "[/.\-_,]")

        ; Send each character
        Send(captcha)
        ;for char in StrSplit(captcha) {
        ;    Send(char)
        ;    Sleep(Random(25, 75))  ; Optional delay between each keypress
        ;}
    } else {
        AddToLog("NO CAPTCHA FOUND.")
    }

    BetterClick(309, 386) ; select
    Sleep 1500
    BetterClick(383, 221)
    Sleep 500

    sleep 6000
    if (ok := FindText(&X, &Y, 10, 70, 350, 205, 0, 0, LoadingScreen)) {
        return
    }
    if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart)) {
        return
    }
    AddToLog("Walking to ensure the UI pops up again if it didnt matchmake")

    loop 2 {
        HoldKey("D", 400)
        HoldKey("A", 800)
        HoldKey("Space", 2000)
    }

    Sleep 1500
    if (ok := FindText(&X, &Y, 221, 206, 403, 355, 0, 0, MatchmakeUI))
    {
        AddToLog("Waiting for captcha cooldown then retrying")
        Sleep 6000
    }
    return
}

OnSpawnSetup() {
    global
    SendInput ("{Tab}")
    TPtoSpawn()
    Sleep 1000
    LookDown()
    Sleep 1000
    loop {
        Sleep 1000
        if PixelSearch(&Px, &Py, 385, 0, 430, 25, 0x091208) {
            AddToLog("Correct Angle")
            break
        }
        else {
            if PixelSearch(&Px, &Py, 757, 331, 824, 439, 0x091208, 10) {
                global verificaçao_de_caminho := 1  
                break
            }
            AddToLog("Incorrect Angle. Performing 90-degree turn.")
            ; Simulate pressing the "Left" key for a 90-degree turn
            SendInput("{Left down}")  ; Hold the "Left" key down
            Sleep 755                 ; Adjust this value to control the turn duration (90 degrees)
            SendInput("{Left up}")    ; Release the "Left" key

            ; Ensure the key is fully processed before proceeding
            KeyWait "Left"
            ; Optional: Add a delay after the turn if needed
        }
    }
    if (verificaçao_de_caminho = 0) {

        SendInput ("{d up}")
        Sleep 100
        SendInput ("{d down}")
        Sleep 5200
        SendInput ("{d up}")
        KeyWait "d"
    }
    else {
        SendInput ("{s up}")
        Sleep 100
        SendInput ("{s down}")  
        Sleep 5200
        SendInput ("{s up}")
        KeyWait "s"
        loop 3 {
            SendInput("{Left down}")  ; Hold the "Left" key down
            Sleep 750                 ; Adjust this value to control the turn duration (90 degrees)
            SendInput("{Left up}")    ; Release the "Left" key

            ; Ensure the key is fully processed before proceeding
            KeyWait "Left"
        }
    }
}

Reconnect() {
    ; Check for Disconnected Screen
    color := PixelGetColor(519, 329) ; Get color at (519, 329)
    if (color = 0x393B3D) {
        AddToLog("Disconnected! Attempting to reconnect...")

        ; Use Roblox deep linking to reconnect
        Run("roblox://placeID=" 8304191830)
        Sleep 2000
        if WinExist(RobloxWindow) {
            WinMove(27, 15, 800, 600, RobloxWindow)
            WinActivate(RobloxWindow)
            Sleep 1000
        }

        loop {


            AddToLog("Reconnecting to Roblox...")
            BetterClick(555, 444)
            Sleep 100
            BetterClick(555, 425)
            Sleep 15000
            if (ok := FindText(&X, &Y, 746, 476, 862, 569, 0, 0, AreasText)) {
                AddToLog("Reconnected Succesfully!")
                return GoToRaids() ; Check for challenges in the lobby
            }
            else {
                Reconnect()
            }
        }
    }
}

HoldKey(key, duration) {
    SendInput ("{" key "up}")
    ; go to teleporter
    Sleep 100
    SendInput ("{" key " down}")
    Sleep duration
    SendInput ("{" key " up}")
    KeyWait key ; Wait for "d" to be fully processed
}