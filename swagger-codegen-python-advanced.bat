@echo off
setlocal enabledelayedexpansion

:: Advanced Swagger Codegen Python Generator Script for Windows
:: Usage: swagger-codegen-python-advanced.bat <input-json-file> [options]

echo ========================================
echo Advanced Swagger Codegen Python Generator
echo ========================================
echo.

:: Initialize variables
set INPUT_FILE=
set OUTPUT_DIR=.\generated-python-client
set PACKAGE_NAME=swagger_client
set PACKAGE_VERSION=1.0.0
set PROJECT_NAME=swagger-client
set CONFIG_FILE=
set VERBOSE=false
set SKIP_VALIDATION=false
set CODEGEN_VERSION=2.4.46
set JAR_NAME=swagger-codegen-cli-%CODEGEN_VERSION%.jar
set JAR_PATH=.\%JAR_NAME%
set DOWNLOAD_URL=https://repo1.maven.org/maven2/io/swagger/swagger-codegen-cli/%CODEGEN_VERSION%/%JAR_NAME%

:: Parse command line arguments
:parse_args
if "%~1"=="" goto :args_done
if /i "%~1"=="-h" goto :show_help
if /i "%~1"=="--help" goto :show_help
if /i "%~1"=="-i" (
    set INPUT_FILE=%~2
    shift
    shift
    goto :parse_args
)
if /i "%~1"=="--input" (
    set INPUT_FILE=%~2
    shift
    shift
    goto :parse_args
)
if /i "%~1"=="-o" (
    set OUTPUT_DIR=%~2
    shift
    shift
    goto :parse_args
)
if /i "%~1"=="--output" (
    set OUTPUT_DIR=%~2
    shift
    shift
    goto :parse_args
)
if /i "%~1"=="-p" (
    set PACKAGE_NAME=%~2
    shift
    shift
    goto :parse_args
)
if /i "%~1"=="--package" (
    set PACKAGE_NAME=%~2
    shift
    shift
    goto :parse_args
)
if /i "%~1"=="-v" (
    set PACKAGE_VERSION=%~2
    shift
    shift
    goto :parse_args
)
if /i "%~1"=="--version" (
    set PACKAGE_VERSION=%~2
    shift
    shift
    goto :parse_args
)
if /i "%~1"=="-n" (
    set PROJECT_NAME=%~2
    shift
    shift
    goto :parse_args
)
if /i "%~1"=="--name" (
    set PROJECT_NAME=%~2
    shift
    shift
    goto :parse_args
)
if /i "%~1"=="-c" (
    set CONFIG_FILE=%~2
    shift
    shift
    goto :parse_args
)
if /i "%~1"=="--config" (
    set CONFIG_FILE=%~2
    shift
    shift
    goto :parse_args
)
if /i "%~1"=="--verbose" (
    set VERBOSE=true
    shift
    goto :parse_args
)
if /i "%~1"=="--skip-validation" (
    set SKIP_VALIDATION=true
    shift
    goto :parse_args
)
:: If no flag matched, assume it's the input file
if not defined INPUT_FILE (
    set INPUT_FILE=%~1
)
shift
goto :parse_args

:args_done

:: Validate input
if not defined INPUT_FILE (
    echo ERROR: No input file specified!
    echo.
    goto :show_help
)

:: Check if input file exists
if not exist "%INPUT_FILE%" (
    echo ERROR: Input file "%INPUT_FILE%" not found!
    exit /b 1
)

:: Display configuration
echo Configuration:
echo   Input file:       %INPUT_FILE%
echo   Output directory: %OUTPUT_DIR%
echo   Package name:     %PACKAGE_NAME%
echo   Package version:  %PACKAGE_VERSION%
echo   Project name:     %PROJECT_NAME%
if defined CONFIG_FILE echo   Config file:      %CONFIG_FILE%
echo   Verbose:          %VERBOSE%
echo   Skip validation:  %SKIP_VALIDATION%
echo.

:: Check Java installation
java -version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Java is not installed or not in PATH!
    echo Please install Java and add it to your system PATH.
    exit /b 1
)

:: Check for JAR file
if not exist "%JAR_PATH%" (
    echo Swagger Codegen JAR not found. Downloading...
    call :download_jar
    if errorlevel 1 exit /b 1
)

:: Validate the OpenAPI spec (unless skipped)
if not "%SKIP_VALIDATION%"=="true" (
    echo Validating OpenAPI specification...
    java -jar "%JAR_PATH%" validate -i "%INPUT_FILE%"
    if errorlevel 1 (
        echo WARNING: Validation failed. Continue anyway? (y/n)
        set /p CONTINUE=
        if /i not "!CONTINUE!"=="y" exit /b 1
    ) else (
        echo Validation passed!
    )
    echo.
)

:: Create output directory
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

