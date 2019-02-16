#!/bin/bash
erin=0
while [ erin=1 ]
do
echo -e "What number Feature would you like to use?\n1.Delete Temp File?\n2.File Type Count?"
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
            echo this is feat 1
	    erin=0
        else
	    echo Error, incorrect input. Please choose a number feature you would like to use.
	    erin=1
	fi
done

echo Thank you!



