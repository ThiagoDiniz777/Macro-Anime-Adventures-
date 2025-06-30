global step := 50 ; Step size for grid traversal
global successfulCoordinates := [] ; Array to store successful placements
global successThreshold := 3 ; Number of successful placements needed
global Hillx := 0
global Hilly := 0
UpgradeUnits(){
jogarEmTudo()
    jogarEmTudo()
    global successfulCoordinates

    AddToLog("Beginning unit upgrades.")

    while true { ; Infinite loop to ensure continuous checking
        for index, coord in successfulCoordinates {

            AddToLog("passei pelo if")
            if CheckforNextButton(){
jogarEmTudo()
                global RunCount += 1
                AddToLog("deus e bom deu certo porra.")
                successfulCoordinates := []
                return GoToRaids()
            }

            if IsMaxUpgrade(){
jogarEmTudo()
                AddToLog("Max upgrade reached for: X" coord.x " Y" coord.y)
                successfulCoordinates.RemoveAt(index) ; Remove the coordinate
                continue ; Skip to the next coordinate
            }
            Sleep(2000)

            UpgradeUnit(coord.x, coord.y)
            ;UpgradeUnit(coord.x - 30 , coord.y - 30 )
            Sleep(200)
            if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
            {
                BetterClick(373, 237)
            }
            BetterClick(565, 563) ; move mouse
            jogarEmTudo()
        }

        ; If all units are maxed, still check for stopping condition
        if successfulCoordinates.Length = 0 {
            jogarEmTudo()
            BetterClick(720, 510)
            if ShouldStopUpgrading(){
jogarEmTudo()
                AddToLog("Stopping due to finding return to lobby button.")
                return Replaying()
            }
            Sleep(2000) ; Prevent excessive looping

        }

        jogarEmTudo()
    }
}
UsedCoordinates := []
; Função para verificar se uma coordenada já foi usada
IsCoordinateUsed(x, y, radius){
jogarEmTudo()
    global UsedCoordinates
    for _, coord in UsedCoordinates {
        usedX := coord[1]
        usedY := coord[2]
        ; Calcula a distância entre as coordenadas
        distance := Sqrt((x - usedX) ** 2 + (y - usedY) ** 2)
        if (distance <= radius){
jogarEmTudo()
            return true  ; Coordenada está muito próxima de uma já usada
        }
    }
    return false  ; Coordenada está livre
}

PlaceHillUnit(slot := 1){
jogarEmTudo()
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0
    jogarEmTudo()


    while (attempts < max_attempts){
jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 35, 178, 828, 637, 0x00E16A or 0x0AC738 or 0x11CB48 or 0x34CD58 or 0x25C44B or 0x009A5F or 0x039C60 or 0x1BBB5B, 50){
jogarEmTudo()
            if (attempts > max_attempts){
jogarEmTudo()
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy){
jogarEmTudo()
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()){
jogarEmTudo()
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)){
jogarEmTudo()
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts){
jogarEmTudo()
                    AddToLog("mandei upar")
                    UpgradeUnits()
                    break
                }
                AddToLog("fui pro loop")
                randX := Random(-30, 30)  ; Gera um valor aleatório para randX entre 0 e 30
                randY := Random(-30, 30)  ; Gera um valor aleatório para randY entre 0 e 30

                ; Soma os valores aleatórios com Hx e Hy
                newHx := Hx + randX
                newHy := Hy + randY

                ; Verifica se a nova coordenada está muito próxima de uma já utilizada
                if (!IsCoordinateUsed(newHx, newHy, 20)){
jogarEmTudo()
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful(){
jogarEmTudo()
                        Hillx := newHx
                        Hilly := newHy
                        return true
                    }
                    AddToLog("somei mais um no attemps")
                    attempts++
                    AddToLog(attempts)
                }
                else {
                    AddToLog("posicao suja")
                }


            }

        }
    }

}


PlaceHillUnit10(slot := 1){
jogarEmTudo()
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0

    jogarEmTudo()


    while (attempts < max_attempts){
jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 297, 124, 646, 560, 0x00FE00 or 0x10F600 or 0x0FF600, 50){
jogarEmTudo()
            if (attempts > max_attempts){
jogarEmTudo()
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy){
jogarEmTudo()
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()){
jogarEmTudo()
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)){
jogarEmTudo()
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts){
jogarEmTudo()
                    AddToLog("mandei upar")
                    UpgradeUnits()
                    break
                }
                AddToLog("fui pro loop")
                randX := Random(-30, 30)  ; Gera um valor aleatório para randX entre 0 e 30
                randY := Random(-30, 30)  ; Gera um valor aleatório para randY entre 0 e 30

                ; Soma os valores aleatórios com Hx e Hy
                newHx := Hx + randX
                newHy := Hy + randY

                ; Verifica se a nova coordenada está muito próxima de uma já utilizada
                if (!IsCoordinateUsed(newHx, newHy, 20)){
jogarEmTudo()
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful(){
jogarEmTudo()
                        Hillx := newHx
                        Hilly := newHy
                        return true
                    }
                    AddToLog("somei mais um no attemps")
                    attempts++
                    AddToLog(attempts)
                }
                else {
                    AddToLog("posicao suja")
                }


            }

        }
    }

}


PlaceHillUnit12(slot := 1){
jogarEmTudo()
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0

    jogarEmTudo()


    while (attempts < max_attempts){
jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 41, 271, 567, 554, 0x00CB00 or 0x00D100 or 0x67D20A or 0x4CD51D, 40){
jogarEmTudo()
            if (attempts > max_attempts){
jogarEmTudo()
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy){
jogarEmTudo()
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()){
jogarEmTudo()
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)){
jogarEmTudo()
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts){
jogarEmTudo()
                    AddToLog("mandei upar")
                    UpgradeUnits()
                    break
                }
                AddToLog("fui pro loop")
                randX := Random(-30, 30)  ; Gera um valor aleatório para randX entre 0 e 30
                randY := Random(-20, 90)  ; Gera um valor aleatório para randY entre 0 e 30

                ; Soma os valores aleatórios com Hx e Hy
                newHx := Hx + randX
                newHy := Hy + randY

                ; Verifica se a nova coordenada está muito próxima de uma já utilizada
                if (!IsCoordinateUsed(newHx, newHy, 20)){
jogarEmTudo()
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful(){
jogarEmTudo()
                        Hillx := newHx
                        Hilly := newHy
                        return true
                    }
                    AddToLog("somei mais um no attemps")
                    attempts++
                    AddToLog(attempts)
                }
                else {
                    AddToLog("posicao suja")
                }


            }

        }
    }

}


PlaceHillUnit13(slot := 1){
jogarEmTudo()
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0


    jogarEmTudo()

    while (attempts < max_attempts){
jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 388, 150, 571, 299, 0x00CA00 or 0x00D000 or 0x00CC00, 40){
jogarEmTudo()
            if (attempts > max_attempts){
jogarEmTudo()
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy){
jogarEmTudo()
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()){
jogarEmTudo()
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)){
jogarEmTudo()
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts){
jogarEmTudo()
                    AddToLog("mandei upar")
                    UpgradeUnits()
                    break
                }
                AddToLog("fui pro loop")
                randX := Random(-30, 30)  ; Gera um valor aleatório para randX entre 0 e 30
                randY := Random(-20, 90)  ; Gera um valor aleatório para randY entre 0 e 30

                ; Soma os valores aleatórios com Hx e Hy
                newHx := Hx + randX
                newHy := Hy + randY

                ; Verifica se a nova coordenada está muito próxima de uma já utilizada
                if (!IsCoordinateUsed(newHx, newHy, 20)){
jogarEmTudo()
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful(){
jogarEmTudo()
                        Hillx := newHx
                        Hilly := newHy
                        return true
                    }
                    AddToLog("somei mais um no attemps")
                    attempts++
                    AddToLog(attempts)
                }
                else {
                    AddToLog("posicao suja")
                }


            }

        }
    }

}


