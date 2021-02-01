#!/bin/bash

figlet Suck Less ...
echo "Enter the track:"
read track
echo "Enter the name of the problem:"
#read name
name=$(cat "./Problemset/c_problemset" | fzf --reverse)
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

