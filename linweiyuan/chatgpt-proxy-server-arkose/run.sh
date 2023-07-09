set -m

if [ -z "$LOG_LEVEL" ]; then
    export LOG_LEVEL=OFF
fi

python -m http.server &

socat TCP-LISTEN:60709,fork TCP:127.0.0.1:9222 &

chromedriver --allowed-ips= --allowed-origins=* --log-level="$LOG_LEVEL"