PlaceHillUnit14(slot := 1){
jogarEmTudo()
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0
    jogarEmTudo()


    while (attempts < max_attempts){
jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 38, 173, 262, 491, 0x00CB00 or 0x00D100 or 0x67D20A or 0x4CD51D, 40){
jogarEmTudo()
            if (attempts > max_attempts){
jogarEmTudo()
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy){
jogarEmTudo()
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()){
jogarEmTudo()
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)){
jogarEmTudo()
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts){
jogarEmTudo()
                    AddToLog("mandei upar")
                    UpgradeUnits()
                    break
                }
                AddToLog("fui pro loop")
                randX := Random(-30, 30)  ; Gera um valor aleatório para randX entre 0 e 30
                randY := Random(-20, 90)  ; Gera um valor aleatório para randY entre 0 e 30

                ; Soma os valores aleatórios com Hx e Hy
                newHx := Hx + randX
                newHy := Hy + randY

                ; Verifica se a nova coordenada está muito próxima de uma já utilizada
                if (!IsCoordinateUsed(newHx, newHy, 20)){
jogarEmTudo()
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful(){
jogarEmTudo()
                        Hillx := newHx
                        Hilly := newHy
                        return true
                    }
                    AddToLog("somei mais um no attemps")
                    attempts++
                    AddToLog(attempts)
                }
                else {
                    AddToLog("posicao suja")
                }


            }

        }
    }

}
PlaceHillUnit15(slot := 1){
jogarEmTudo()
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0

    jogarEmTudo()


    while (attempts < max_attempts){
jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 277, 127, 830, 278, 0x00BB1D or 0x00B719 or 0x00B81A or 0x00C025 or 0x00BC1E, 40){
jogarEmTudo()
            if (attempts > max_attempts){
jogarEmTudo()
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy){
jogarEmTudo()
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()){
jogarEmTudo()
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)){
jogarEmTudo()
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts){
jogarEmTudo()
                    AddToLog("mandei upar")
                    UpgradeUnits()
                    break
                }
                AddToLog("fui pro loop")
                randX := Random(-30, 30)  ; Gera um valor aleatório para randX entre 0 e 30
                randY := Random(-20, 90)  ; Gera um valor aleatório para randY entre 0 e 30

                ; Soma os valores aleatórios com Hx e Hy
                newHx := Hx + randX
                newHy := Hy + randY

                ; Verifica se a nova coordenada está muito próxima de uma já utilizada
                if (!IsCoordinateUsed(newHx, newHy, 20)){
jogarEmTudo()
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful(){
jogarEmTudo()
                        Hillx := newHx
                        Hilly := newHy
                        return true
                    }
                    AddToLog("somei mais um no attemps")
                    attempts++
                    AddToLog(attempts)
                }
                else {
                    AddToLog("posicao suja")
                }


            }

        }
    }

}


PlaceHillUnit16(slot := 1){
jogarEmTudo()
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0

    jogarEmTudo()


    while (attempts < max_attempts){
jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 55, 139, 314, 421, 0x43DB92 or 0x44DB94 or 0x3FD994 or 0x4DDC90 or 0x3FD993, 40){
jogarEmTudo()
            if (attempts > max_attempts){
jogarEmTudo()
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy){
jogarEmTudo()
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()){
jogarEmTudo()
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)){
jogarEmTudo()
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts){
jogarEmTudo()
                    AddToLog("mandei upar")
                    UpgradeUnits()
                    break
                }
                AddToLog("fui pro loop")
                randX := Random(-30, 30)  ; Gera um valor aleatório para randX entre 0 e 30
                randY := Random(-20, 90)  ; Gera um valor aleatório para randY entre 0 e 30

                ; Soma os valores aleatórios com Hx e Hy
                newHx := Hx + randX
                newHy := Hy + randY

                ; Verifica se a nova coordenada está muito próxima de uma já utilizada
                if (!IsCoordinateUsed(newHx, newHy, 20)){
jogarEmTudo()
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful(){
jogarEmTudo()
                        Hillx := newHx
                        Hilly := newHy
                        return true
                    }
                    AddToLog("somei mais um no attemps")
                    attempts++
                    AddToLog(attempts)
                }
                else {
                    AddToLog("posicao suja")
                }


            }

        }
    }

}
PlaceHillUnit17(slot := 1){
jogarEmTudo()
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0


    jogarEmTudo()

    while (attempts < max_attempts){
jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 61, 221, 381, 542, 0x00B605 or 0x00B309 or 0x00B607 or 0x00B406 or 0x00B704, 40){
jogarEmTudo()
            if (attempts > max_attempts){
jogarEmTudo()
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy){
jogarEmTudo()
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()){
jogarEmTudo()
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)){
jogarEmTudo()
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts){
jogarEmTudo()
                    AddToLog("mandei upar")
                    UpgradeUnits()
                    break
                }
                AddToLog("fui pro loop")
                randX := Random(-30, 60)  ; Gera um valor aleatório para randX entre 0 e 30
                randY := Random(-30, 90)  ; Gera um valor aleatório para randY entre 0 e 30

                ; Soma os valores aleatórios com Hx e Hy
                newHx := Hx + randX
                newHy := Hy + randY

                ; Verifica se a nova coordenada está muito próxima de uma já utilizada
                if (!IsCoordinateUsed(newHx, newHy, 20)){
jogarEmTudo()
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful(){
jogarEmTudo()
                        Hillx := newHx
                        Hilly := newHy
                        return true
                    }
                    AddToLog("somei mais um no attemps")
                    attempts++
                    AddToLog(attempts)
                }
                else {
                    AddToLog("posicao suja")
                }


            }

        }
    }

}


PlaceHillUnit18(slot := 1){
jogarEmTudo()
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0

    jogarEmTudo()


    while (attempts < max_attempts){
jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 430, 145, 720, 472, 0x09DF39 or 0x0EE13E or 0x0EE13A or 0x0DE13D or 0x0EE23D, 40){
jogarEmTudo()
            if (attempts > max_attempts){
jogarEmTudo()
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy){
jogarEmTudo()
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()){
jogarEmTudo()
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)){
jogarEmTudo()
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts){
jogarEmTudo()
                    AddToLog("mandei upar")
                    UpgradeUnits()
                    break
                }
                AddToLog("fui pro loop")
                randX := Random(-40, 60)  ; Gera um valor aleatório para randX entre 0 e 30
                randY := Random(-30, 90)  ; Gera um valor aleatório para randY entre 0 e 30

                ; Soma os valores aleatórios com Hx e Hy
                newHx := Hx + randX
                newHy := Hy + randY

                ; Verifica se a nova coordenada está muito próxima de uma já utilizada
                if (!IsCoordinateUsed(newHx, newHy, 20)){
jogarEmTudo()
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful(){
jogarEmTudo()
                        Hillx := newHx
                        Hilly := newHy
                        return true
                    }
                    AddToLog("somei mais um no attemps")
                    attempts++
                    AddToLog(attempts)
                }
                else {
                    AddToLog("posicao suja")
                }


            }

        }
    }

}


PlaceHillUnit19(slot := 1){
jogarEmTudo()
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0


    jogarEmTudo()


    while (attempts < max_attempts){
jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 400, 160, 600, 235, 0x06B10E, 5){
jogarEmTudo()
            if (attempts > max_attempts){
jogarEmTudo()
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy){
jogarEmTudo()
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()){
jogarEmTudo()
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)){
jogarEmTudo()
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts){
jogarEmTudo()
                    AddToLog("mandei upar")
                    UpgradeUnits()
                    break
                }
                AddToLog("fui pro loop")
                randX := Random(-30, 30)  ; Gera um valor aleatório para randX entre 0 e 30
                randY := Random(-30, 30)  ; Gera um valor aleatório para randY entre 0 e 30

                ; Soma os valores aleatórios com Hx e Hy
                newHx := Hx + randX
                newHy := Hy + randY

                ; Verifica se a nova coordenada está muito próxima de uma já utilizada
                if (!IsCoordinateUsed(newHx, newHy, 20)){
jogarEmTudo()
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful(){
jogarEmTudo()
                        Hillx := newHx
                        Hilly := newHy
                        return true
                    }
                    AddToLog("somei mais um no attemps")
                    attempts++
                    AddToLog(attempts)
                }
                else {
                    AddToLog("posicao suja")
                }


            }

        }
    }

}


PlaceHillUnit20(slot := 1){
jogarEmTudo()
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0


    jogarEmTudo()


    while (attempts < max_attempts){
jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 203, 252, 384, 497, 0x1DC206 or 0x00B102 or 0x10BE03 or 0x0BBA03, 40){
jogarEmTudo()
            if (attempts > max_attempts){
jogarEmTudo()
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy){
jogarEmTudo()
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()){
jogarEmTudo()
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)){
jogarEmTudo()
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts){
jogarEmTudo()
                    AddToLog("mandei upar")
                    UpgradeUnits()
                    break
                }
                AddToLog("fui pro loop")
                randX := Random(-30, 30)  ; Gera um valor aleatório para randX entre 0 e 30
                randY := Random(-30, 30)  ; Gera um valor aleatório para randY entre 0 e 30

                ; Soma os valores aleatórios com Hx e Hy
                newHx := Hx + randX
                newHy := Hy + randY

                ; Verifica se a nova coordenada está muito próxima de uma já utilizada
                if (!IsCoordinateUsed(newHx, newHy, 20)){
jogarEmTudo()
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful(){
jogarEmTudo()
                        Hillx := newHx
                        Hilly := newHy
                        return true
                    }
                    AddToLog("somei mais um no attemps")
                    attempts++
                    AddToLog(attempts)
                }
                else {
                    AddToLog("posicao suja")
                }


            }

        }
    }

}


