var exec = require('cordova/exec');

const emptyCallback = function() {}

exports.addContact = function(params) {
    if(typeof params == 'undefined') {
        params = {}
    }

    if(typeof params.name == 'undefined' || params.name == null) {
        params.name = ''
    }

    if(typeof params.email == 'undefined' || params.email == null) {
        params.email = ''
    }

    if(typeof params.phone == 'undefined' || params.phone == null) {
        params.phone = ''
    }
    exec(emptyCallback, emptyCallback, "CordovaAddContact", "addContact", [params]);
};
