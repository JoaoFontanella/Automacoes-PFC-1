Global $logFile = @ScriptDir & "\log_cliente.txt"
Local $janela = "Controle De Estoque-DQL  Versão  22.0008.04 Compilação 669  27/01/2026"

Func EscreverLog($texto)
    Local $hFile = FileOpen($logFile, 1)
    If $hFile <> -1 Then
        FileWriteLine($hFile, @HOUR & ":" & @MIN & ":" & @SEC & " - " & $texto)
        FileClose($hFile)
    EndIf
EndFunc

Func EsperarControle($titulo, $controle, $tempoLimite = 10)
    Local $tempo = TimerInit()
    While ControlGetHandle($titulo, "", $controle) = ""
        If TimerDiff($tempo) > ($tempoLimite * 1000) Then
            Return 0
        EndIf
        Sleep(300)
    WEnd
    Return 1
EndFunc

EscreverLog("Início do teste de cadastro de cliente.")

; Clica "OK" na tela de aviso
ControlClick("Aviso", "", 16388)
EscreverLog("Botão OK da tela de aviso clicado.")

; Seleciona a filial "Teste" na tela de seleção de filial
If WinWait($janela, "", 10) = 0 Then
    EscreverLog("ERRO: janela principal não apareceu.")
    Exit
EndIf
EscreverLog("Janela principal encontrada.")

ControlClick($janela, "", 16386)
EscreverLog("Primeiro clique na filial realizado.")

WinWait($janela)
ControlClick($janela, "", 16392)
EscreverLog("Segundo clique na filial realizado.")

WinWait($janela)
ControlClick($janela, "", 16392)
EscreverLog("Terceiro clique na filial realizado.")

WinWait("Aviso")
ControlClick("Aviso", "", 16388)
EscreverLog("Botão OK da segunda tela de aviso clicado.")

Sleep(1300)

; Seleciona o Cadastro de Cliente
If WinWait($janela, "", 10) = 0 Then
    EscreverLog("ERRO: janela principal não apareceu para acessar cadastro de cliente.")
    Exit
EndIf
EscreverLog("Janela principal ativa para cadastro de cliente.")

ControlClick($janela, "", 16386)
EscreverLog("Menu de cadastro de cliente acessado.")

; Seleciona para adicionar um novo cliente
If WinWait($janela, "", 10) = 0 Then
    EscreverLog("ERRO: janela principal não apareceu para novo cadastro.")
    Exit
EndIf
EscreverLog("Janela principal pronta para novo cadastro.")

ControlClick($janela, "", 16401)
EscreverLog("Botão de novo cliente clicado.")

Sleep(2000)

; Nome
If EsperarControle($janela, 16397, 10) = 0 Then
    EscreverLog("ERRO: controle 16397 não encontrado.")
    Exit
EndIf
ControlClick($janela, "", 16397)
ControlSend($janela, "", 16397, "Teste")
EscreverLog("Campo Nome preenchido.")

; Endereço
If EsperarControle($janela, 16410, 10) = 0 Then
    EscreverLog("ERRO: controle 16410 não encontrado.")
    Exit
EndIf
ControlClick($janela, "", 16410)
ControlSend($janela, "", 16410, "Endereço de Teste")
EscreverLog("Campo Endereço preenchido.")

; Bairro
If EsperarControle($janela, 16412, 10) = 0 Then
    EscreverLog("ERRO: controle 16412 não encontrado.")
    Exit
EndIf
ControlClick($janela, "", 16412)
ControlSend($janela, "", 16412, "Bairro de Teste")
EscreverLog("Campo Bairro preenchido.")

; Cidade
If EsperarControle($janela, 16414, 10) = 0 Then
    EscreverLog("ERRO: controle 16414 não encontrado.")
    Exit
EndIf
ControlClick($janela, "", 16414)
ControlSend($janela, "", 16414, "Criciúma")
EscreverLog("Campo Cidade preenchido.")

; País
If EsperarControle($janela, 16416, 10) = 0 Then
    EscreverLog("ERRO: controle 16416 não encontrado.")
    Exit
EndIf
ControlClick($janela, "", 16416)
ControlSend($janela, "", 16416, "Brasil")
EscreverLog("Campo País preenchido.")

; Celular
If EsperarControle($janela, 16426, 10) = 0 Then
    EscreverLog("ERRO: controle 16426 não encontrado.")
    Exit
EndIf
ControlClick($janela, "", 16426)
ControlSend($janela, "", 16426, "(48) 99999-9999")
EscreverLog("Campo Celular preenchido.")

; Confirma o cadastro
If EsperarControle($janela, 16464, 10) = 0 Then
    EscreverLog("ERRO: botão de confirmação não encontrado.")
    Exit
EndIf
ControlClick($janela, "", 16464)
EscreverLog("Cadastro confirmado.")

EscreverLog("Fim do teste de cadastro de cliente.")
MsgBox(64, "Sucesso", "Teste executado com sucesso.")