# Select the GUI mode.
sleep 1 #Change to the configured seconds.
# CHANGE THE USE OF CHSH !!! It's wrong.

while true;do
   echo Select a Mode:
    echo +--------------------+
    echo | LOAD               |
    echo +--------------------+
    echo | 1. GUI             |
    echo | 2. GUI Minimized   |
    echo | 3. SHELL           |
    echo | 4. BASH            |
    echo | 5. Shutdown        |
    echo | 6. Configuration   |
    echo +--------------------+
    read -r mode
    if [[ $mode == "1" ]]; then 
        # Load GUI with args
    elif [[ $mode == "2" ]]; then 
        # Load GUI
    elif [[ $mode == "3" ]]; then
        while true;do
            chsh -s /opt/moss/SHELL.sh mat
            login
        done
    elif [[ $mode == "4" ]]; then
        while true;do
            chsh -s /opt/moss/BASH.sh mat
            login
        done
    elif [[ $mode == "5" ]]; then
        shutdown 0
    elif [[ $mode == "6" ]]; then
        # Configuration.
    else
        echo "Unvalid option: $mode"
    fi
    sleep 1
done