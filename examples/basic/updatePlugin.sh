#!/bin/bash
cordova plugins remove cordova-add-contact
cordova platform remove android
cordova platform add android
cordova plugins add ../../
cordova build android
