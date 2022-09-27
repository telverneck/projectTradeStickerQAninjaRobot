# robotProject
 
# Author: Telmo Rodrigues Correa

# This Base project for Robot Framework

## Installation:
- Requires Robot Framework 
- Python 2.7 or above
- after downloading the project, please install python and use this pip commands: 

```shell
pip install robotframework
```

```shell
pip install --upgrade robotframework-seleniumlibrary
```

- Add webdriver to the path (eg: Chromedriver, geckodriver)

## Allure report
    - Install Node
    - install Java
    - After installing type the command line bellow:

```shell
npm install -g allure-commandline --save-dev
```
Run command
```shell
robot --listener allure_robotframework:Allure_Report tests
```
To Open Allure report, type the command line:
```shell
allure serve Allure_Report 
```


## Screenshots, Console log and reports:
project\Results

## Console logs:
project\Results


## Commands:
full test cycle: 
```shell
robot -d ./Results tests
```


Smoke test: 
```shell
robot -d ./Results -i smoke tests
```

## How to run Tests Parallelly:
Install robotframework-pabot  

```shell
pip install -U robotframework-pabot 
```

Run: 
```shell
pabot --processes 2 --outputdir Results\ tests\*.robot
```

Note: add this parameters to ignore errors in the base page:
Open Browser        about:blank   Chrome         executable_path=C:/path/to/chromedrive     options=add_argument("--ignore-certificate-errors")
