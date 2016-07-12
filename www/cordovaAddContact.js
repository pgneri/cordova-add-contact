var exec = require('cordova/exec');

const emptyCallback = function() {}

exports.addContact = function() {
    exec(emptyCallback, emptyCallback, "CordovaAddContact", "addContact", []);
};
