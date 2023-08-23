#!/bin/bash 


if [ $# -eq 0 ] || [ -z "$1" ] || [ -z "$2" ]
then
    echo " need more arguments"
    exit 1

fi 

filesdir=$1
searchstr=$2

if [ -d "$filesdir" ]
then 
    echo "${filesdir} is present " 

else 
    echo "failed: ${filesdir} is not a directory"
    exit 1 

fi 

num_files=$(find "${filesdir}" -type f | wc -l) 

num_occurence=$(grep -r "${searchstr}" "${filesdir}" | wc -l) 

echo "the number of files are ${num_files} and the number of matching lines are ${num_occurence}"

exit 0












# if [ $# -lt 2 ]

# then 
#     echo " Please enter 2 arguments" 
#         exit 1

# fi 


# if [ ! -d $1 ]

# then 
#     echo "The first argument is not a directory"
#         exit 1 

# fi 

# TOTAL_FILES=$(find -L ${1} -type f -printf "%f\n" 2> /dev/null | wc -l )
# TOTAL_MATCHED=$(grep -Rn "${2}" "${1}" 2> /dev/null | uniq | wc -l) 

# echo "total files are : ${TOTAL_FILES}"
# echo "total matched: ${TOTAL_MATCHED}"


# echo " The number of files are ${TOTAL_FILES} and the number of line is ${TOTAL_MATCHED}" 


# echo "total files are : ${TOTAL_FILES}"
# echo "total matched: ${TOTAL_MATCHED}"








# inDir=$1 
# inStr=$2 


# fileCount=10
# lineCount=1

# echo "current file name is" $0 '\n' 
# echo 
# echo "$inDir is 1. parameter" 
# echo

# if [ $# -lt 1 ]
# then 
#     echo " urFile, Could not find any of parameters provided"
#     exit 1

# fi 

# if [[ -d $inDir ]]

# then 

#     fileCount=$(find "$inDir" -type f | wc -l)
#     lineCount=$( grep -rc "$inDir" -e "$inStr" | wc -l)

# echo "The number of files are "$fileCount" with the matching line of" $lineCount

# else 

#     echo " urFile is not a directory "
#     exit 1 


# fi 