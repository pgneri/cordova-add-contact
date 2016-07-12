var app = {
    initialize: function() {
        this.bindEvents();
    },
    bindEvents: function() {
        document.getElementById('button').addEventListener('click', this.buttonClicked, false);
    },
    buttonClicked: function() {
        window.cordova.plugins.cordovaAddContact.addContact('123', function(msg) {
            alert(msg)
        }, function(msg) {
            alert(msg)
        })
    },
};

app.initialize();
