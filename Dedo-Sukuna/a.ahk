#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\Lib\gui.ahk
#Include %A_ScriptDir%\Lib\FindText.ahk
#Include %A_ScriptDir%\Lib\OCR-main\Lib\OCR.ahk
#Include %A_ScriptDir%\Lib\WebhookOptions.ahk


#Include <FindText>


; Coordenadas da região da tela que você deseja capturar
X1 := 224 ; Coordenada X do canto superior esquerdo
Y1 := 309  ; Coordenada Y do canto superior esquerdo
X2 := 277  ; Coordenada X do canto inferior direito
Y2 := 342  ; Coordenada Y do canto inferior direito

; Captura a região da tela e gera o código da imagem
Text := FindText().GetTextFromScreen(X1, Y1, X2, Y2)

; Exibe o código gerado em uma caixa de mensagem
;MsgBox("Código da imagem capturada:`n" Text)

; Copia o código para a área de transferência
A_Clipboard := Text
MsgBox("O código foi copiado para a área de transferência!")