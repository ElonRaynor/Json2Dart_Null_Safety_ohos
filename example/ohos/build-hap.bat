@echo off
set DEVECO_HOME=D:\Tools\Huawei\devecostudio\devecostudio-windows-6.1.0.830\DevEco_Studio
set NODE_HOME=%DEVECO_HOME%\tools\node
set OHPM_HOME=%DEVECO_HOME%\tools\ohpm\bin
set PATH=%NODE_HOME%;%OHPM_HOME%;%PATH%
"%DEVECO_HOME%\tools\hvigor\bin\hvigorw.bat" %*