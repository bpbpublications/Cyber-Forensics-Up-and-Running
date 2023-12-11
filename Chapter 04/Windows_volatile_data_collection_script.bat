@echo off 
setlocal 
rem Output directory for collected data 
set outputdir=%cd%\VolatileData 
  
rem Create output directory if it doesn't exist 
if not exist "%outputdir%" mkdir "%outputdir%" || ( 
    echo Failed to create output directory. 
    exit /b 1 
) 
  
rem Collect system information 
systeminfo > "%outputdir%\systeminfo.txt" || ( 
    echo Failed to collect system information. 
    exit /b 1 
) 
  
rem Collect list of running processes 
tasklist > "%outputdir%\tasklist.txt" || ( 
    echo Failed to collect tasklist information. 
    exit /b 1 
) 
  
rem Collect network connection information 
netstat -ano > "%outputdir%\netstat.txt" || ( 
    echo Failed to collect netstat information. 
    exit /b 1 
) 
  
rem Collect list of loaded drivers 
driverquery > "%outputdir%\driverquery.txt" || ( 
    echo Failed to collect driverquery information. 
    exit /b 1 
) 
  
rem Collect list of scheduled tasks 
schtasks /query /fo LIST /v > "%outputdir%\schtasks.txt" || ( 
    echo Failed to collect schtasks information. 
    exit /b 1 
) 
  
rem Collect list of active network interfaces 
ipconfig /all > "%outputdir%\ipconfig.txt" || ( 
    echo Failed to collect ipconfig information. 
    exit /b 1 
) 
  
rem Collect list of installed programs 
wmic product get name, version, vendor > "%outputdir%\installedprograms.txt" || ( 
    echo Failed to collect installed programs information. 
    exit /b 1 
) 
  
rem Collect list of running services 
sc query > "%outputdir%\running_services.txt" || ( 
    echo Failed to collect running services information. 
    exit /b 1 
) 
echo Data collection is completed successfully. 
 
rem Dump system RAM memory using FTK Imager Lite  mkdir "%outputdir%\memory_dump"  cd /d "c:\Program Files\AccessData\FTK Imager Lite"  echo Creating memory dump, this may take a while...  .\FTKImager.exe \\.\PhysicalMemory "%outputdir%\memory_dump\memory.img"  if errorlevel 1 (      echo Failed to create memory dump.      exit /b 1  )    cd /d "%~dp0"  REM Return to the original directory    echo Data collection and memory dump completed successfully. 
