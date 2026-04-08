#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

python -m pip install --upgrade pip setuptools wheel build
python -m build

wheel=$(ls dist/subnet-calculator-*.whl | sort | tail -n 1)
if [ -z "$wheel" ]; then
  echo "Wheel file not found in dist/." >&2
  exit 1
fi

python -m pip install --user --force-reinstall "$wheel"

echo "Done. The subnet-calc command is now installed for your user."
echo "If it is not found in your terminal, add ~/.local/bin to PATH."
