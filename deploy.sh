#!/usr/bin/env bash

source pi/.env

scp pi/* pi/.env pi@pi-srv1.local:/home/pi/services/
