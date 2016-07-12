#!/bin/bash
cordova plugins remove cordova-add-contact
cordova platform remove ios
cordova platform add ios
cordova plugins add ../../
cordova build ios
