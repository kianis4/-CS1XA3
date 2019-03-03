#!/bin/bash

REPO_ROOT_PATH="../"

echo -e "What number Feature would you like to use?\n1.Display #TODO lines?\n2.File Type Count?"
read -r featName

        if [ $featName == 2 ]; then
	    erin=0
            htmlFind=$(find ~/CS1XA3/ -name "*.html" | wc -l)
	    javaFind=$(find ~/CS1XA3/ -name "*.js" | wc -l)
	    cssFind=$(find ~/CS1XA3/ -name "*.css" | wc -l)
	    pyFind=$(find ~/CS1XA3/ -name "*.py" | wc -l)
	    haskellFind=$(find ~/CS1XA3/ -name "*.hs" | wc -l)
	    bashFind=$(find ~/CS1XA3/ -name "*.sh" | wc -l)

	    echo HTML  : $htmlFind
	    echo JAVA  : $javaFind
	    echo CSS   : $cssFind
	    echo Python: $pyFind
	    echo HASKEL: $haskellFind
	    echo BASH  : $bashFind

        elif [ $featName == 1 ]; then
             grep -E "#TODO" $REPO_ROOT_PATH -r -n --exclude=todo.log --exclude=project_analyze.sh > todo.log
             read -p "Would you like to view the list of lines containing #TODO? (y/n)" pick

             if [ $pick == "Y" ] || [ $pick == "y" ]; then
                echo -e "Here is #TODO:"
                cat todo.log
             fi
        else
	    echo Error, incorrect input. Please choose a number feature you would like to use.
	fi

echo Thank you!
