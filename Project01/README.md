# CS1XA3 Project 1

Project 1 is a bash script that performs a handful of features by asking the user which feature they want to execute. This script implements feature 5.1 (Script Input), feature 5.2 (TODO list), feature 5.3 (Compile Error log), feature 5.5 (File type count), and a custom feature which allows the user to 

## Features
```
### Script Input
This feature is integrated into the script. Once you execute the script by typing "./project01_analyze.sh", the user will be prompted to pick one of the 4 available features. The user must input the corresponding number to the feature they wish to use into the command line. Otherwise the script will give the user an error if any incorrect input is given and the script will have to be ran again and a correct input should be given.
```
```

### 1. TODO list

This feature allows the user to see any place #TODO appear in his repository. To use this feature, user must enter 1 when prompted too select a feature. Executing this will create a file called todo.log. This file contains all places #TODO appear in the directory excluding the  project01_analyze.sh script. The user will then be prompted if they would like to display this file. If the user types 'y' or 'Y' it will be displayed. and then the script will be exited. The user can run another feature by exicuting the script again if they wish.

```
### 2. File Type Count  

This feature allows the user to display how many of each type of file (py,hs,html,sh,css,js) are in the repo. When the user selects this option when prompted, a list of all file types, and the corresponding amount of files that exist in the repo will appear.
```

### 3. Compile Error Log

This feature checks through the directory for Haskell and python files and checks to see if they can execute. All files with syntacx erros are added into a file called compile_fail_log.log. When used the feature will display this file.