PlaceHillUnit11(slot := 1){
jogarEmTudo()
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0

    jogarEmTudo()


    while (attempts < max_attempts){
jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 38, 208, 384, 546, 0x00BF3F or 0x00BE3A or 0x00BE38, 30){
jogarEmTudo()
            if (attempts > max_attempts){
jogarEmTudo()
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy){
jogarEmTudo()
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()){
jogarEmTudo()
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)){
jogarEmTudo()
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts){
jogarEmTudo()
                    AddToLog("mandei upar")
                    UpgradeUnits()
                    break
                }
                AddToLog("fui pro loop")
                randX := Random(-100, 10)  ; Gera um valor aleatório para randX entre 0 e 30
                randY := Random(-30, 90)  ; Gera um valor aleatório para randY entre 0 e 30

                ; Soma os valores aleatórios com Hx e Hy
                newHx := Hx + randX
                newHy := Hy + randY

                ; Verifica se a nova coordenada está muito próxima de uma já utilizada
                if (!IsCoordinateUsed(newHx, newHy, 20)){
jogarEmTudo()
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful(){
jogarEmTudo()
                        Hillx := newHx
                        Hilly := newHy
                        return true
                    }
                    AddToLog("somei mais um no attemps")
                    attempts++
                    AddToLog(attempts)
                }
                else {
                    AddToLog("posicao suja")
                }


            }

        }
    }

}


PlaceHillUnit8(slot := 1){
jogarEmTudo()
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0


    jogarEmTudo()


    while (attempts < max_attempts){
jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 442, 187, 821, 582, 0x7FE50D or 0x3DDD03 or 0x72E107, 30){
jogarEmTudo()
            if (attempts > max_attempts){
jogarEmTudo()
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy){
jogarEmTudo()
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()){
jogarEmTudo()
                    AddToLog("reconheci boneco na posicao nartural")
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)){
jogarEmTudo()
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts){
jogarEmTudo()
                    AddToLog("mandei upar")
                    UpgradeUnits()
                    break
                }
                AddToLog("fui pro loop")
                randX := Random(-30, 30)  ; Gera um valor aleatório para randX entre 0 e 30
                randY := Random(-30, 30)  ; Gera um valor aleatório para randY entre 0 e 30

                ; Soma os valores aleatórios com Hx e Hy
                newHx := Hx + randX
                newHy := Hy + randY

                ; Verifica se a nova coordenada está muito próxima de uma já utilizada
                if (!IsCoordinateUsed(newHx, newHy, 20)){
jogarEmTudo()
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful(){
jogarEmTudo()
                        AddToLog("reconeci o boneco colocado pelo loop")
                        Sleep 1000
                        Hillx := newHx
                        Hilly := newHy
                        return true
                    }
                    AddToLog("somei mais um no attemps")
                    attempts++
                    AddToLog(attempts)
                }
                else {
                    AddToLog("posicao suja")
                }


            }

        }
    }

}


PlaceHillUnit9(slot := 1){
jogarEmTudo()
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0


    jogarEmTudo()

    while (attempts < max_attempts){
jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 444, 204, 828, 590, 0x00D000 or 0x00D300, 30){
jogarEmTudo()
            if (attempts > max_attempts){
jogarEmTudo()
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy){
jogarEmTudo()
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()){
jogarEmTudo()
                    AddToLog("reconheci boneco na posicao nartural")
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)){
jogarEmTudo()
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts){
jogarEmTudo()
                    AddToLog("mandei upar")
                    UpgradeUnits()
                    break
                }
                AddToLog("fui pro loop")
                randX := Random(-30, 30)  ; Gera um valor aleatório para randX entre 0 e 30
                randY := Random(-30, 90)  ; Gera um valor aleatório para randY entre 0 e 30

                ; Soma os valores aleatórios com Hx e Hy
                newHx := Hx + randX
                newHy := Hy + randY

                ; Verifica se a nova coordenada está muito próxima de uma já utilizada
                if (!IsCoordinateUsed(newHx, newHy, 20)){
jogarEmTudo()
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful(){
jogarEmTudo()
                        AddToLog("reconeci o boneco colocado pelo loop")
                        Sleep 1000
                        Hillx := newHx
                        Hilly := newHy
                        return true
                    }
                    AddToLog("somei mais um no attemps")
                    attempts++
                    AddToLog(attempts)
                }
                else {
                    AddToLog("posicao suja")
                }


            }

        }
    }

}


PlaceHillUnit7(slot := 1){
jogarEmTudo()
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0

    jogarEmTudo()


    while (attempts < max_attempts){
jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 85, 241, 481, 561, 0x00FC3A or 0x00FB05, 50){
jogarEmTudo()
            if (attempts > max_attempts){
jogarEmTudo()
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy){
jogarEmTudo()
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()){
jogarEmTudo()
                    AddToLog("reconheci boneco na posicao nartural")
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)){
jogarEmTudo()
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts){
jogarEmTudo()
                    AddToLog("mandei upar")
                    UpgradeUnits()
                    break
                }
                AddToLog("fui pro loop")
                randX := Random(-30, 30)  ; Gera um valor aleatório para randX entre 0 e 30
                randY := Random(-30, 30)  ; Gera um valor aleatório para randY entre 0 e 30

                ; Soma os valores aleatórios com Hx e Hy
                newHx := Hx + randX
                newHy := Hy + randY

                ; Verifica se a nova coordenada está muito próxima de uma já utilizada
                if (!IsCoordinateUsed(newHx, newHy, 20)){
jogarEmTudo()
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful(){
jogarEmTudo()
                        AddToLog("reconeci o boneco colocado pelo loop")
                        Sleep 1000
                        Hillx := newHx
                        Hilly := newHy
                        return true
                    }
                    AddToLog("somei mais um no attemps")
                    attempts++
                    AddToLog(attempts)
                }
                else {
                    AddToLog("posicao suja")
                }


            }

        }
    }

}


PlaceHillUnit6969(slot := 1){
jogarEmTudo()
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0

    jogarEmTudo()


    while (attempts < max_attempts){
jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 35, 178, 828, 637, 0x00E16A or 0x0AC738 or 0x11CB48 or 0x34CD58 or 0x25C44B, 50){
jogarEmTudo()
            if (attempts > max_attempts){
jogarEmTudo()
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy){
jogarEmTudo()
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()){
jogarEmTudo()
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }

            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)){
jogarEmTudo()
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts){
jogarEmTudo()
                    AddToLog("mandei upar")
                    UpgradeUnits()
                    break
                }
                AddToLog("fui pro loop")
                randX := Random(-20, 80)  ; Gera um valor aleatório para randX entre 0 e 30
                randY := Random(-20, 80)  ; Gera um valor aleatório para randY entre 0 e 30

                ; Soma os valores aleatórios com Hx e Hy
                newHx := Hx + randX
                newHy := Hy + randY

                ; Verifica se a nova coordenada está muito próxima de uma já utilizada
                if (!IsCoordinateUsed(newHx, newHy, 20)){
jogarEmTudo()
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful(){
jogarEmTudo()
                        Hillx := newHx
                        Hilly := newHy
                        return true
                    }
                    AddToLog("somei mais um no attemps")
                    attempts++
                    AddToLog(attempts)
                }
                else {
                    AddToLog("posicao suja")
                }


            }

        }
    }

}

PlaceHillUnit1(slot := 1){
jogarEmTudo()
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0

    jogarEmTudo()


    while (attempts < max_attempts){
jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")


        if PixelSearch(&Hx, &Hy, 442, 291, 722, 518, 0x00E16A or 0x0AC738 or 0x11CB48 or 0x34CD58 or 0x009A5F or 0x039C60 or 0x1BBB5B, 50){
jogarEmTudo()
            if (attempts > max_attempts){
jogarEmTudo()
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy){
jogarEmTudo()
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()){
jogarEmTudo()
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)){
jogarEmTudo()
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts){
jogarEmTudo()
                    AddToLog("mandei upar")
                    UpgradeUnits()
                    break
                }
                AddToLog("fui pro loop")
                randX := Random(-30, 30)  ; Gera um valor aleatório para randX entre 0 e 30
                randY := Random(-30, 30)  ; Gera um valor aleatório para randY entre 0 e 30

                ; Soma os valores aleatórios com Hx e Hy
                newHx := Hx + randX
                newHy := Hy + randY

                ; Verifica se a nova coordenada está muito próxima de uma já utilizada
                if (!IsCoordinateUsed(newHx, newHy, 20)){
jogarEmTudo()
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful(){
jogarEmTudo()
                        Hillx := newHx
                        Hilly := newHy
                        return true
                    }
                    AddToLog("somei mais um no attemps")
                    attempts++
                    AddToLog(attempts)
                }
                else {
                    AddToLog("posicao suja")
                }


            }

        }
    }

}

