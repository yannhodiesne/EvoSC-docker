#!/bin/bash

[ -z "${GAME_SETTINGS}" ] && echo "GAME_SETTINGS cannot be empty" 1>&2 && exit 1
[ -z "${CONFIG}" ] && echo "CONFIG cannot be empty" 1>&2 && exit 1

echo 1 > cache/.setupfinished
./TrackmaniaServer /title=Trackmania /game_Settings=MatchSettings/${GAME_SETTINGS} /dedicated_cfg=${CONFIG} &
sleep 5
php esc run
