set -m

if [ -z "$LOG_LEVEL" ]; then
    export LOG_LEVEL=OFF
fi

warp-svc | grep "$LOG_LEVEL" &

sleep 1

warp-cli --accept-tos set-mode proxy

if [ -z "$TEAMS_ENROLL_TOKEN" ]; then
    warp-cli --accept-tos register
    warp-cli --accept-tos connect
else
    warp-cli --accept-tos teams-enroll-token $TEAMS_ENROLL_TOKEN
fi

warp-cli --accept-tos enable-always-on

socat TCP-LISTEN:65535,fork TCP:127.0.0.1:40000 &

if [ -z "$TEAMS_ENROLL_TOKEN" ]; then
    while true; do
        if [[ $(warp-cli --accept-tos warp-stats | awk 'NR==3') == *GB ]]; then
            warp-cli --accept-tos delete
            warp-cli --accept-tos register
            warp-cli --accept-tos set-mode proxy
            warp-cli --accept-tos connect
            warp-cli --accept-tos enable-always-on
        fi

        sleep 300
    done
fi

fg %1
