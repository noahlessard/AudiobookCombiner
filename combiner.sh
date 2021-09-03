#! /bin/bash
echo 'getting files...'
#ffmpeg -i "concat:$FILE1|$FILE2" -acodec copy $OUTPUT.mp3 
search_dir=$PWD
array=()
cmdarray=()
switch1=0
outputnum = 0
for entry in "$search_dir"/*.mp3
do
	echo "found $entry"
	array+=("$entry")
done
for value in "${array[@]}"
do
	switch1+=1
	cmdarray+=("$value")
	if [ $switch1 -gt 2 ]
	then
		((outputnum=outputnum+1))
		ffmpeg -i "concat:${cmdarray[0]}|${cmdarray[1]}" -acodec copy $1$outputnum.mp3
		switch1=0
		cmdarray=()
		echo "break"
	fi 
done
echo 'done'
