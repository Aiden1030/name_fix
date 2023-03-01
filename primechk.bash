#!/bin/bash 
#Aiden Sanghyeop Hyun
#shyun1@mimi.cs.mcgill.ca
#department:cs

#variables
first=$1
second=$2
third=$3
fourth=$4
if [[ ! -z $fourth ]]
then echo command not found $4
	exit 1 
fi

l=0
f=0
num=0

#collects info
for input in $first $second $third $fourth
do 
case $input in

'[-l]'|'-l')
l=1;;
'[-f]'|'-f')
f=1;;


#catches file name
*)if [[ $f == 1 ]]
then folder=$input
f=0 
fi
;;
esac
done

#filter out a file that does not exist	
if [[ ! -f $folder ]]
	then echo folder does not exist
exit 2
	fi
#filter out incorrect use 
if [[ -z $folder ]]
then echo "Incorrect Usage"
exit 1
fi

#catch numbers in folder
for i in `grep -E '[0-9]' $folder` 
	do a=`/home/2013/jdsilv2/206/mini2/primechk $i` 
		x=$?
# exclude numbers with non-numerica character
		if [[ ! $i =~ ^[[:digit:]]+$ ]]
		then continue 
		fi
#print prime numbers or compare prime numbers 
case $x in 
	0) 
		#when you only need the biggest num
if [[ $l == 1 ]]&&[[ $num < $i ]]
then num=$i 

#printing prime numbers	
elif [[ $l == 0 ]]
then
echo $i
fi 
;;
*)
continue
;;
	esac
	done
#prints the biggest number if -l
if [[ $l == 1 ]]&&[[ ! $num == 0 ]]
then	
echo $num
fi

