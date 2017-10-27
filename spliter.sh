
#!/bin/bash

LETTER=""

for i in "$@"
	do
		case $i in
    			*)
            		LETTER="${i}"	
    			;;
		esac
done

for ((i = 0; i < ${#LETTER}; i++)); do 
	char=("${LETTER:i:1}")
	char=$(echo $char | awk '{print tolower($0)}') 
	arrayOfFiles+=${char}.c" "
done 

string=$( printf "%s" "${arrayOfFiles[@]}" )
cd chars
paste $string > newFile
cat newFile
rm newFile
