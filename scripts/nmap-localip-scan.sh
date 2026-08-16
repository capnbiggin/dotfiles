#!/usr/bin/env bash

<< 'COMMENT'
How awk works in this script:

NR==1{print; print ""; next} 
— prints the header, then a blank line after it, then skips to the next line.

{print} 
— prints all other lines.

(NR-1)%3==0 
— after the first line, NR-1 counts the data lines printed so far; every 3rd one gets a blank line after it.

COMMENT

main() {
    if ! command nmap; then
        echo "nmap Required"
        exit 1
    fi

    if [[ $# -ne 1 ]]; then
        echo "Usage: ex: ./nmap-localip-scan.sh 192.168.1.0/24"
        exit 1
    else
        sudo nmap -T4 -sn "$1" | awk 'NR==1{print; print ""; next} {print} (NR-1)%3==0{print ""}'
    fi
}

main "$@"
