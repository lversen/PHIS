@echo off
setlocal enabledelayedexpansion

:: Swagger Codegen Python Generator Script for Windows
:: Usage: swagger-codegen-python.bat <input-json-file> [output-directory]

echo ========================================
echo Swagger Codegen Python Generator
echo ========================================
echo.

:: Check if input file is provided
if "%~1"=="" (
    echo ERROR: Please provide input JSON file as first argument
    echo Usage: %~nx0 ^<input-json-file^> [output-directory]
    exit /b 1
)

:: Set variables
set INPUT_FILE=%~1
set OUTPUT_DIR=%~2
set CODEGEN_VERSION=2.4.46
set JAR_NAME=swagger-codegen-cli-%CODEGEN_VERSION%.jar
set JAR_PATH=.\%JAR_NAME%
set DOWNLOAD_URL=https://repo1.maven.org/maven2/io/swagger/swagger-codegen-cli/%CODEGEN_VERSION%/%JAR_NAME%

:: Check if input file exists
if not exist "%INPUT_FILE%" (
    echo ERROR: Input file "%INPUT_FILE%" not found!
    exit /b 1
)

:: Set default output directory if not provided
if "%OUTPUT_DIR%"=="" (
    set OUTPUT_DIR=.\generated-python-client
    echo No output directory specified, using default: !OUTPUT_DIR!
)

:: Check if Java is installed
java -version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Java is not installed or not in PATH!
    echo Please install Java and add it to your system PATH.
    exit /b 1
)

echo Checking for Swagger Codegen JAR...

:: Check if JAR already exists
if exist "%JAR_PATH%" (
    echo Found existing JAR: %JAR_PATH%
    goto :generate
)

:: Ask user for installation method
echo.
echo JAR file not found. Choose installation method:
echo 1. Download pre-built JAR (Recommended - Faster)
echo 2. Build from source (Requires Git and Maven)
echo.
set /p INSTALL_METHOD="Enter choice (1 or 2): "

if "%INSTALL_METHOD%"=="1" goto :download_jar
if "%INSTALL_METHOD%"=="2" goto :build_from_source
echo Invalid choice. Defaulting to download method.
goto :download_jar

:download_jar
echo.
echo Downloading Swagger Codegen JAR...
echo URL: %DOWNLOAD_URL%

:: Check if curl is available
where curl >nul 2>&1
if errorlevel 1 (
    :: Use PowerShell if curl is not available
    echo Using PowerShell to download...
    powershell -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%DOWNLOAD_URL%' -OutFile '%JAR_PATH%'}"
) else (
    :: Use curl if available
    echo Using curl to download...
    curl -L -o "%JAR_PATH%" "%DOWNLOAD_URL%"
)

if not exist "%JAR_PATH%" (
    echo ERROR: Failed to download JAR file!
    exit /b 1
)

echo Download complete!
goto :generate

:build_from_source
echo.
echo Building from source...

:: Check if Git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Git is not installed or not in PATH!
    echo Please install Git or choose option 1 to download pre-built JAR.
    exit /b 1
)

:: Check if Maven is installed
mvn -version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Maven is not installed or not in PATH!
    echo Please install Maven or choose option 1 to download pre-built JAR.
    exit /b 1
)

:: Clone repository if it doesn't exist
if not exist "swagger-codegen" (
    echo Cloning Swagger Codegen repository...
    git clone https://github.com/swagger-api/swagger-codegen
    if errorlevel 1 (
        echo ERROR: Failed to clone repository!
        exit /b 1
    )
)

:: Build the project
echo Building Swagger Codegen...
cd swagger-codegen
git checkout v%CODEGEN_VERSION%
call mvn clean package -DskipTests
if errorlevel 1 (
    echo ERROR: Build failed!
    cd ..
    exit /b 1
)

:: Copy JAR to parent directory
copy "modules\swagger-codegen-cli\target\swagger-codegen-cli.jar" "..\%JAR_PATH%"
cd ..

if not exist "%JAR_PATH%" (
    echo ERROR: JAR file not found after build!
    exit /b 1
)

echo Build complete!

:generate
echo.
echo ========================================
echo Generating Python Client
echo ========================================
echo Input:  %INPUT_FILE%
echo Output: %OUTPUT_DIR%
echo.

:: Create output directory if it doesn't exist
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

:: Generate Python client
echo Running code generation...
java -jar "%JAR_PATH%" generate ^
    -i "%INPUT_FILE%" ^
    -l python ^
    -o "%OUTPUT_DIR%" ^
    --additional-properties packageName=swagger_client,projectName=swagger-client,packageVersion=1.0.0

if errorlevel 1 (
    echo ERROR: Code generation failed!
    exit /b 1
)

echo.
echo ========================================
echo Generation Complete!
echo ========================================
echo.
echo Python client generated in: %OUTPUT_DIR%
echo.
echo Next steps:
echo 1. Navigate to: cd "%OUTPUT_DIR%"
echo 2. Install dependencies: pip install -r requirements.txt
echo 3. Install the package: pip install -e .
echo.
echo To see all Python-specific options, run:
echo java -jar "%JAR_PATH%" config-help -l python
echo.

:: Ask if user wants to see the generated files
set /p VIEW_FILES="Would you like to see the generated files? (y/n): "
if /i "%VIEW_FILES%"=="y" (
    echo.
    echo Generated files:
    dir /b "%OUTPUT_DIR%"
    echo.
    echo Opening output directory...
    start "" "%OUTPUT_DIR%"
)

endlocal
exit /b 0