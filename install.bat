@echo off

REM Extract OBS files
rmdir /S /Q ..\OBS-Studio\bin
rmdir /S /Q ..\OBS-Studio\config
rmdir /S /Q ..\OBS-Studio\data
rmdir /S /Q ..\OBS-Studio\obs-plugins
PowerShell -ExecutionPolicy Bypass -File .\unzip.ps1 ..\OBS-Studio
type NUL > ..\OBS-Studio\portable_mode.txt

cd ..
REM Make symlink in OBS executable directory for cleaner resource paths
mklink /J ".\OBS-Studio\bin\64bit\root" "%cd%"

REM Make symlink for config folder
mkdir ".\OBS-Studio\config\obs-studio"
mklink /J ".\OBS-Studio\config\obs-studio\basic" "%cd%\OBS-Settings"
