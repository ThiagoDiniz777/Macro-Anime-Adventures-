global step := 50 ; Step size for grid traversal
global successfulCoordinates := [] ; Array to store successful placements
global successThreshold := 3 ; Number of successful placements needed
global Hillx := 0
global Hilly := 0
UpgradeUnits() {
    jogarEmTudo()
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
            if ShouldStopUpgrading() {
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
IsCoordinateUsed(x, y, radius) {
    global UsedCoordinates
    for _, coord in UsedCoordinates {
        usedX := coord[1]
        usedY := coord[2]
        ; Calcula a distância entre as coordenadas
        distance := Sqrt((x - usedX) ** 2 + (y - usedY) ** 2)
        if (distance <= radius) {
            return true  ; Coordenada está muito próxima de uma já usada
        }
    }
    return false  ; Coordenada está livre
}

PlaceHillUnit(slot := 1) {
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0
    jogarEmTudo()


    while (attempts < max_attempts) {
        jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 35, 178, 828, 637, 0x00E16A or 0x0AC738 or 0x11CB48 or 0x34CD58 or 0x25C44B, 50) {
            if (attempts > max_attempts) {
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy) {
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()) {
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)) {
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts) {
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
                if (!IsCoordinateUsed(newHx, newHy, 20)) {
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful() {
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


PlaceHillUnit10(slot := 1) {
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0

    jogarEmTudo()


    while (attempts < max_attempts) {
        jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 297, 124, 646, 560, 0x00FE00 or 0x10F600 or 0x0FF600, 50) {
            if (attempts > max_attempts) {
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy) {
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()) {
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)) {
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts) {
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
                if (!IsCoordinateUsed(newHx, newHy, 20)) {
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful() {
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


PlaceHillUnit12(slot := 1) {
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0

    jogarEmTudo()


    while (attempts < max_attempts) {
        jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 41, 271, 567, 554, 0x00CB00 or 0x00D100 or 0x67D20A or 0x4CD51D, 40) {
            if (attempts > max_attempts) {
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy) {
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()) {
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)) {
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts) {
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
                if (!IsCoordinateUsed(newHx, newHy, 20)) {
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful() {
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


PlaceHillUnit13(slot := 1) {
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0


    jogarEmTudo()

    while (attempts < max_attempts) {
        jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 388, 150, 571, 299, 0x00CA00 or 0x00D000 or 0x00CC00, 40) {
            if (attempts > max_attempts) {
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy) {
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()) {
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)) {
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts) {
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
                if (!IsCoordinateUsed(newHx, newHy, 20)) {
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful() {
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


PlaceHillUnit14(slot := 1) {
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0
    jogarEmTudo()


    while (attempts < max_attempts) {
        jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 38, 173, 262, 491, 0x00CB00 or 0x00D100 or 0x67D20A or 0x4CD51D, 40) {
            if (attempts > max_attempts) {
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy) {
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()) {
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)) {
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts) {
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
                if (!IsCoordinateUsed(newHx, newHy, 20)) {
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful() {
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
PlaceHillUnit15(slot := 1) {
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0

    jogarEmTudo()


    while (attempts < max_attempts) {
        jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 277, 127, 830, 278, 0x00BB1D or 0x00B719 or 0x00B81A or 0x00C025 or 0x00BC1E, 40) {
            if (attempts > max_attempts) {
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy) {
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()) {
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)) {
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts) {
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
                if (!IsCoordinateUsed(newHx, newHy, 20)) {
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful() {
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


PlaceHillUnit16(slot := 1) {
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0

    jogarEmTudo()


    while (attempts < max_attempts) {
        jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 55, 139, 314, 421, 0x43DB92 or 0x44DB94 or 0x3FD994 or 0x4DDC90 or 0x3FD993, 40) {
            if (attempts > max_attempts) {
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy) {
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()) {
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)) {
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts) {
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
                if (!IsCoordinateUsed(newHx, newHy, 20)) {
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful() {
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
PlaceHillUnit17(slot := 1) {
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0


    jogarEmTudo()

    while (attempts < max_attempts) {
        jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 61, 221, 381, 542, 0x00B605 or 0x00B309 or 0x00B607 or 0x00B406 or 0x00B704, 40) {
            if (attempts > max_attempts) {
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy) {
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()) {
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)) {
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts) {
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
                if (!IsCoordinateUsed(newHx, newHy, 20)) {
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful() {
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


PlaceHillUnit18(slot := 1) {
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0

    jogarEmTudo()


    while (attempts < max_attempts) {
        jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 430, 145, 720, 472, 0x09DF39 or 0x0EE13E or 0x0EE13A or 0x0DE13D or 0x0EE23D, 40) {
            if (attempts > max_attempts) {
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy) {
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()) {
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)) {
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts) {
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
                if (!IsCoordinateUsed(newHx, newHy, 20)) {
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful() {
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


PlaceHillUnit19(slot := 1) {
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0


    jogarEmTudo()


    while (attempts < max_attempts) {
        jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 400, 160, 600, 235, 0x06B10E, 5) {
            if (attempts > max_attempts) {
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy) {
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()) {
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)) {
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts) {
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
                if (!IsCoordinateUsed(newHx, newHy, 20)) {
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful() {
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


PlaceHillUnit20(slot := 1) {
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0


    jogarEmTudo()


    while (attempts < max_attempts) {
        jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 203, 252, 384, 497, 0x1DC206 or 0x00B102 or 0x10BE03 or 0x0BBA03, 40) {
            if (attempts > max_attempts) {
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy) {
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()) {
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)) {
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts) {
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
                if (!IsCoordinateUsed(newHx, newHy, 20)) {
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful() {
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


PlaceHillUnit11(slot := 1) {
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0

    jogarEmTudo()


    while (attempts < max_attempts) {
        jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 38, 208, 384, 546, 0x00BF3F or 0x00BE3A or 0x00BE38, 30) {
            if (attempts > max_attempts) {
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy) {
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()) {
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)) {
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts) {
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
                if (!IsCoordinateUsed(newHx, newHy, 20)) {
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful() {
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


PlaceHillUnit8(slot := 1) {
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0


    jogarEmTudo()


    while (attempts < max_attempts) {
        jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 442, 187, 821, 582, 0x7FE50D or 0x3DDD03 or 0x72E107, 30) {
            if (attempts > max_attempts) {
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy) {
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()) {
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
            if (TryPlaceAt(Hx, Hy)) {
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts) {
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
                if (!IsCoordinateUsed(newHx, newHy, 20)) {
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful() {
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


PlaceHillUnit9(slot := 1) {
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0


    jogarEmTudo()

    while (attempts < max_attempts) {
        jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 444, 204, 828, 590, 0x00D000 or 0x00D300, 30) {
            if (attempts > max_attempts) {
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy) {
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()) {
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
            if (TryPlaceAt(Hx, Hy)) {
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts) {
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
                if (!IsCoordinateUsed(newHx, newHy, 20)) {
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful() {
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


PlaceHillUnit7(slot := 1) {
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0

    jogarEmTudo()


    while (attempts < max_attempts) {
        jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 85, 241, 481, 561, 0x00FC3A or 0x00FB05, 50) {
            if (attempts > max_attempts) {
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy) {
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()) {
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
            if (TryPlaceAt(Hx, Hy)) {
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts) {
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
                if (!IsCoordinateUsed(newHx, newHy, 20)) {
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful() {
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


PlaceHillUnit799(slot := 1) {
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0

    jogarEmTudo()


    while (attempts < max_attempts) {
        jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 90, 171, 540, 573, 0x008414 or 0x008514, 20) {
            if (attempts > max_attempts) {
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy) {
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()) {
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
            if (TryPlaceAt(Hx, Hy)) {
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts) {
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
                if (!IsCoordinateUsed(newHx, newHy, 20)) {
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful() {
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

PlaceHillUnit6969(slot := 1) {
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0

    jogarEmTudo()


    while (attempts < max_attempts) {
        jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 35, 178, 828, 637, 0x00E16A or 0x0AC738 or 0x11CB48 or 0x34CD58 or 0x25C44B, 50) {
            if (attempts > max_attempts) {
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy) {
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()) {
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }

            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)) {
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts) {
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
                if (!IsCoordinateUsed(newHx, newHy, 20)) {
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful() {
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

PlaceHillUnit1(slot := 1) {
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0

    jogarEmTudo()


    while (attempts < max_attempts) {
        jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")


        if PixelSearch(&Hx, &Hy, 442, 291, 722, 518, 0x00E16A or 0x0AC738 or 0x11CB48 or 0x34CD58, 50) {
            if (attempts > max_attempts) {
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy) {
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()) {
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)) {
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts) {
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
                if (!IsCoordinateUsed(newHx, newHy, 20)) {
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful() {
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

PlaceHillUnit4(slot := 1) {
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0


    jogarEmTudo()


    while (attempts < max_attempts) {
        jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")


        if PixelSearch(&Hx, &Hy, 421, 133, 830, 447, 0xB0FF1A, 30) {
            if (attempts > max_attempts) {
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy) {
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()) {
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)) {
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts) {
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
                if (!IsCoordinateUsed(newHx, newHy, 20)) {
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful() {
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

        if PixelSearch(&Hx, &Hy, 421, 133, 830, 447, 0x03972A or 0x009A37 or 0x009A36 or 0x03972A, 30) {
            if (attempts > max_attempts) {
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }


            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)) {
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts) {
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
                if (!IsCoordinateUsed(newHx, newHy, 20)) {
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful() {
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


PlaceUnit(x, y, slot := 1) {
    SendInput(slot)
    Sleep 50
    BetterClick(x, y)
    jogarEmTudo()
    Sleep 50
    SendInput("q")

    ; Check if placement is successful
    if IsPlacementSuccessful() {
        Sleep 15
        return true
    }
}

IsPlacementSuccessful() {
    jogarEmTudo()
    AddToLog("fui chamada para indentificar")
    Sleep 5000
    if (ok := FindText(&X, &Y, 187, 204, 357, 466, 0, 0, UnitExistence or UnitExistence2)) {
        BetterClick(329, 184) ; close upg menu
        return true
    }
    else {
        return false
    }

}
;colocar bonequinhos no map
TryPlacingUnitsMapa() {
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
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
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


TryPlacingUnitsMapa7() {
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
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1) {
            while (placementCount < placements) {
                if PlaceHillUnit7(slotNum) {
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
                if ShouldStopUpgrading(1) {
                    AddToLog("Stopping due to finding lobby  condition.")
                    return Replaying()
                }
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
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

TryPlacingUnitsMapa799() {
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
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1) {
            while (placementCount < placements) {
                if PlaceHillUnit799(slotNum) {
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
                if ShouldStopUpgrading(1) {
                    AddToLog("Stopping due to finding lobby  condition.")
                    return Replaying()
                }
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
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

TryPlacingUnitsMapa9() {
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
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1) {
            while (placementCount < placements) {
                if PlaceHillUnit9(slotNum) {
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
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
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


TryPlacingUnitsMapa10() {
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
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1) {
            while (placementCount < placements) {
                if PlaceHillUnit10(slotNum) {
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
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
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


TryPlacingUnitsMapa12() {
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
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1) {
            while (placementCount < placements) {
                if PlaceHillUnit12(slotNum) {
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
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
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

TryPlacingUnitsMapa13() {
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
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1) {
            while (placementCount < placements) {
                if PlaceHillUnit13(slotNum) {
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
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
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

TryPlacingUnitsMapa14() {
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
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1) {
            while (placementCount < placements) {
                if PlaceHillUnit14(slotNum) {
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
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
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

TryPlacingUnitsMapa15() {
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
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1) {
            while (placementCount < placements) {
                if PlaceHillUnit15(slotNum) {
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
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
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

TryPlacingUnitsMapa16() {
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
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0
        jogarEmTudo()

        if (hill = 1) {
            while (placementCount < placements) {
                if PlaceHillUnit16(slotNum) {
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
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
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

TryPlacingUnitsMapa17() {
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
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1) {
            while (placementCount < placements) {
                if PlaceHillUnit17(slotNum) {
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
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
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

TryPlacingUnitsMapa18() {
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
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1) {
            while (placementCount < placements) {
                if PlaceHillUnit18(slotNum) {
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
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
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


TryPlacingUnitsMapa19() {
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
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1) {
            while (placementCount < placements) {
                if PlaceHillUnit19(slotNum) {
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
                jogarEmTudo()
            }
        }

        ; Continue placement for the current slot
        if !(hill = 1) {
            while (placementCount < placements && y >= endY) { ; Rows
                while (placementCount < placements && x <= endX) { ; Columns
                    x += step - 20 ; Move to the next column
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

TryPlacingUnitsMapa20() {
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
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1) {
            while (placementCount < placements) {
                if PlaceHillUnit20(slotNum) {
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
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
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


TryPlacingUnitsMapa11() {
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
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1) {
            while (placementCount < placements) {
                if PlaceHillUnit11(slotNum) {
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
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
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


TryPlacingUnitsMapa8() {
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
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1) {
            while (placementCount < placements) {
                if PlaceHillUnit8(slotNum) {
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
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
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


TryPlacingUnitsMapa6969() {
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
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1) {
            while (placementCount < placements) {
                if PlaceHillUnit6969(slotNum) {
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
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
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


TryPlacingUnitsMapa2() {
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
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
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


TryPlacingUnitsMapa3() {
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
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1) {
            while (placementCount < placements) {
                if PlaceHillUnit1(slotNum) {
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
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
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

TryPlacingUnitsMapa4() {
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
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0


        if (hill = 1) {
            while (placementCount < placements) {
                if PlaceHillUnit4(slotNum) {
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
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
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

TryPlacingUnitsMapa5() {
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
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
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


TryPlacingUnitsMapa6() {
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
                if (ok := FindText(&X, &Y, 300, 153, 444, 561, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }
                BetterClick(210, 555) ; move mouse
                if ShouldStopUpgrading(1) {
                    AddToLog("Stopping due to finding lobby  condition.")
                    return Replaying()
                }
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
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

PlaceHillUnit30(slot := 1) {
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0


    jogarEmTudo()


    while (attempts < max_attempts) {
        jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 136, 158, 400, 272, 0x00FF00, 5) {
            if (attempts > max_attempts) {
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy) {
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()) {
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)) {
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts) {
                    AddToLog("mandei upar")
                    UpgradeUnits()
                    break
                }
                AddToLog("fui pro loop")
                randX := Random(-60, 30)  ; Gera um valor aleatório para randX entre 0 e 30
                randY := Random(-60, 30)  ; Gera um valor aleatório para randY entre 0 e 30

                ; Soma os valores aleatórios com Hx e Hy
                newHx := Hx + randX
                newHy := Hy + randY

                ; Verifica se a nova coordenada está muito próxima de uma já utilizada
                if (!IsCoordinateUsed(newHx, newHy, 20)) {
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful() {
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
PlaceHillUnit21(slot := 1) {
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0


    jogarEmTudo()


    while (attempts < max_attempts) {
        jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 189, 122, 397, 450, 0x00E801 or 0x01EA03 or 0x00E700 or 0x00EA03 or 0x00E802, 5) {
            if (attempts > max_attempts) {
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy) {
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()) {
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)) {
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts) {
                    AddToLog("mandei upar")
                    UpgradeUnits()
                    break
                }
                AddToLog("fui pro loop")
                randX := Random(-80, 80)  ; Gera um valor aleatório para randX entre 0 e 30
                randY := Random(-80, 80)  ; Gera um valor aleatório para randY entre 0 e 30

                ; Soma os valores aleatórios com Hx e Hy
                newHx := Hx + randX
                newHy := Hy + randY

                ; Verifica se a nova coordenada está muito próxima de uma já utilizada
                if (!IsCoordinateUsed(newHx, newHy, 20)) {
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful() {
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

PlaceHillUnit22(slot := 1) {
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0


    jogarEmTudo()


    while (attempts < max_attempts) {
        jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 416, 134, 824, 235, 0x3ABF00 or 0x8CCF04 or 0x89CE02 or 0x5DC500 or 0x8DCE01, 5) {
            if (attempts > max_attempts) {
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy) {
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()) {
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)) {
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts) {
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
                if (!IsCoordinateUsed(newHx, newHy, 20)) {
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful() {
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
PlaceHillUnit23(slot := 1) {
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0


    jogarEmTudo()


    while (attempts < max_attempts) {
        jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 326, 90, 559, 230, 0x03CE00 or 0x03CD00 or 0x00CA00 or 0x04CD00, 5) {
            if (attempts > max_attempts) {
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy) {
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()) {
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)) {
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts) {
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
                if (!IsCoordinateUsed(newHx, newHy, 20)) {
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful() {
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


PlaceHillUnit244(slot := 1) {
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0


    jogarEmTudo()


    while (attempts < max_attempts) {
        jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor mapa 244")
        if PixelSearch(&Hx, &Hy, 133, 123, 756, 545, 0x5CFF11 or 0x5DFF11 or 0x5DFF11 or 0x5CFF11, 5) {
            if (attempts > max_attempts) {
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy) {
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()) {
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)) {
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts) {
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
                if (!IsCoordinateUsed(newHx, newHy, 20)) {
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful() {
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
PlaceHillUnit24(slot := 1) {
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0


    jogarEmTudo()


    while (attempts < max_attempts) {
        jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 400, 160, 600, 235, 0x06B10E, 5) {
            if (attempts > max_attempts) {
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy) {
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()) {
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)) {
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts) {
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
                if (!IsCoordinateUsed(newHx, newHy, 20)) {
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful() {
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


PlaceHillUnit25(slot := 1) {
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0


    jogarEmTudo()


    while (attempts < max_attempts) {
        jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 155, 270, 380, 401, 0x00BE01 or 0x00BC01 or 0x00BE03 or 0x00BD00, 5) {
            if (attempts > max_attempts) {
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy) {
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()) {
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)) {
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts) {
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
                if (!IsCoordinateUsed(newHx, newHy, 20)) {
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful() {
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


PlaceHillUnit26(slot := 1) {
    global Hillx, Hilly
    global UsedCoordinates  ; Permite acessar a lista de coordenadas usadas
    max_attempts := 20  ; Exemplo: limite de tentativas
    attempts := 0


    jogarEmTudo()


    while (attempts < max_attempts) {
        jogarEmTudo()
        SendInput(slot)
        Sleep 100
        AddToLog("estou no if de cor")
        if PixelSearch(&Hx, &Hy, 92, 193, 477, 531, 0x00901C or 0x00921C or 0x00901D or 0x00901C or 0x00921F, 5) {
            if (attempts > max_attempts) {
                AddToLog("mandei upar")
                UpgradeUnits()
                break
            }

            TryPlaceAt(hx, hy) {
                SendInput(slot)
                Sleep(100)
                BetterClick(hx, hy)  ; Ajusta a coordenada para o centro do boneco
                Sleep(100)
                SendInput("q")

                ; Verifica se o posicionamento foi bem-sucedido
                if (IsPlacementSuccessful()) {
                    ; Salva a nova coordenada na lista de usadas
                    Hillx := hx
                    Hilly := hy
                    return true
                }
            }

            AddToLog("achei o hill verde porra")
            Sleep 100
            ; Tenta posicionar o boneco nas coordenadas exatas (Hx, Hy) primeiro
            if (TryPlaceAt(Hx, Hy)) {
                AddToLog("deu certo no x e y original")
                return true
            }
            Loop {
                if (attempts > max_attempts) {
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
                if (!IsCoordinateUsed(newHx, newHy, 20)) {
                    AddToLog("possica limpa")
                    SendInput(slot)
                    Sleep 100
                    BetterClick(newHx, newHy)  ; Usa as novas coordenadas somadas
                    AddToLog("valor de x" newHx "valor de y" newHy)  ; Usa as novas coordenadas somadas
                    Sleep 100
                    SendInput("q")

                    if IsPlacementSuccessful() {
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


TryPlacingUnitsMapa30() {
    global step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    ;tirar 35 dos valores do get range pq ele joga pra cima
    ;quando pegar o range troca o primeiro e o segundo y o maior valor comeca se nao ,trava no if abaixo
    jogarEmTudo()
    startX := 246, endY := 338, endX := 612, startY := 422
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
                if PlaceHillUnit30(slotNum) {
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
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
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


TryPlacingUnitsMapa21() {
    global step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    ;tirar 35 dos valores do get range pq ele joga pra cima
    ;quando pegar o range troca o primeiro e o segundo y o maior valor comeca se nao ,trava no if abaixo
    jogarEmTudo()
    startX := 400, endY := 206, endX := 536, startY := 500
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
                if PlaceHillUnit21(slotNum) {
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
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
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


TryPlacingUnitsMapa22() {
    global step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    ;tirar 35 dos valores do get range pq ele joga pra cima
    ;quando pegar o range troca o primeiro e o segundo y o maior valor comeca se nao ,trava no if abaixo
    jogarEmTudo()
    startX := 70, endY := 322, endX := 458, startY := 480
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
                if PlaceHillUnit22(slotNum) {
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
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
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


TryPlacingUnitsMapa23() {
    global step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    ;tirar 35 dos valores do get range pq ele joga pra cima
    ;quando pegar o range troca o primeiro e o segundo y o maior valor comeca se nao ,trava no if abaixo
    jogarEmTudo()
    startX := 134, endY := 295, endX := 654, startY := 410
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
                if PlaceHillUnit23(slotNum) {
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
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
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


TryPlacingUnitsMapa25() {
    global step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    ;tirar 35 dos valores do get range pq ele joga pra cima
    ;quando pegar o range troca o primeiro e o segundo y o maior valor comeca se nao ,trava no if abaixo
    jogarEmTudo()
    startX := 368, endY := 275, endX := 822, startY := 306
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
                if PlaceHillUnit25(slotNum) {
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
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
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


TryPlacingUnitsMapa26() {
    global step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    ;tirar 35 dos valores do get range pq ele joga pra cima
    ;quando pegar o range troca o primeiro e o segundo y o maior valor comeca se nao ,trava no if abaixo
    jogarEmTudo()
    startX := 454, endY := 195, endX := 608, startY := 515
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
                if PlaceHillUnit26(slotNum) {
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
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
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


TryPlacingUnitsMapa244() {
    global step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    ;tirar 35 dos valores do get range pq ele joga pra cima
    ;quando pegar o range troca o primeiro e o segundo y o maior valor comeca se nao ,trava no if abaixo
    jogarEmTudo()
    startX := 134, endY := 295, endX := 654, startY := 410
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
                if PlaceHillUnit244(slotNum) {
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
                jogarEmTudo()
            }
        }


        ; Continue placement for the current slot
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

jogarEmTudo() {
    Reconnect()
    CheckforNextButton()

}