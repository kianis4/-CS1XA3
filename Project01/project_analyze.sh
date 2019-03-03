#!/bin/bash

REPO_ROOT_PATH="../"

echo -e "What number Feature would you like to use?\n1.Display #TODO lines?\n2.File Type Count?\n3.Compile Fail log?\n4.Create File with text?"
read -r featName

        if [ $featName == 2 ]; then
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

	elif [ $featName == 3 ]; then


	     echo "Here are Haskell and python files that do not compile:" > compile_fail_log.log
	     find ~/CS1XA3/ -name "*.hs" | xargs -I {} ghc -fno-code {} &> compile_fail_log.log
	     find ~/CS1XA3/ -name "*.py" | while read -r fileli; do
		  if ! python -Bm py_compile $fileli &> /dev/null; then
			echo $fileli >> compile_fail_log.log
		  fi
		  rm -f "${fileli%??}pyc"
	     cat compile_fail_log.log
	done

	elif [ $featName == 4 ]; then


	read -p "What would you like to name your file (Ensure extension of file is added)? " filename
            	touch $filename
            	read -p "Would you like to add anything to $name? (Y/N) " x
            	while [ $x != "N" ]
            	do
                	read -p "Please enter text: " text
                	echo -e "$text\n" >> $filename #adds each entry onto it's own line
                	read -p "Would you like to add another line? (Y/N) " x
            	done
            	read -p "Would you like to view $name? (Y/N) " n
            	if [ $n == "Y" ]
            	then
                	cat $filename
            	fi

        else
	    echo Error, incorrect input. Please choose a number feature you would like to use.
	fi
echo Thank you!

