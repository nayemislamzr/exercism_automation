#!/bin/bash

figlet Suck Less ...
echo "Enter the track:"
read track
track=${track,,}
echo "Enter the name of the problem:"
cd Problemset
name=$(cat $(echo $track"_problemset") | fzf --reverse)
mainpath=$(exercism w)
cd $mainpath
trackpath=$(echo -n $mainpath"/"$track)
if [ ! -d $trackpath ]; then
       	mkdir $track
fi
cd ./$track
filename=${name// /_}
filename=${filename,,}
dirname=${filename//_/-}
if [[ -d $trackpath/$dirname ]]
 then echo "File already existed"
      echo
      echo "-------------------------"
      echo
else
echo -n "Downloading problem ..."
echo
exercism download --exercise=$dirname --track=$track
fi
cd ./$dirname

function _c ()
{
sed -i 's/TEST_IGNORE();//' ./test/test_$filename.$track
echo -n "opening files"
echo
vim -p ./src/$filename.$track  ./src/$filename.h ./test/test_$filename.$track
echo -n "Making files ..."
echo
make | less
function submit ()
{
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
echo -n "Do you want to submit( Y/N/E )?"
read bool
if [[ $bool == "Y" ]] || [[ $bool == "y" ]]
	then	exercism submit ./src/$filename.$track ./src/$filename.h 
	echo -n "${green}Successfully Submitted!!!"
        sleep 3
        clear
elif [[ $bool == "N" ]] || [[ $bool == "n" ]]
	then	clear        
	 vim -p ./src/$filename.$track  ./src/$filename.h ./test/test_$filename.$track
echo -n "Making files ..."
echo
 make | less
 submit
elif [[ $bool == "E" ]] || [[ $bool == "e" ]]
    then echo -n "${green}Ended ..."
    sleep 2
    clear 
else
    echo -n "${red}Unknown key pressed!!!"
    echo
    sleep 2
    clear
fi
}
submit
}
[ $track == "c" ] && _c

function _bash ()
{
echo -n "opening files"
echo
vim -p $filename.sh $(echo $filename"_test.sh")
echo -n "Making files ..."
echo
bats $(echo $filename"_test.sh")
function submit ()
{
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
echo -n "Do you want to submit( Y/N/E )?"
read bool
if [[ $bool == "Y" ]] || [[ $bool == "y" ]]
	then	exercism submit $filename.sh
	echo -n "${green}Successfully Submitted!!!"
        sleep 3
        clear
elif [[ $bool == "N" ]] || [[ $bool == "n" ]]
	then	clear        
        vim -p $filename.sh $(echo $filename"_test.sh")
echo -n "Making files ..."
echo
bats $(echo $filename"_test.sh")
 submit
elif [[ $bool == "E" ]] || [[ $bool == "e" ]]
    then echo -n "${green}Ended ..."
    sleep 2
    clear 
else
    echo -n "${red}Unknown key pressed!!!"
    echo
    sleep 2
    clear
fi
}
submit
}
[ $track == "bash" ] && _bash
