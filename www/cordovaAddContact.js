var exec = require('cordova/exec');

exports.addContact = function(arg0, success, error) {
    exec(success, error, "CordovaAddContact", "addContact", [arg0]);
};
