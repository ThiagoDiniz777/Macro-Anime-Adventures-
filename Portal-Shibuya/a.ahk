#Requires AutoHotkey v2.0

#Include %A_ScriptDir%\Lib\FindText.ahk
#Include <FindText>


; Coordenadas da região da tela que você deseja capturar
X1 := 484  ; Coordenada X do canto superior esquerdo
Y1 := 315  ; Coordenada Y do canto superior esquerdo
X2 := 585   ; Coordenada X do canto inferior direito
Y2 := 337  ; Coordenada Y do canto inferior direito

; Captura a região da tela e gera o código da imagem
Text := FindText().GetTextFromScreen(X1, Y1, X2, Y2)

; Exibe o código gerado em uma caixa de mensagem
;MsgBox("Código da imagem capturada:`n" Text)

; Copia o código para a área de transferênciaw
A_Clipboard := Text
MsgBox("O código foi copiado para a área de transferência!")