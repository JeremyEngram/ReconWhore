#!/bin/bash

# Define the list of names
name_list=("xnxx" "redtube" "pornhub" "youporn" "myfreecams" "onlyfans" "fansly")

# Function to echo the code for each name
echo_code_for_names() {
    local username="$1"

    for i in "${name_list[@]}"; do
        echo "#FIND THEM ON $i"
        echo 'printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] $i: \e[0m"'
        echo "check_$i=\$(curl -s \"https://www.$i.com/$username\" -L -H \"Accept-Language: en\" | grep -o 'page doesn’t exist'; echo \$?)"
        echo ""
        echo 'if [[ $check_'"$i"' == *'"'1'"'* ]]; then'
        echo '    printf "\e[1;92m Found!\e[0m https://www.'"$i"'.com/%s\n" $username'
        echo '    printf "https://www.'"$i"'.com/%s\n" $username >> /var/log/omnisint/forensics/reconwhore/$username.log'
        echo 'elif [[ $check_'"$i"' == *'"'0'"'* ]]; then'
        echo '    printf "\e[1;93mNot Found!\e[0m\n"'
        echo 'fi'
        echo ""
    done
}

# Specify the username for which you want to check the websites
username="your_username_here"

# Call the function to echo the code for each name into a log file
echo_code_for_names "$username" > /var/log/omnisint/forensics/reconwhore/code_log.txt