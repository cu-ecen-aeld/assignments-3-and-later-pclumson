#!/bin/bash 

if [ $# -ne 2 ]
then 
        echo "Usage: $0 <writefile> <writestr>"
        exit 1 

fi 

writefile=$1
writestr=$2 

writefilepath=$(dirname $writefile)
mkdir -p $writefilepath 
echo $writestr > $writefile 







# if [ "$#" -ne 2 ]
# then
#     echo " Two parameters are required "
#     echo "1) a path to a directory on the filesystem"
#     echo "2) a text string which will be searched within these files"
#     exit 1

# fi 

# writefile=$1
# writestr=$2


# filedir=$(dirname "$writefile" )

# if [ ! -d "$filedir" ]

# then
    
#     mkdir -p $filedir 
#     if [ $? -ne 0 ]
#         echo " Could not create the file"
#         exit 1 
#     fi

# fi 

# echo "$writestr" > $writefile

# if [ $? -ne 0 ]

# then 
#     echo "Could not create the file."
#     exit 1 
# fi













# if [ $# -eq 0 ] || [ -z "$1" ] || [ -z "$2" ] 
# then
#     echo " need more arguments for writer"
#     exit 1

# fi 

# writefile=$1
# writestr=$2

# if [ -e "$writefile" ]
# then 
#     echo "${writefile} is in the house, ressetting the file."
#     cat /dev/null -> ${writefile}

# else 
#     echo "${writefile} is not in the house"
#     mkdir -p "$(dirname $writefile)" && touch "$writefile"

# fi 


# if [ -d "$(dirname $writefile)" ] 

# then 
#     echo "${writefile} written to file successfully"
#     echo "${writestr}" | tee ${writefile}

# else
#     echo " The file writing failed"
#     exit 1

# fi 

# exit 0

















# if [ $# -ne 2 ]
# then 
#     echo "Give me 2 arguments"
#     exit 1 

# fi 

# # DIR_NAME=$(dirname $1)

# WRITEDIR=/tmp/aeld-data/$3

# (mkdir -p "$WRITEDIR" && touch ${1}) || { echo "This file $1 cant't create."; exit 1;}

# mkdir -p "$WRITEDIR"  || { echo "This file $1 cant't create."; exit 1;}

# echo $2 > $1 || { echo "String write fails."; exit 1;}










# WRITEDIR=/tmp/aeld-data/$3


# varPath=$1
# varStr=$2 

# if [ $# -ne 2 ]

# then 
#     echo " Need more input  in the if block"
#     exit 1 

# elif [ $# -lt 1 ]

# # then
# #     echo " Need more input  in the if block"
# #     exit 1

# then 
#     echo " Need more input in the elif statement" 
#     exit 1 

# else
#     # touch $varPath 
#     # echo "$varStr" >> $varPath 
# 	mkdir -p "$varPath"

# 	#The WRITEDIR is in quotes because if the directory path consists of spaces, then variable substitution will consider it as multiple argument.
# 	#The quotes signify that the entire string in WRITEDIR is a single string.
# 	#This issue can also be resolved by using double square brackets i.e [[ ]] instead of using quotes.
# 	if [ -d "$varPath" ]
# 	then
# 		echo "$varPath created"
#         echo "$varStr" >> $varPath 
# 	else
# 		exit 1
# 	fi

#     #echo "$varStr" >> $varPath 
# fi

# varPath=$1
# varStr=$2 

# if [ $# -ne 2 ]

# then 
#     echo " Need more input  in the if block"
#     exit 1 

# elif [ $# -lt 1 ]

# # then
# #     echo " Need more input  in the if block"
# #     exit 1

# then 
#     echo " Need more input in the elif statement" 
#     exit 1 

# else
#     # touch $varPath 
#     # echo "$varStr" >> $varPath 
# 	mkdir -p "$varPath"

# 	#The WRITEDIR is in quotes because if the directory path consists of spaces, then variable substitution will consider it as multiple argument.
# 	#The quotes signify that the entire string in WRITEDIR is a single string.
# 	#This issue can also be resolved by using double square brackets i.e [[ ]] instead of using quotes.
# 	if [ -d "$varPath" ]
# 	then
# 		echo "$varPath created"
#         echo "$varStr" >> $varPath 
# 	else
# 		exit 1
# 	fi

#     #echo "$varStr" >> $varPath 
# fi
