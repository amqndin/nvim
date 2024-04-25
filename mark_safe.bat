@echo off

rem Define the base directory containing your Neovim plugins (replace with your actual path)
set "BASE_DIR=C:\Users\User\AppData\Local\nvim-data\lazy"

FOR /F "delims=\ tokens=*" %%a IN ('dir /b /ad "%BASE_DIR%"') DO (
  git config --global --add safe.directory "%BASE_DIR%\%%a"
)

echo Done adding safe directories!
