#!/bin/bash

parse_port(){
    # Input port
    inPort=""

    # Output port 
    outPort=""

    # Input file
    env=".env"

    # If file exists 
    if [[ -f "$env" ]]
    then
        # read it
        while IFS='|' read -r line  
        do
            # remove whitespace 
            line=$(echo $line | tr -d " ")

            # get param name 
            param=$(echo "$line" | cut -d "=" -f1)

            # parse .env to extract port 
            if [ $param == "PORT" ]
            then 
                inPort=$(echo $line|cut -d "=" -f2)
            fi 
        done <"$env"
        if [ $inPort == "" ]
        then 
            echo "PORT variable missing"
            exit 2
        else
            return $inPort
        fi
        # get private adress 
        #ipAddress=$(hostname -i |cut -d " " -f1)
        #commandline=$(upnpc -a $ipAddress $inPort $inPort TCP) 

        #if [ $commandline -gt 0 ]; then
        #	echo "Mounted !"
        #else
        #	echo "Not mounted"i
        #fi
    else
        echo ".env file not found in directory"
        exit 1
    fi
}

inPort= parse_port
echo $inPort
exit 0