PlaceHillUnit4(slot := 1){
jogarEmTudo()
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0


    jogarEmTudo()


    while (attempts < max_attempts){
jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")


        if PixelSearch(&Hx, &Hy, 560, 180, 775, 360, 0xB0FF1A, 50){
jogarEmTudo()
            if (attempts > max_attempts){
jogarEmTudo()
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy){
jogarEmTudo()
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()){
jogarEmTudo()
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)){
jogarEmTudo()
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts){
jogarEmTudo()
                    AddToLog("mandei upar")
                    UpgradeUnits()
                    break
                }
                AddToLog("fui pro loop")
                randX := Random(-30, 80)  ; Gera um valor aleatório para randX entre 0 e 30
                randY := Random(-30, 80)  ; Gera um valor aleatório para randY entre 0 e 30

                ; Soma os valores aleatórios com Hx e Hy
                newHx := Hx + randX
                newHy := Hy + randY

                ; Verifica se a nova coordenada está muito próxima de uma já utilizada
                if (!IsCoordinateUsed(newHx, newHy, 20)){
jogarEmTudo()
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful(){
jogarEmTudo()
                        Hillx := newHx
                        Hilly := newHy
                        return true
                    }
                    AddToLog("somei mais um no attemps")
                    attempts++
                    AddToLog(attempts)
                }
                else {
                    AddToLog("posicao suja")
                }


            }

        }
    }

}


PlaceUnit(x, y, slot := 1){
jogarEmTudo()
    SendInput(slot)
    Sleep 50
    BetterClick(x, y)
    jogarEmTudo()
    Sleep 50
    SendInput("q")

    ; Check if placement is successful
    if IsPlacementSuccessful(){
jogarEmTudo()
        Sleep 15
        return true
    }
}

IsPlacementSuccessful(){
jogarEmTudo()
    jogarEmTudo()
    AddToLog("fui chamada para indentificar")
    Sleep 2500
    if (ok := FindText(&X, &Y, 187, 204, 357, 466, 0, 0, UnitExistence or UnitExistence2)){
jogarEmTudo()
        BetterClick(329, 184) ; close upg menu
        return true
    }
    else {
        return false
    }

}
;colocar bonequinhos no map
TryPlacingUnitsMapa(){
jogarEmTudo()
    global step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    ;tirar 35 dos valores do get range pq ele joga pra cima
    ;quando pegar o range troca o primeiro e o segundo y o maior valor comeca se nao ,trava no if abaixo
    startX := 399, startY := 232, endX := 750, endY := 189
    x := startX ; Initialize x only once
    y := startY ; Initialize y only once
    jogarEmTudo()
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
        if !(enabled = 1){
jogarEmTudo()
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1){
jogarEmTudo()
            while (placementCount < placements){
jogarEmTudo()
                if PlaceHillUnit(slotNum){
jogarEmTudo()
                    placementCount++
                    successfulCoordinates.Push({ x: Hillx, y: Hilly })
                    AddToLog("Placed " placementCount "/" placements ".")
                }
                if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }
                BetterClick(210, 555) ; move mouse
                if ShouldStopUpgrading(1){
jogarEmTudo()
                    AddToLog("Stopping due to finding lobby  condition.")
                    return Replaying()
                }
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
        ; Continue placement for the current slot
        if !(hill = 1){
jogarEmTudo()
            while (placementCount < placements && y >= endY){
jogarEmTudo() ; Rows
                while (placementCount < placements && x <= endX){
jogarEmTudo() ; Columns
                    if PlaceUnit(x, y, slotNum){
jogarEmTudo()
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y }) ; Track successful placements
                    }
                    if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                    {
                        BetterClick(373, 237)
                    }
                    BetterClick(565, 563) ; move mouse
                    if ShouldStopUpgrading(1){
jogarEmTudo()
                        AddToLog("Stopping due to finding lobby  condition.")
                        return Replaying()
                    }
                    jogarEmTudo()
                    x += step - 20 ; Move to the next column
                }
                if x > endX {
                    x := startX ; Reset x for the next row
                    y -= (-step - 25) ; Move to the next row
                }
            }
            jogarEmTudo()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        jogarEmTudo()
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}


TryPlacingUnitsMapa7(){
jogarEmTudo()
    global step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    ;tirar 35 dos valores do get range pq ele joga pra cima
    ;quando pegar o range troca o primeiro e o segundo y o maior valor comeca se nao ,trava no if abaixo
    startX := 380, endY := 197, endX := 599, startY := 480
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
        jogarEmTudo()

        ; Skip if the slot is not enabled
        if !(enabled = 1){
jogarEmTudo()
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1){
jogarEmTudo()
            while (placementCount < placements){
jogarEmTudo()
                if PlaceHillUnit7(slotNum){
jogarEmTudo()
                    AddToLog("tudo certo tudo true pro boneco")
                    placementCount++
                    successfulCoordinates.Push({ x: Hillx, y: Hilly })
                    AddToLog("Placed " placementCount "/" placements ".")
                }
                if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }
                BetterClick(210, 555) ; move mouse
                if ShouldStopUpgrading(1){
jogarEmTudo()
                    AddToLog("Stopping due to finding lobby  condition.")
                    return Replaying()
                }
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
        ; Continue placement for the current slot
        if !(hill = 1){
jogarEmTudo()
            while (placementCount < placements && y >= endY){
jogarEmTudo() ; Rows
                while (placementCount < placements && x <= endX){
jogarEmTudo() ; Columns
                    if PlaceUnit(x, y, slotNum){
jogarEmTudo()
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y }) ; Track successful placements
                    }
                    if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                    {
                        BetterClick(373, 237)
                    }
                    BetterClick(565, 563) ; move mouse
                    if ShouldStopUpgrading(1){
jogarEmTudo()
                        AddToLog("Stopping due to finding lobby  condition.")
                        return Replaying()
                    }
                    jogarEmTudo()
                    x += step - 20 ; Move to the next column
                }
                if x > endX {
                    x := startX ; Reset x for the next row
                    y -= (-step - 25) ; Move to the next row
                }
            }
            jogarEmTudo()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        jogarEmTudo()
    }
    jogarEmTudo()
    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}


TryPlacingUnitsMapa9(){
jogarEmTudo()
    global step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    ;tirar 35 dos valores do get range pq ele joga pra cima
    ;quando pegar o range troca o primeiro e o segundo y o maior valor comeca se nao ,trava no if abaixo
    startX := 364, endY := 145, endX := 828, startY := 190
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
        if !(enabled = 1){
jogarEmTudo()
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1){
jogarEmTudo()
            while (placementCount < placements){
jogarEmTudo()
                if PlaceHillUnit9(slotNum){
jogarEmTudo()
                    placementCount++
                    successfulCoordinates.Push({ x: Hillx, y: Hilly })
                    AddToLog("Placed " placementCount "/" placements ".")
                }
                if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }
                BetterClick(210, 555) ; move mouse
                if ShouldStopUpgrading(1){
jogarEmTudo()
                    AddToLog("Stopping due to finding lobby  condition.")
                    return Replaying()
                }
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
        ; Continue placement for the current slot
        if !(hill = 1){
jogarEmTudo()
            while (placementCount < placements && y >= endY){
jogarEmTudo() ; Rows
                while (placementCount < placements && x <= endX){
jogarEmTudo() ; Columns
                    if PlaceUnit(x, y, slotNum){
jogarEmTudo()
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y }) ; Track successful placements
                    }
                    if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                    {
                        BetterClick(373, 237)
                    }
                    BetterClick(565, 563) ; move mouse
                    if ShouldStopUpgrading(1){
jogarEmTudo()
                        AddToLog("Stopping due to finding lobby  condition.")
                        return Replaying()
                    }
                    jogarEmTudo()
                    x += step - 20 ; Move to the next column
                }
                if x > endX {
                    x := startX ; Reset x for the next row
                    y -= (-step - 25) ; Move to the next row
                }
            }
            jogarEmTudo()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        jogarEmTudo()
    }
    jogarEmTudo()
    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}


