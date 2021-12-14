#!/bin/bash
#	= ^ . ^ =

# https://en.wikipedia.org/wiki/PLS_(file_format)
# http://forums.winamp.com/showthread.php?threadid=65772
# https://schworak.com/blog/e41/extended-pls-plsv2/

# Protocol can be either "http" or "https" (invalid certificate)
PROTOCOL=http
# Used to be "stream.psychedelik.com"
SERVER=62.210.114.63
X=0

PORTS=""
PORTS="${PORTS} 8000"	# psytrance
PORTS="${PORTS} 8002"	# Ambient
PORTS="${PORTS} 8010"	# Progressive
PORTS="${PORTS} 8014"	# Dark
PORTS="${PORTS} 8030"	# Drum N Bass
PORTS="${PORTS} 8032"	# Mixes

cat << EOF
; PSYCHEDELIK.COM | Streaming Psytrance since 2001
; You are listening to psyckedelik.com, that is psychedelic with a k
EOF
echo "[playlist]"

for PORT in ${PORTS}
do
  X=$((${X}+1))
  echo "File${X}=${PROTOCOL}://${SERVER}:${PORT}/"
  echo "Title${X}=PSYCHEDELIK.COM | Stream # ${PORT}"
  echo "Length${X}=-1"
done

echo "Version=2"
echo "NumberOfEntries=${X}"
