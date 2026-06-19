@echo off
setlocal enabledelayedexpansion

:: Caminho para o arquivo que forca o idioma
set "FILE_PATH=game\force_language.rpy"

echo =========================================
echo    Alternador de Idioma - Echo VN
echo =========================================
echo.

:: Se o arquivo nao existir, ele cria setando para PT-BR
if not exist "%FILE_PATH%" (
    echo init python: > "%FILE_PATH%"
    echo     config.language = "ptbr" >> "%FILE_PATH%"
    echo [SUCESSO] Arquivo criado! O idioma foi definido para PT-BR.
    goto :Fim
)

:: Se o arquivo existir, verifica qual o idioma atual
findstr /C:"config.language = \"ptbr\"" "%FILE_PATH%" >nul
if !errorlevel! equ 0 (
    :: Se estiver PT-BR, muda para o Original (None)
    echo init python: > "%FILE_PATH%"
    echo     config.language = None >> "%FILE_PATH%"
    echo [SUCESSO] Idioma alterado para o ORIGINAL ^(Ingles^)!
) else (
    :: Se estiver no original ou outro, muda para PT-BR
    echo init python: > "%FILE_PATH%"
    echo     config.language = "ptbr" >> "%FILE_PATH%"
    echo [SUCESSO] Idioma alterado para PT-BR!
)

:Fim
echo.
pause