TryPlacingUnitsMapa10(){
jogarEmTudo()
    global step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    ;tirar 35 dos valores do get range pq ele joga pra cima
    ;quando pegar o range troca o primeiro e o segundo y o maior valor comeca se nao ,trava no if abaixo
    startX := 350, endY := 197, endX := 667, startY := 300
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
        if !(enabled = 1){
jogarEmTudo()
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1){
jogarEmTudo()
            while (placementCount < placements){
jogarEmTudo()
                if PlaceHillUnit10(slotNum){
jogarEmTudo()
                    placementCount++
                    successfulCoordinates.Push({ x: Hillx, y: Hilly })
                    AddToLog("Placed " placementCount "/" placements ".")
                }
                if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }
                BetterClick(210, 555) ; move mouse
                if ShouldStopUpgrading(1){
jogarEmTudo()
                    AddToLog("Stopping due to finding lobby  condition.")
                    return Replaying()
                }
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
        ; Continue placement for the current slot
        if !(hill = 1){
jogarEmTudo()
            while (placementCount < placements && y >= endY){
jogarEmTudo() ; Rows
                while (placementCount < placements && x <= endX){
jogarEmTudo() ; Columns
                    if PlaceUnit(x, y, slotNum){
jogarEmTudo()
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y }) ; Track successful placements
                    }
                    if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                    {
                        BetterClick(373, 237)
                    }
                    BetterClick(565, 563) ; move mouse
                    if ShouldStopUpgrading(1){
jogarEmTudo()
                        AddToLog("Stopping due to finding lobby  condition.")
                        return Replaying()
                    }
                    jogarEmTudo()
                    x += step - 20 ; Move to the next column
                }
                if x > endX {
                    x := startX ; Reset x for the next row
                    y -= (-step - 25) ; Move to the next row
                }
            }
            jogarEmTudo()
        }
        jogarEmTudo()
        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        jogarEmTudo()
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}


TryPlacingUnitsMapa12(){
jogarEmTudo()
    global step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    ;tirar 35 dos valores do get range pq ele joga pra cima
    ;quando pegar o range troca o primeiro e o segundo y o maior valor comeca se nao ,trava no if abaixo
    startX := 332, endY := 320, endX := 701, startY := 400
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

        jogarEmTudo()
        ; Skip if the slot is not enabled
        if !(enabled = 1){
jogarEmTudo()
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1){
jogarEmTudo()
            while (placementCount < placements){
jogarEmTudo()
                if PlaceHillUnit12(slotNum){
jogarEmTudo()
                    placementCount++
                    successfulCoordinates.Push({ x: Hillx, y: Hilly })
                    AddToLog("Placed " placementCount "/" placements ".")
                }
                if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }
                BetterClick(210, 555) ; move mouse
                if ShouldStopUpgrading(1){
jogarEmTudo()
                    AddToLog("Stopping due to finding lobby  condition.")
                    return Replaying()
                }
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
        ; Continue placement for the current slot
        if !(hill = 1){
jogarEmTudo()
            while (placementCount < placements && y >= endY){
jogarEmTudo() ; Rows
                while (placementCount < placements && x <= endX){
jogarEmTudo() ; Columns
                    if PlaceUnit(x, y, slotNum){
jogarEmTudo()
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y }) ; Track successful placements
                    }
                    if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                    {
                        BetterClick(373, 237)
                    }
                    BetterClick(565, 563) ; move mouse
                    if ShouldStopUpgrading(1){
jogarEmTudo()
                        AddToLog("Stopping due to finding lobby  condition.")
                        return Replaying()
                    }
                    jogarEmTudo()
                    x += step - 20 ; Move to the next column
                }
                if x > endX {
                    x := startX ; Reset x for the next row
                    y += (step - 85) ; Move to the next row
                }
            }
            jogarEmTudo()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        jogarEmTudo()
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}

TryPlacingUnitsMapa13(){
jogarEmTudo()
    global step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    ;tirar 35 dos valores do get range pq ele joga pra cima
    ;quando pegar o range troca o primeiro e o segundo y o maior valor comeca se nao ,trava no if abaixo
    startX := 290, endY := 286, endX := 628, startY := 370
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

        jogarEmTudo()
        ; Skip if the slot is not enabled
        if !(enabled = 1){
jogarEmTudo()
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1){
jogarEmTudo()
            while (placementCount < placements){
jogarEmTudo()
                if PlaceHillUnit13(slotNum){
jogarEmTudo()
                    placementCount++
                    successfulCoordinates.Push({ x: Hillx, y: Hilly })
                    AddToLog("Placed " placementCount "/" placements ".")
                }
                if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }
                BetterClick(210, 555) ; move mouse
                if ShouldStopUpgrading(1){
jogarEmTudo()
                    AddToLog("Stopping due to finding lobby  condition.")
                    return Replaying()
                }
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
        ; Continue placement for the current slot
        if !(hill = 1){
jogarEmTudo()
            while (placementCount < placements && y >= endY){
jogarEmTudo() ; Rows
                while (placementCount < placements && x <= endX){
jogarEmTudo() ; Columns
                    if PlaceUnit(x, y, slotNum){
jogarEmTudo()
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y }) ; Track successful placements
                    }
                    if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                    {
                        BetterClick(373, 237)
                    }
                    BetterClick(565, 563) ; move mouse
                    if ShouldStopUpgrading(1){
jogarEmTudo()
                        AddToLog("Stopping due to finding lobby  condition.")
                        return Replaying()
                    }
                    jogarEmTudo()
                    x += step - 20 ; Move to the next column
                }
                if x > endX {
                    x := startX ; Reset x for the next row
                    y += (step - 85) ; Move to the next row
                }
            }
            jogarEmTudo()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        jogarEmTudo()
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}

TryPlacingUnitsMapa14(){
jogarEmTudo()
    global step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    ;tirar 35 dos valores do get range pq ele joga pra cima
    ;quando pegar o range troca o primeiro e o segundo y o maior valor comeca se nao ,trava no if abaixo
    startX := 216, endY := 366, endX := 644, startY := 460
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

        jogarEmTudo()
        ; Skip if the slot is not enabled
        if !(enabled = 1){
jogarEmTudo()
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1){
jogarEmTudo()
            while (placementCount < placements){
jogarEmTudo()
                if PlaceHillUnit14(slotNum){
jogarEmTudo()
                    placementCount++
                    successfulCoordinates.Push({ x: Hillx, y: Hilly })
                    AddToLog("Placed " placementCount "/" placements ".")
                }
                if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }
                BetterClick(210, 555) ; move mouse
                if ShouldStopUpgrading(1){
jogarEmTudo()
                    AddToLog("Stopping due to finding lobby  condition.")
                    return Replaying()
                }
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
        ; Continue placement for the current slot
        if !(hill = 1){
jogarEmTudo()
            while (placementCount < placements && y >= endY){
jogarEmTudo() ; Rows
                while (placementCount < placements && x <= endX){
jogarEmTudo() ; Columns
                    if PlaceUnit(x, y, slotNum){
jogarEmTudo()
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y }) ; Track successful placements
                    }
                    if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                    {
                        BetterClick(373, 237)
                    }
                    BetterClick(565, 563) ; move mouse
                    if ShouldStopUpgrading(1){
jogarEmTudo()
                        AddToLog("Stopping due to finding lobby  condition.")
                        return Replaying()
                    }
                    jogarEmTudo()
                    x += step - 20 ; Move to the next column
                }
                if x > endX {
                    x := startX ; Reset x for the next row
                    y += (step - 85) ; Move to the next row
                }
            }
            jogarEmTudo()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        jogarEmTudo()
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}

TryPlacingUnitsMapa15(){
jogarEmTudo()
    global step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    ;tirar 35 dos valores do get range pq ele joga pra cima
    ;quando pegar o range troca o primeiro e o segundo y o maior valor comeca se nao ,trava no if abaixo
    startX := 164, endY := 279, endX := 684, startY := 390
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
        jogarEmTudo()

        ; Skip if the slot is not enabled
        if !(enabled = 1){
jogarEmTudo()
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1){
jogarEmTudo()
            while (placementCount < placements){
jogarEmTudo()
                if PlaceHillUnit15(slotNum){
jogarEmTudo()
                    placementCount++
                    successfulCoordinates.Push({ x: Hillx, y: Hilly })
                    AddToLog("Placed " placementCount "/" placements ".")
                }
                if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }
                BetterClick(210, 555) ; move mouse
                if ShouldStopUpgrading(1){
jogarEmTudo()
                    AddToLog("Stopping due to finding lobby  condition.")
                    return Replaying()
                }
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
        ; Continue placement for the current slot
        if !(hill = 1){
jogarEmTudo()
            while (placementCount < placements && y >= endY){
jogarEmTudo() ; Rows
                while (placementCount < placements && x <= endX){
jogarEmTudo() ; Columns
                    if PlaceUnit(x, y, slotNum){
jogarEmTudo()
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y }) ; Track successful placements
                    }
                    if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                    {
                        BetterClick(373, 237)
                    }
                    BetterClick(565, 563) ; move mouse
                    if ShouldStopUpgrading(1){
jogarEmTudo()
                        AddToLog("Stopping due to finding lobby  condition.")
                        return Replaying()
                    }
                    jogarEmTudo()
                    x += step - 20 ; Move to the next column
                }
                if x > endX {
                    x := startX ; Reset x for the next row
                    y += (step - 85) ; Move to the next row
                }
            }
            jogarEmTudo()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        jogarEmTudo()
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}