:: Build the generation command
set GEN_CMD=java -jar "%JAR_PATH%" generate -i "%INPUT_FILE%" -l python -o "%OUTPUT_DIR%"
set GEN_CMD=%GEN_CMD% --additional-properties packageName=%PACKAGE_NAME%,projectName=%PROJECT_NAME%,packageVersion=%PACKAGE_VERSION%

:: Add config file if specified
if defined CONFIG_FILE (
    if exist "%CONFIG_FILE%" (
        set GEN_CMD=%GEN_CMD% -c "%CONFIG_FILE%"
    ) else (
        echo WARNING: Config file "%CONFIG_FILE%" not found, ignoring...
    )
)

:: Add verbose flag if set
if "%VERBOSE%"=="true" (
    set GEN_CMD=%GEN_CMD% -v
)

:: Generate Python client
echo Generating Python client...
if "%VERBOSE%"=="true" (
    echo Command: %GEN_CMD%
    echo.
)

%GEN_CMD%

if errorlevel 1 (
    echo ERROR: Code generation failed!
    exit /b 1
)

:: Create requirements.txt if it doesn't exist
if not exist "%OUTPUT_DIR%\requirements.txt" (
    echo Creating requirements.txt...
    (
        echo certifi ^>= 14.05.14
        echo six ^>= 1.10
        echo python_dateutil ^>= 2.5.3
        echo setuptools ^>= 21.0.0
        echo urllib3 ^>= 1.15.1
    ) > "%OUTPUT_DIR%\requirements.txt"
)

:: Create a simple setup script
echo @echo off > "%OUTPUT_DIR%\setup.bat"
echo echo Installing %PROJECT_NAME% dependencies... >> "%OUTPUT_DIR%\setup.bat"
echo pip install -r requirements.txt >> "%OUTPUT_DIR%\setup.bat"
echo echo Installing %PROJECT_NAME%... >> "%OUTPUT_DIR%\setup.bat"
echo pip install -e . >> "%OUTPUT_DIR%\setup.bat"
echo echo Setup complete! >> "%OUTPUT_DIR%\setup.bat"

:: Create a simple example script
call :create_example

echo.
echo ========================================
echo Generation Complete!
echo ========================================
echo.
echo Generated Python client in: %OUTPUT_DIR%
echo.
echo Quick start:
echo   cd "%OUTPUT_DIR%"
echo   setup.bat
echo   python example.py
echo.

:: Offer to open the directory
set /p OPEN_DIR="Open output directory? (y/n): "
if /i "%OPEN_DIR%"=="y" start "" "%OUTPUT_DIR%"

endlocal
exit /b 0

:download_jar
:: Download the JAR file
where curl >nul 2>&1
if errorlevel 1 (
    powershell -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%DOWNLOAD_URL%' -OutFile '%JAR_PATH%'}"
) else (
    curl -L -o "%JAR_PATH%" "%DOWNLOAD_URL%"
)
if not exist "%JAR_PATH%" (
    echo ERROR: Failed to download JAR file!
    exit /b 1
)
echo Download complete!
exit /b 0

:create_example
:: Create a simple example file
(
echo # Example usage of the generated %PROJECT_NAME% client
echo.
echo import %PACKAGE_NAME%
echo from %PACKAGE_NAME%.rest import ApiException
echo from pprint import pprint
echo.
echo # Configure API client
echo configuration = %PACKAGE_NAME%.Configuration^(^)
echo # Uncomment below to set your host
echo # configuration.host = 'https://your-api-host.com'
echo.
echo # Create an instance of the API client
echo api_instance = %PACKAGE_NAME%.DefaultApi^(%PACKAGE_NAME%.ApiClient^(configuration^)^)
echo.
echo try:
echo     # Example API call - adjust based on your API
echo     # api_response = api_instance.your_api_method^(^)
echo     # pprint^(api_response^)
echo     print^("API client initialized successfully!"^)
echo except ApiException as e:
echo     print^("Exception when calling API: %%s\n" %% e^)
) > "%OUTPUT_DIR%\example.py"
exit /b 0

:show_help
echo Usage: %~nx0 [options] ^<input-file^>
echo        %~nx0 -i ^<input-file^> [options]
echo.
echo Options:
echo   -h, --help              Show this help message
echo   -i, --input FILE        Input OpenAPI/Swagger specification file (JSON or YAML)
echo   -o, --output DIR        Output directory (default: .\generated-python-client)
echo   -p, --package NAME      Python package name (default: swagger_client)
echo   -v, --version VERSION   Package version (default: 1.0.0)
echo   -n, --name NAME         Project name (default: swagger-client)
echo   -c, --config FILE       Configuration file for additional options
echo   --verbose               Enable verbose output
echo   --skip-validation       Skip OpenAPI spec validation
echo.
echo Examples:
echo   %~nx0 petstore.json
echo   %~nx0 -i api.yaml -o my-client -p my_api_client
echo   %~nx0 --input spec.json --package custom_client --version 2.0.0
echo.
exit /b 0