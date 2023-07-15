set -m

if [ -z "$LOG_LEVEL" ]; then
    export LOG_LEVEL=fatal
fi

python -m http.server &

geckodriver --host 0.0.0.0 --allow-hosts chatgpt-proxy-server-arkose --log "$LOG_LEVEL"