TryPlacingUnitsMapa16(){
jogarEmTudo()
    global step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    ;tirar 35 dos valores do get range pq ele joga pra cima
    ;quando pegar o range troca o primeiro e o segundo y o maior valor comeca se nao ,trava no if abaixo

    startX := 290, endY := 171, endX := 417, startY := 500
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
        if !(enabled = 1){
jogarEmTudo()
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0
        jogarEmTudo()

        if (hill = 1){
jogarEmTudo()
            while (placementCount < placements){
jogarEmTudo()
                if PlaceHillUnit16(slotNum){
jogarEmTudo()
                    placementCount++
                    successfulCoordinates.Push({ x: Hillx, y: Hilly })
                    AddToLog("Placed " placementCount "/" placements ".")
                }
                if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }
                BetterClick(210, 555) ; move mouse
                if ShouldStopUpgrading(1){
jogarEmTudo()
                    AddToLog("Stopping due to finding lobby  condition.")
                    return Replaying()
                }
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
        ; Continue placement for the current slot
        if !(hill = 1){
jogarEmTudo()
            while (placementCount < placements && y >= endY){
jogarEmTudo() ; Rows
                while (placementCount < placements && x <= endX){
jogarEmTudo() ; Columns
                    if PlaceUnit(x, y, slotNum){
jogarEmTudo()
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y }) ; Track successful placements
                    }
                    if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                    {
                        BetterClick(373, 237)
                    }
                    BetterClick(565, 563) ; move mouse
                    if ShouldStopUpgrading(1){
jogarEmTudo()
                        AddToLog("Stopping due to finding lobby  condition.")
                        return Replaying()
                    }
                    jogarEmTudo()
                    x += step - 20 ; Move to the next column
                }
                if x > endX {
                    x := startX ; Reset x for the next row
                    y += (step - 85) ; Move to the next row
                }
            }
            jogarEmTudo()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        jogarEmTudo()
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}

TryPlacingUnitsMapa17(){
jogarEmTudo()
    global step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    ;tirar 35 dos valores do get range pq ele joga pra cima
    ;quando pegar o range troca o primeiro e o segundo y o maior valor comeca se nao ,trava no if abaixo
    startX := 300, endY := 120, endX := 821, startY := 240
    x := startX ; Initialize x only once
    y := startY ; Initialize y only once
    jogarEmTudo()
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
        if !(enabled = 1){
jogarEmTudo()
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1){
jogarEmTudo()
            while (placementCount < placements){
jogarEmTudo()
                if PlaceHillUnit17(slotNum){
jogarEmTudo()
                    placementCount++
                    successfulCoordinates.Push({ x: Hillx, y: Hilly })
                    AddToLog("Placed " placementCount "/" placements ".")
                }
                if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }
                BetterClick(210, 555) ; move mouse
                if ShouldStopUpgrading(1){
jogarEmTudo()
                    AddToLog("Stopping due to finding lobby  condition.")
                    return Replaying()
                }
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
        ; Continue placement for the current slot
        if !(hill = 1){
jogarEmTudo()
            while (placementCount < placements && y >= endY){
jogarEmTudo() ; Rows
                while (placementCount < placements && x <= endX){
jogarEmTudo() ; Columns
                    if PlaceUnit(x, y, slotNum){
jogarEmTudo()
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y }) ; Track successful placements
                    }
                    if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                    {
                        BetterClick(373, 237)
                    }
                    BetterClick(565, 563) ; move mouse
                    if ShouldStopUpgrading(1){
jogarEmTudo()
                        AddToLog("Stopping due to finding lobby  condition.")
                        return Replaying()
                    }
                    jogarEmTudo()
                    x += step - 20 ; Move to the next column
                }
                if x > endX {
                    x := startX ; Reset x for the next row
                    y += (step - 85) ; Move to the next row
                }
            }
            jogarEmTudo()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        jogarEmTudo()
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}

TryPlacingUnitsMapa18(){
jogarEmTudo()
    global step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    ;tirar 35 dos valores do get range pq ele joga pra cima
    ;quando pegar o range troca o primeiro e o segundo y o maior valor comeca se nao ,trava no if abaixo
    jogarEmTudo()
    startX := 534, endY := 437, endX := 831, startY := 540
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
        if !(enabled = 1){
jogarEmTudo()
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1){
jogarEmTudo()
            while (placementCount < placements){
jogarEmTudo()
                if PlaceHillUnit18(slotNum){
jogarEmTudo()
                    placementCount++
                    successfulCoordinates.Push({ x: Hillx, y: Hilly })
                    AddToLog("Placed " placementCount "/" placements ".")
                }
                if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }
                BetterClick(210, 555) ; move mouse
                if ShouldStopUpgrading(1){
jogarEmTudo()
                    AddToLog("Stopping due to finding lobby  condition.")
                    return Replaying()
                }
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
        ; Continue placement for the current slot
        if !(hill = 1){
jogarEmTudo()
            while (placementCount < placements && y >= endY){
jogarEmTudo() ; Rows
                while (placementCount < placements && x <= endX){
jogarEmTudo() ; Columns
                    if PlaceUnit(x, y, slotNum){
jogarEmTudo()
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y }) ; Track successful placements
                    }
                    if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                    {
                        BetterClick(373, 237)
                    }
                    BetterClick(565, 563) ; move mouse
                    if ShouldStopUpgrading(1){
jogarEmTudo()
                        AddToLog("Stopping due to finding lobby  condition.")
                        return Replaying()
                    }
                    jogarEmTudo()
                    x += step - 20 ; Move to the next column
                }
                if x > endX {
                    x := startX ; Reset x for the next row
                    y += (step - 85) ; Move to the next row
                }
            }
            jogarEmTudo()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        jogarEmTudo()
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}


TryPlacingUnitsMapa19(){
jogarEmTudo()
    global step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    ;tirar 35 dos valores do get range pq ele joga pra cima
    ;quando pegar o range troca o primeiro e o segundo y o maior valor comeca se nao ,trava no if abaixo
    startX := 200, startY := 290, endX := 450, endY := 200
    x := startX ; Initialize x only once
    y := startY ; Initialize y only once
    jogarEmTudo()
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
        if !(enabled = 1){
jogarEmTudo()
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1){
jogarEmTudo()
            while (placementCount < placements){
jogarEmTudo()
                if PlaceHillUnit19(slotNum){
jogarEmTudo()
                    placementCount++
                    successfulCoordinates.Push({ x: Hillx, y: Hilly })
                    AddToLog("Placed " placementCount "/" placements ".")
                }
                if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }
                BetterClick(210, 555) ; move mouse
                if ShouldStopUpgrading(1){
jogarEmTudo()
                    AddToLog("Stopping due to finding lobby  condition.")
                    return Replaying()
                }
                jogarEmTudo()
            }
        }

        ; Continue placement for the current slot
        if !(hill = 1){
jogarEmTudo()
            while (placementCount < placements && y >= endY){
jogarEmTudo() ; Rows
                while (placementCount < placements && x <= endX){
jogarEmTudo() ; Columns
                    x += step - 20 ; Move to the next column
                    if PlaceUnit(x, y, slotNum){
jogarEmTudo()
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y }) ; Track successful placements
                    }
                    if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                    {
                        BetterClick(373, 237)
                    }
                    BetterClick(565, 563) ; move mouse
                    if ShouldStopUpgrading(1){
jogarEmTudo()
                        AddToLog("Stopping due to finding lobby  condition.")
                        return Replaying()
                    }

                    jogarEmTudo()

                }
                if x > endX {
                    x := startX ; Reset x for the next row
                    y -= (-step - 25) ; Move to the next row
                }
            }
            jogarEmTudo()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        jogarEmTudo()
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}

