#!/bin/bash
# include helper functions
source ./utils.sh

# include client variables/settings
source ./client_vars.sh


SAMPLE_NAME=$1  # first command line argument

STARS="************************************************"
BANNER="\n${STARS}\nLocal Network Test Client\n\nNOTE: this script will connect to ${SERVER}\n \
  and run ${NUM_LOOPS} test(s). If this is not what you want, exit\n \
  the script now (ctrl-c) and edit this script before\n \
  continuing\n"

# verify the number of input values
USAGE_TEXT="\n Usage: $0 sample_name \n \n Where sample_name uniquely represents this data collection sample \n"
[ $# -eq 0 ] && { echo -e ${USAGE_TEXT}; exit 1; }

# display banner and let the user indicate they are ready
echo -e ${BANNER}
read -p "Press enter to continue"

# if we are proceeding, let's create an ouput directory for the results
DATA_DIR="./data/$(date +"%Y%m%d")"
mkdir -p ${DATA_DIR}

# loop and run test
for idx in $(eval echo "{1..$NUM_LOOPS}")
do
    lbl=`printf %02d $idx`
    fname="${DATA_DIR}/${SAMPLE_NAME}.${lbl}.f.json"
    rname="${DATA_DIR}/${SAMPLE_NAME}.${lbl}.r.json"
    echo -e "\nCollecting Sample #${lbl}"
    
    # forward (C --> S)...
    iperf3 -c ${SERVER} -J --logfile ${fname} &
    p=$!;
    x=0
    while sleep 1; do progress_bar "$x" client to server...; ((x=x+10)); done& wait $p; kill $!;
    echo -ne "\r\033[0K\r"
    WriteGreen "\t completed client --> server"

    # reverse (S --> C)...
    iperf3 -c ${SERVER} -R -J --logfile ${rname} &
    p=$!;
    x=0
    while sleep 1; do progress_bar "$x" server to client...; ((x=x+10)); done& wait $p; kill $!;
    echo -ne "\r\033[0K\r"
    WriteGreen "\t completed server --> client"

done

echo -e "\nData Collection Complete\n${STARS}\n"