#!/bin/bash

# progress bar function
progress_bar() {
    local w=80 p=$1;  shift
    # create a string of spaces, then change them to dots
    printf -v dots "%*s" "$(( $p*$w/100 ))" ""; dots=${dots// /.};
    # print those dots on a fixed-width space plus the percentage etc. 
    printf "\r\e[K|%-*s| %3d %% %s" "$w" "$dots" "$p" "$*"; 
}


# COLOR constants
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# helper to write a message in yellow text
function WriteYellow {
    echo -e "${YELLOW}${1}${NC}"
}

# helper to write a message in green text
function WriteGreen {
    echo -e "${GREEN}${1}${NC}"
}

# helper to write a message in red text
function WriteRed {
    echo -e "${RED}${1}${NC}"
}                                                                  