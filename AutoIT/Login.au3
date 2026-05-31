Global $logFile = @ScriptDir & "\log_login.txt"

Func EscreverLog($texto)
    Local $hFile = FileOpen($logFile, 1)
    If $hFile <> -1 Then
        FileWriteLine($hFile, @HOUR & ":" & @MIN & ":" & @SEC & " - " & $texto)
        FileClose($hFile)
    EndIf
EndFunc

Run("C:\DQL_SIST\ESTOQUE\estoque.exe")
EscreverLog("Sistema iniciado.")

If WinWaitActive("Selecionar o caminho da base de dados", "", 10) = 0 Then
    EscreverLog("ERRO: janela de seleção da base não apareceu.")
    Exit
EndIf
EscreverLog("Janela de seleção da base exibida.")

ControlClick("Selecionar o caminho da base de dados", "", 16386)

If WinWaitActive("CONTROLE DE ESTOQUE", "", 50) = 0 Then
    EscreverLog("ERRO: janela de login não apareceu.")
    Exit
EndIf
EscreverLog("Janela de login exibida.")

ControlClick("CONTROLE DE ESTOQUE", "", 16387)
ControlSend("CONTROLE DE ESTOQUE", "", 16387, "DQL")
EscreverLog("Login preenchido.")

ControlClick("CONTROLE DE ESTOQUE", "", 16389)
ControlSend("CONTROLE DE ESTOQUE", "", 16389, "DQL")
EscreverLog("Senha preenchida.")

ControlClick("CONTROLE DE ESTOQUE", "", 16390)
EscreverLog("Botão de login clicado.")

If WinWaitActive("Registro do Sistema", "", 10) = 0 Then
    EscreverLog("ERRO: janela 'Registro do Sistema' não apareceu.")
    Exit
EndIf
EscreverLog("Janela 'Registro do Sistema' exibida.")

ControlClick("Registro do Sistema", "", 16388)
EscreverLog("Botão continuar clicado.")

EscreverLog("Fim do teste de Login.")
MsgBox(64, "Sucesso", "Teste executado com sucesso.")


