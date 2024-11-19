#!/usr/bin/env bash
#shellcheck disable=SC2086

source /app/mylar3/venv/bin/activate

exec \
    python3 /app/mylar3/Mylar.py \
        --nolaunch \
        --quiet \
        --datadir=/config/mylar \
        "$@"