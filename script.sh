#!/bin/sh
cat << EOF >/tmp/test.js
var page = require('webpage').create();
page.viewportSize = { width: 1024, height: 768 };
page.open('http://localhost/index.php', function () {
	page.render('/tmp/screenshot01.png');
	phantom.exit();
});
EOF
phantomjs /tmp/test.js

curl --form userfile=@/tmp/screenshot01.png http://cosm.tiefpunkt.com/filereceiver.php
ls -la
exit 0
