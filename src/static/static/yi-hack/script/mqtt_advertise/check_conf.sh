#!/bin/sh

YI_HACK_PREFIX="/home/yi-hack"
CONF_MQTT_ADVERTISE_FILE="$YI_HACK_PREFIX/etc/mqtt_advertise.conf"

PARMS1="
MQTT_ADV_LINK_ENABLE=no
MQTT_ADV_LINK_BOOT=no
MQTT_ADV_LINK_CRON=no
MQTT_ADV_LINK_CRONTAB=
MQTT_ADV_LINK_TOPIC=links
MQTT_ADV_LINK_RETAIN=1
MQTT_ADV_LINK_QOS=0
MQTT_ADV_INFO_GLOBAL_ENABLE=no
MQTT_ADV_INFO_GLOBAL_BOOT=no
MQTT_ADV_INFO_GLOBAL_CRON=no
MQTT_ADV_INFO_GLOBAL_CRONTAB=
MQTT_ADV_INFO_GLOBAL_TOPIC=info_global
MQTT_ADV_INFO_GLOBAL_RETAIN=1
MQTT_ADV_INFO_GLOBAL_QOS=0
MQTT_ADV_CAMERA_SETTING_ENABLE=no
MQTT_ADV_CAMERA_SETTING_BOOT=no
MQTT_ADV_CAMERA_SETTING_CRON=no
MQTT_ADV_CAMERA_SETTING_CRONTAB=
MQTT_ADV_CAMERA_SETTING_TOPIC=camera_setting
MQTT_ADV_CAMERA_SETTING_RETAIN=1
MQTT_ADV_CAMERA_SETTING_QOS=0
MQTT_ADV_TELEMETRY_ENABLE=no
MQTT_ADV_TELEMETRY_BOOT=no
MQTT_ADV_TELEMETRY_CRON=no
MQTT_ADV_TELEMETRY_CRONTAB=
MQTT_ADV_TELEMETRY_TOPIC=telemetry
MQTT_ADV_TELEMETRY_RETAIN=1
MQTT_ADV_TELEMETRY_QOS=0
HOMEASSISTANT_ENABLE=no
HOMEASSISTANT_BOOT=no
HOMEASSISTANT_CRON=no
HOMEASSISTANT_CRONTAB=
HOMEASSISTANT_MQTT_PREFIX=homeassistant
HOMEASSISTANT_NAME=
HOMEASSISTANT_IDENTIFIERS=yi-cam
HOMEASSISTANT_MANUFACTURER=YI
HOMEASSISTANT_MODEL=
HOMEASSISTANT_RETAIN=1
HOMEASSISTANT_QOS=0
"

for i in $PARMS1; do
    if [ ! -z "$i" ]; then
        PAR=$(echo "$i" | cut -d= -f1)
        MATCH=$(cat $CONF_MQTT_ADVERTISE_FILE | grep $PAR)
        if [ -z "$MATCH" ]; then
            echo "$i" >>$CONF_MQTT_ADVERTISE_FILE
        fi
    fi
done