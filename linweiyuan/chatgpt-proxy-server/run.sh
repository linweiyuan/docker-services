set -m

if [ -z "$LOG_LEVEL" ]; then
    export LOG_LEVEL=OFF
fi

./undetected_chromedriver --allowed-ips= --allowed-origins=* --log-level="$LOG_LEVEL"