TryPlacingUnitsMapa20(){
jogarEmTudo()
    global step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    ;tirar 35 dos valores do get range pq ele joga pra cima
    ;quando pegar o range troca o primeiro e o segundo y o maior valor comeca se nao ,trava no if abaixo
    startX := 382, endY := 205, endX := 499, startY := 510
    x := startX ; Initialize x only once
    y := startY ; Initialize y only once
    jogarEmTudo()
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
        if !(enabled = 1){
jogarEmTudo()
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1){
jogarEmTudo()
            while (placementCount < placements){
jogarEmTudo()
                if PlaceHillUnit20(slotNum){
jogarEmTudo()
                    placementCount++
                    successfulCoordinates.Push({ x: Hillx, y: Hilly })
                    AddToLog("Placed " placementCount "/" placements ".")
                }
                if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }
                BetterClick(210, 555) ; move mouse
                if ShouldStopUpgrading(1){
jogarEmTudo()
                    AddToLog("Stopping due to finding lobby  condition.")
                    return Replaying()
                }
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
        ; Continue placement for the current slot
        if !(hill = 1){
jogarEmTudo()
            while (placementCount < placements && y >= endY){
jogarEmTudo() ; Rows
                while (placementCount < placements && x <= endX){
jogarEmTudo() ; Columns
                    if PlaceUnit(x, y, slotNum){
jogarEmTudo()
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y }) ; Track successful placements
                    }
                    if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                    {
                        BetterClick(373, 237)
                    }
                    BetterClick(565, 563) ; move mouse
                    if ShouldStopUpgrading(1){
jogarEmTudo()
                        AddToLog("Stopping due to finding lobby  condition.")
                        return Replaying()
                    }
                    jogarEmTudo()
                    x += step - 20 ; Move to the next column
                }
                if x > endX {
                    x := startX ; Reset x for the next row
                    y += (step - 85) ; Move to the next row
                }
            }
            jogarEmTudo()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        jogarEmTudo()
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}


TryPlacingUnitsMapa11(){
jogarEmTudo()
    global step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    ;tirar 35 dos valores do get range pq ele joga pra cima
    ;quando pegar o range troca o primeiro e o segundo y o maior valor comeca se nao ,trava no if abaixo
    startX := 355, endY := 207, endX := 471, startY := 439
    x := startX ; Initialize x only once
    y := startY ; Initialize y only once
    jogarEmTudo()
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
        if !(enabled = 1){
jogarEmTudo()
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1){
jogarEmTudo()
            while (placementCount < placements){
jogarEmTudo()
                if PlaceHillUnit11(slotNum){
jogarEmTudo()
                    placementCount++
                    successfulCoordinates.Push({ x: Hillx, y: Hilly })
                    AddToLog("Placed " placementCount "/" placements ".")
                }
                if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }
                BetterClick(210, 555) ; move mouse
                if ShouldStopUpgrading(1){
jogarEmTudo()
                    AddToLog("Stopping due to finding lobby  condition.")
                    return Replaying()
                }
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
        ; Continue placement for the current slot
        if !(hill = 1){
jogarEmTudo()
            while (placementCount < placements && y >= endY){
jogarEmTudo() ; Rows
                while (placementCount < placements && x <= endX){
jogarEmTudo() ; Columns
                    if PlaceUnit(x, y, slotNum){
jogarEmTudo()
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y }) ; Track successful placements
                    }
                    if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                    {
                        BetterClick(373, 237)
                    }
                    BetterClick(565, 563) ; move mouse
                    if ShouldStopUpgrading(1){
jogarEmTudo()
                        AddToLog("Stopping due to finding lobby  condition.")
                        return Replaying()
                    }
                    jogarEmTudo()
                    x += step - 20 ; Move to the next column
                }
                if x > endX {
                    x := startX ; Reset x for the next row
                    y += (step - 85) ; Move to the next row
                }
            }
            jogarEmTudo()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        jogarEmTudo()
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}


TryPlacingUnitsMapa8(){
jogarEmTudo()
    global step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    ;tirar 35 dos valores do get range pq ele joga pra cima
    ;quando pegar o range troca o primeiro e o segundo y o maior valor comeca se nao ,trava no if abaixo
    startX := 122, endY := 284, endX := 710, startY := 500
    x := startX ; Initialize x only once
    y := startY ; Initialize y only once
    jogarEmTudo()
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
        if !(enabled = 1){
jogarEmTudo()
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1){
jogarEmTudo()
            while (placementCount < placements){
jogarEmTudo()
                if PlaceHillUnit8(slotNum){
jogarEmTudo()
                    placementCount++
                    successfulCoordinates.Push({ x: Hillx, y: Hilly })
                    AddToLog("Placed " placementCount "/" placements ".")
                }
                if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }
                BetterClick(210, 555) ; move mouse
                if ShouldStopUpgrading(1){
jogarEmTudo()
                    AddToLog("Stopping due to finding lobby  condition.")
                    return Replaying()
                }
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
        ; Continue placement for the current slot
        if !(hill = 1){
jogarEmTudo()
            while (placementCount < placements && y >= endY){
jogarEmTudo() ; Rows
                while (placementCount < placements && x <= endX){
jogarEmTudo() ; Columns
                    if PlaceUnit(x, y, slotNum){
jogarEmTudo()
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y }) ; Track successful placements
                    }
                    if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                    {
                        BetterClick(373, 237)
                    }
                    BetterClick(565, 563) ; move mouse
                    if ShouldStopUpgrading(1){
jogarEmTudo()
                        AddToLog("Stopping due to finding lobby  condition.")
                        return Replaying()
                    }
                    jogarEmTudo()
                    x += step - 20 ; Move to the next column
                }
                if x > endX {
                    x := startX ; Reset x for the next row
                    y -= (-step - 25) ; Move to the next row
                }
            }
            jogarEmTudo()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        jogarEmTudo()
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}


TryPlacingUnitsMapa6969(){
jogarEmTudo()
    global step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    ;tirar 35 dos valores do get range pq ele joga pra cima
    ;quando pegar o range troca o primeiro e o segundo y o maior valor comeca se nao ,trava no if abaixo
    startX := 399, startY := 232, endX := 750, endY := 189
    x := startX ; Initialize x only once
    y := startY ; Initialize y only once
    jogarEmTudo()
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
        if !(enabled = 1){
jogarEmTudo()
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1){
jogarEmTudo()
            while (placementCount < placements){
jogarEmTudo()
                if PlaceHillUnit6969(slotNum){
jogarEmTudo()
                    placementCount++
                    successfulCoordinates.Push({ x: Hillx, y: Hilly })
                    AddToLog("Placed " placementCount "/" placements ".")
                }
                if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }
                BetterClick(210, 555) ; move mouse
                if ShouldStopUpgrading(1){
jogarEmTudo()
                    AddToLog("Stopping due to finding lobby  condition.")
                    return Replaying()
                }
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
        ; Continue placement for the current slot
        if !(hill = 1){
jogarEmTudo()
            while (placementCount < placements && y >= endY){
jogarEmTudo() ; Rows
                while (placementCount < placements && x <= endX){
jogarEmTudo() ; Columns
                    if PlaceUnit(x, y, slotNum){
jogarEmTudo()
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y }) ; Track successful placements
                    }
                    if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                    {
                        BetterClick(373, 237)
                    }
                    BetterClick(565, 563) ; move mouse
                    if ShouldStopUpgrading(1){
jogarEmTudo()
                        AddToLog("Stopping due to finding lobby  condition.")
                        return Replaying()
                    }
                    jogarEmTudo()
                    x += step - 20 ; Move to the next column
                }
                if x > endX {
                    x := startX ; Reset x for the next row
                    y -= (-step - 25) ; Move to the next row
                }
            }
            jogarEmTudo()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        jogarEmTudo()
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}


TryPlacingUnitsMapa2(){
jogarEmTudo()
    AddToLog("bonecos wallet")
    global step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    ;tirar 35 dos valores do get range pq ele joga pra cima
    ;quando pegar o range troca o primeiro e o segundo y o maior valor comeca se nao ,trava no if abaixo
    startX := 143, startY := 375, endX := 600, endY := 306
    x := startX ; Initialize x only once
    y := startY ; Initialize y only once
    jogarEmTudo()
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
        if !(enabled = 1){
jogarEmTudo()
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1){
jogarEmTudo()
            while (placementCount < placements){
jogarEmTudo()
                if PlaceHillUnit(slotNum){
jogarEmTudo()
                    placementCount++
                    successfulCoordinates.Push({ x: Hillx, y: Hilly })
                    AddToLog("Placed " placementCount "/" placements ".")
                }
                if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }
                BetterClick(210, 555) ; move mouse
                if ShouldStopUpgrading(1){
jogarEmTudo()
                    AddToLog("Stopping due to finding lobby  condition.")
                    return Replaying()
                }
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
        ; Continue placement for the current slot
        if !(hill = 1){
jogarEmTudo()
            while (placementCount < placements && y >= endY){
jogarEmTudo() ; Rows
                while (placementCount < placements && x <= endX){
jogarEmTudo() ; Columns
                    if PlaceUnit(x, y, slotNum){
jogarEmTudo()
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y }) ; Track successful placements
                    }
                    if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                    {
                        BetterClick(373, 237)
                    }
                    BetterClick(565, 563) ; move mouse
                    if ShouldStopUpgrading(1){
jogarEmTudo()
                        AddToLog("Stopping due to finding lobby  condition.")
                        return Replaying()
                    }
                    jogarEmTudo()
                    x += step - 20 ; Move to the next column
                }
                if x > endX {
                    x := startX ; Reset x for the next row
                    y += (step - 80) ; Move to the next row
                }
            }
            jogarEmTudo()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        jogarEmTudo()
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}


