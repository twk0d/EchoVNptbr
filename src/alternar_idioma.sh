#!/bin/sh

FILE_PATH="game/force_language.rpy"

echo "========================================="
echo "   Alternador de Idioma - Echo VN"
echo "========================================="
echo ""

# Se o arquivo não existir, cria com PT-BR
if [ ! -f "$FILE_PATH" ]; then
    printf 'init python:\n    config.language = "ptbr"\n' > "$FILE_PATH"
    echo "[SUCESSO] Arquivo criado! O idioma foi definido para PT-BR."
    exit 0
fi

# Verifica o idioma atual
if grep -q 'config.language = "ptbr"' "$FILE_PATH"; then
    # Se estiver PT-BR, muda para Original (None)
    printf 'init python:\n    config.language = None\n' > "$FILE_PATH"
    echo "[SUCESSO] Idioma alterado para o ORIGINAL (Ingles)!"
else
    # Se estiver no original ou outro, muda para PT-BR
    printf 'init python:\n    config.language = "ptbr"\n' > "$FILE_PATH"
    echo "[SUCESSO] Idioma alterado para PT-BR!"
fi

echo ""
read -p "Pressione Enter para continuar..."