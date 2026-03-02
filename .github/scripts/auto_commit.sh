#!/bin/sh
# Genera un número aleatorio entre 0 y 99
RANDOM_NUM=$(shuf -i 0-99 -n 1)
# 27% de probabilidad de commit (si el número es menor que 27)
if [ "$RANDOM_NUM" -lt 27 ]; then
  echo "$(date)" > commit.txt
  git add commit.txt
  git commit -m "Commit automatizado: $(date)"
  git push origin main
else
  echo "No se realizará un commit en esta ejecución."
fi