#!/bin/bash

echo "Enter the track:"
read track
track=${track,,}
echo "Enter the name of the problem:"
cd Problemset
name=$(cat $(echo $track"_problemset") | fzf --reverse)
name=${name,,}
name=${name// /-}
echo "opening in firefox..."
echo "------------------------"
echo
firefox "https://exercism.io/tracks/$track/exercises/$name/solutions"
