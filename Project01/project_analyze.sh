#!/bin/bash
erin=0
while [ erin=1 ]
do
read -r -p "What number Feature would you like to use?\n1.Delete Temp File?\n2.File Type count?" featName

        if [ $featName == 2 ]; then
	    erin=0
            htmlFind=$(find ~/CS1XA3/ -name "*.html" | wc -l)
	    javaFind=$(find ~/CS1XA3/ -name "*.js" | wc -l)
	    cssFind=$(find ~/CS1XA3/ -name "*.css" | wc -l)
	    pyFind=$(find ~/CS1XA3/ -name "*.py" | wc -l)
	    haskellFind=$(find ~/CS1XA3/ -name "*.hs" | wc -l)
	    bashFind=$(find ~/CS1XA3/ -name "*.sh" | wc -l)

	    echo $htmlFile
	    echo $javaFile
	    echo $cssFile
	    echo $pyFile
	    echo $haskellFile
	    echo $bashFile

        elif [ $featName == 1 ]; then
            echo this is feat 1
	    erin=0
        else
	    echo Error, incorrect input. Please choose a number feature you would like to use.
	    erin=1
	fi
done

echo Thank you!



