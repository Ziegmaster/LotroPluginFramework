@echo off
:: Discovers your path to the "Documents" folder via registry
for /f "tokens=1,2*" %%A in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Personal" 2^>nul') do set DOCS_ROOT=%%C
:: This is your path to the Lotro plugins directory
set PLUGINS_FOLDER=%DOCS_ROOT%"\The Lord of the Rings Online\Plugins"
:: This deletes old LPF Folder
@RD /S /Q %PLUGINS_FOLDER%"\LotroPluginFramework"
:: This copies the new LPF Folder to the Lotro plugins directory
xcopy /s /q "%~dp0dist" %PLUGINS_FOLDER%
:: Now do the same thing with all your plugins you wanna test like in example below
@RD /S /Q  %PLUGINS_FOLDER%"\LPFHelloWorld"
mkdir %PLUGINS_FOLDER%"\LPFHelloWorld"
xcopy /s /q "%~dp0plugins\LPFHelloWorld" %PLUGINS_FOLDER%"\LPFHelloWorld"
:: Uncomment pause if you want
:: pause