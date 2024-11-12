@echo off
set LPF_VERSION="0_2_0"
:: Discovers your path to the "Documents" folder via registry
for /f "tokens=1,2*" %%A in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Personal" 2^>nul') do set DOCS_ROOT=%%C
:: This is your path to the Lotro plugins directory
set PLUGINS_FOLDER=%DOCS_ROOT%"\The Lord of the Rings Online\Plugins"
:: This deletes old LPF version Folder
@RD /S /Q %PLUGINS_FOLDER%"\LotroPluginFramework\"%LPF_VERSION%
:: This copies the new LPF version folder to the Lotro plugins directory
mkdir %PLUGINS_FOLDER%"\LotroPluginFramework\"
mkdir %PLUGINS_FOLDER%"\LotroPluginFramework\"%LPF_VERSION%
xcopy /s /q "%~dp0dist\LotroPluginFramework" %PLUGINS_FOLDER%"\LotroPluginFramework\"%LPF_VERSION%
:: Now do the same thing with all your plugins you wanna test like in example below
@RD /S /Q  %PLUGINS_FOLDER%"\LPFHelloWorld"
mkdir %PLUGINS_FOLDER%"\LPFHelloWorld"
xcopy /s /q "%~dp0plugins\LPFHelloWorld" %PLUGINS_FOLDER%"\LPFHelloWorld"
@RD /S /Q  %PLUGINS_FOLDER%"\LPFParser"
mkdir %PLUGINS_FOLDER%"\LPFParser"
xcopy /s /q "%~dp0plugins\LPFParser" %PLUGINS_FOLDER%"\LPFParser"
@RD /S /Q  %PLUGINS_FOLDER%"\Exodia"
mkdir %PLUGINS_FOLDER%"\Exodia"
xcopy /s /q "%~dp0plugins\Exodia" %PLUGINS_FOLDER%"\Exodia"
:: Uncomment pause if you want
:: pause