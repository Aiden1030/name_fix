#!/bin/bash 

#Sanghyeop Hyun
#shyun@mimi.cs.mcgill.ca
#department:Computer Science

#(if1)error:incorrect number of input




directory=$(dirname "$1")
cd $directory

if [[ ! -w $directory ]]
then 
	echo directory permission denied 
	exit 3
fi
if [[ $# -ne 2 ]]||[[ $1 == "" ]]||[[ $2 == "" ]]
then 
echo 'Usage: namefix.bash <inputfile> <outputfile>'
exit 1
fi

#(if2)error:input file and output file are same
if [[ $1 -ef $2 ]]
then 
echo 'input and output are identical'
exit 2
fi




#(if3)error:file doesn't exist
if [ ! -e "$1" ]
then 
	echo file does not exist
	exit 3
fi



#(if4)error: no file read permission 
if [[ ! -r $1 ]]
then 
echo 'Input file is not readable.'
exit 3
fi
#error: writing permission checked later after creating the file
#firstly, check if the second input is whether directory or file,
#if it is a directory "cd" to the directory


current=$PWD

fileName=$(basename $1)


#(if5)when the second input is a directory


base2=$(basename $2)
if [[ -d "$2" ]]||[[ -d ""/"$2" ]]||[[ -d $base2 ]] 
then

if [[ ! -w "$2" ]]&&[[ ! -w ""/"$2" ]]&&[[ ! -w $base2 ]]
then echo not writable output 
	exit 3
fi

cd $base2
if [[ -e $fileName ]]&&[[ -d $fileName ]]
then echo output file name cannnot be an existing directory
	exit 3
fi
/home/2013/jdsilv2/206/mini2/namefix $current/$fileName $fileName 

echo The names are fixed.
cat $fileName
exit 0

#(else5)
else

file=$(basename $2)
#(else5.1)
dir=$(dirname $2)
dir2=$(basename $dir)

if [[ ! -w ""/"$dir" ]]&&[[ ! -w ""/"$dir2" ]]&&[[ ! -w $dir ]]&&[[ ! -w $dir2 ]]
	then 
		if [[ -e $file ]]
                           then
				   if [[ -w $file ]]
				   then	   x=1
				   else
                                     
				   echo not writable output
				   exit 3
				   fi
				   fi
fi
if [[ ! -w "$file" ]]&&[[ -e $file ]]
then
echo 'No permission to write' 
exit 3
fi

/home/2013/jdsilv2/206/mini2/namefix $1 $file


echo The names are fixed.
cat $file
exit 0


fi

