#!/bin/bash

which clarity
ls -alh ${LOG_ROOT:-/data/logs}

exec /usr/local/bin/clarity --port=8989 ${LOG_ROOT:-/data/logs}