TryPlacingUnitsMapa3(){
jogarEmTudo()
    AddToLog("bonecos MAPA 3")
    global step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    ;tirar 35 dos valores do get range pq ele joga pra cima
    ;quando pegar o range troca o primeiro e o segundo y o maior valor comeca se nao ,trava no if abaixo
    startX := 74, endY := 332, endX := 434, startY := 521
    x := startX ; Initialize x only once
    y := startY ; Initialize y only once
    jogarEmTudo()
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
        if !(enabled = 1){
jogarEmTudo()
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1){
jogarEmTudo()
            while (placementCount < placements){
jogarEmTudo()
                if PlaceHillUnit1(slotNum){
jogarEmTudo()
                    placementCount++
                    successfulCoordinates.Push({ x: Hillx, y: Hilly })
                    AddToLog("Placed " placementCount "/" placements ".")
                }
                if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }
                BetterClick(210, 555) ; move mouse
                if ShouldStopUpgrading(1){
jogarEmTudo()
                    AddToLog("Stopping due to finding lobby  condition.")
                    return Replaying()
                }
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
        ; Continue placement for the current slot
        if !(hill = 1){
jogarEmTudo()
            while (placementCount < placements && y >= endY){
jogarEmTudo() ; Rows
                while (placementCount < placements && x <= endX){
jogarEmTudo() ; Columns
                    if PlaceUnit(x, y, slotNum){
jogarEmTudo()
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y }) ; Track successful placements
                    }
                    if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                    {
                        BetterClick(373, 237)
                    }
                    BetterClick(565, 563) ; move mouse
                    if ShouldStopUpgrading(1){
jogarEmTudo()
                        AddToLog("Stopping due to finding lobby  condition.")
                        return Replaying()
                    }
                    jogarEmTudo()
                    x += step - 20 ; Move to the next column
                }
                if x > endX {
                    x := startX ; Reset x for the next row
                    y += (step - 80) ; Move to the next row
                }
            }
            jogarEmTudo()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        jogarEmTudo()
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}

TryPlacingUnitsMapa4(){
jogarEmTudo()
    AddToLog("bonecos MAPA 4")
    global step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    ;tirar 35 dos valores do get range pq ele joga pra cima
    ;quando pegar o range troca o primeiro e o segundo y o maior valor comeca se nao ,trava no if abaixo
    startX := 330, endY := 192, endX := 390, startY := 513
    x := startX ; Initialize x only once
    y := startY ; Initialize y only once
    jogarEmTudo()
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
        if !(enabled = 1){
jogarEmTudo()
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1){
jogarEmTudo()
            while (placementCount < placements){
jogarEmTudo()
                if PlaceHillUnit4(slotNum){
jogarEmTudo()
                    placementCount++
                    successfulCoordinates.Push({ x: Hillx, y: Hilly })
                    AddToLog("Placed " placementCount "/" placements ".")
                }
                if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }
                BetterClick(210, 555) ; move mouse
                if ShouldStopUpgrading(1){
jogarEmTudo()
                    AddToLog("Stopping due to finding lobby  condition.")
                    return Replaying()
                }
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
        ; Continue placement for the current slot
        if !(hill = 1){
jogarEmTudo()
            while (placementCount < placements && y >= endY){
jogarEmTudo() ; Rows
                while (placementCount < placements && x <= endX){
jogarEmTudo() ; Columns
                    if PlaceUnit(x, y, slotNum){
jogarEmTudo()
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y }) ; Track successful placements
                    }
                    if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                    {
                        BetterClick(373, 237)
                    }
                    BetterClick(565, 563) ; move mouse
                    if ShouldStopUpgrading(1){
jogarEmTudo()
                        AddToLog("Stopping due to finding lobby  condition.")
                        return Replaying()
                    }
                    jogarEmTudo()
                    x += step - 20 ; Move to the next column
                }
                if x > endX {
                    x := startX ; Reset x for the next row
                    y += (step - 80) ; Move to the next row
                }
            }
            jogarEmTudo()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        jogarEmTudo()
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}

TryPlacingUnitsMapa5(){
jogarEmTudo()
    AddToLog("bonecos mapa 5")
    global step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    ;tirar 35 dos valores do get range pq ele joga pra cima
    ;quando pegar o range troca o primeiro e o segundo y o maior valor comeca se nao ,trava no if abaixo
    startX := 243, endY := 187, endX := 568, startY := 332
    x := startX ; Initialize x only once
    y := startY ; Initialize y only once
    jogarEmTudo()
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
        if !(enabled = 1){
jogarEmTudo()
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1){
jogarEmTudo()
            while (placementCount < placements){
jogarEmTudo()
                if PlaceHillUnit(slotNum){
jogarEmTudo()
                    placementCount++
                    successfulCoordinates.Push({ x: Hillx, y: Hilly })
                    AddToLog("Placed " placementCount "/" placements ".")
                }
                if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }
                BetterClick(210, 555) ; move mouse
                if ShouldStopUpgrading(1){
jogarEmTudo()
                    AddToLog("Stopping due to finding lobby  condition.")
                    return Replaying()
                }
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
        ; Continue placement for the current slot
        if !(hill = 1){
jogarEmTudo()
            while (placementCount < placements && y >= endY){
jogarEmTudo() ; Rows
                while (placementCount < placements && x <= endX){
jogarEmTudo() ; Columns
                    if PlaceUnit(x, y, slotNum){
jogarEmTudo()
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y }) ; Track successful placements
                    }
                    if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                    {
                        BetterClick(373, 237)
                    }
                    BetterClick(565, 563) ; move mouse
                    if ShouldStopUpgrading(1){
jogarEmTudo()
                        AddToLog("Stopping due to finding lobby  condition.")
                        return Replaying()
                    }
                    jogarEmTudo()
                    x += step - 20 ; Move to the next column
                }
                if x > endX {
                    x := startX ; Reset x for the next row
                    y += (step - 80) ; Move to the next row
                }
            }
            jogarEmTudo()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        jogarEmTudo()
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}


TryPlacingUnitsMapa6(){
jogarEmTudo()
    AddToLog("bonecos MAPA 6")
    global step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    ;tirar 35 dos valores do get range pq ele joga pra cima
    ;quando pegar o range troca o primeiro e o segundo y o maior valor comeca se nao ,trava no if abaixo
    startX := 330, endY := 192, endX := 390, startY := 513
    x := startX ; Initialize x only once
    y := startY ; Initialize y only once
    jogarEmTudo()
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
        if !(enabled = 1){
jogarEmTudo()
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1){
jogarEmTudo()
            while (placementCount < placements){
jogarEmTudo()
                if PlaceHillUnit(slotNum){
jogarEmTudo()
                    placementCount++
                    successfulCoordinates.Push({ x: Hillx, y: Hilly })
                    AddToLog("Placed " placementCount "/" placements ".")
                }
                if (ok := FindText(&X, &Y, 300, 153, 444, 561, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }
                BetterClick(210, 555) ; move mouse
                if ShouldStopUpgrading(1){
jogarEmTudo()
                    AddToLog("Stopping due to finding lobby  condition.")
                    return Replaying()
                }
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
        ; Continue placement for the current slot
        if !(hill = 1){
jogarEmTudo()
            while (placementCount < placements && y >= endY){
jogarEmTudo() ; Rows
                while (placementCount < placements && x <= endX){
jogarEmTudo() ; Columns
                    if PlaceUnit(x, y, slotNum){
jogarEmTudo()
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y }) ; Track successful placements
                    }
                    if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                    {
                        BetterClick(373, 237)
                    }
                    BetterClick(565, 563) ; move mouse
                    if ShouldStopUpgrading(1){
jogarEmTudo()
                        AddToLog("Stopping due to finding lobby  condition.")
                        return Replaying()
                    }
                    jogarEmTudo()
                    x += step - 20 ; Move to the next column
                }
                if x > endX {
                    x := startX ; Reset x for the next row
                    y += (step - 80) ; Move to the next row
                }
            }
            jogarEmTudo()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        jogarEmTudo()
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}


jogarEmTudo(){
    Reconnect()
    CheckforNextButton()
    
}