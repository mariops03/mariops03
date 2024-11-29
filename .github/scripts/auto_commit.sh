#!/bin/sh
# Genera un número aleatorio entre 0 y 1
COMMIT_PROBABILITY=$(shuf -i 0-1 -n 1)
# Si el número es 1, realiza el commit
if [ "$COMMIT_PROBABILITY" -eq 1 ]; then
  # Escribe la fecha y hora actual en un archivo llamado commit.txt
  echo "$(date)" > commit.txt
  # Añade el archivo al área de staging
  git add commit.txt
  # Realiza el commit con un mensaje que incluye la fecha y hora actuales
  git commit -m "Commit automatizado: $(date)"
  # Envía los cambios al repositorio remoto en la rama 'main'
  git push origin main
else
  echo "No se realizará un commit en esta ejecución."
fi
