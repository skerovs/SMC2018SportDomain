solution_to_sort=$1

if [ ! -f $solution_to_sort ]
  then
      echo "File not found!"
    exit 0
fi

if [[ -n "$solution_to_sort" ]]
    then
        echo "solution to sort: $solution_to_sort"
        echo "output file can be find in the script location under name SortedSolution.txt"
else
    echo "argument error."
    exit 0
fi

IFS=$'\n'

declare -a solution_lines
declare -a solution_info
line_number=0

for next in `cat $solution_to_sort`
do
    if [[ $line_number -gt 1 ]]
        then
            var="${next:6:-5}"
            solution_lines=(${solution_lines[@]} "$var")
    else 
        solution_info=(${solution_info[@]} "$next")
    fi

    ((line_number++))
done

#Action sorting 

declare -a array_of_action_numbers
declare -a sorted_array

j=0
for action in "${solution_lines[@]}"
    do
        IFS=' '
        words=( $action )


        regex="SLOT[0-9]"
        
        if [[ ${words[1]} =~ $regex ]] 
          then
             number=${words[1]//[!0-9]/}
             array_of_action_numbers[$j]=$number
             if [[ ${words[0]} == "AGILITYTU" ]] || [[ ${words[0]} == "FARTLEKTU" ]] || [[ ${words[0]} == "AEROBIC" ]]
                then
                    sorted_array[$number]=" T_Day:$number ${words[0]} ${words[4]}"
             else
                 sorted_array[$number]=" T_Day:$number ${words[0]} ${words[2]} ${words[5]}"
             fi

             ((j++))
        else
          echo " "
        fi
done

#Joining the info array and actions array

sorted_solution_and_info=("${solution_info[@]}" "${sorted_array[@]}")

#Printing the sorted soultion to the desired file

( IFS=$'\n'; echo "${sorted_solution_and_info[*]}" > SortedSolution.txt )

exit 0