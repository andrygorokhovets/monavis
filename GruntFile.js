module.exports = function(grunt) {
    var gtx = require('gruntfile-gtx').wrap(grunt);

    gtx.loadAuto();

    var gruntConfig = require('./grunt');
    gruntConfig.package = require('./package.json');

    gtx.config(gruntConfig);

    // We need our bower components in order to develop
    gtx.alias('build:app', ['clean:components','bower-install-simple','concat:components','uglify:components','recess:components','pleeease:custom','copy:fonts','jadephp:compile']);
    gtx.alias('build:files', ['jadephp:compile','copy:fonts','recess:components','pleeease:custom','coffee:compile','concat:components','uglify:components','clean:coffee']);
    gtx.alias('deploy:development', ['jadephp:compile','copy:fonts','recess:components','pleeease:custom','coffee:compile','concat:components','uglify:components','clean:coffee','clean:js','sftp-deploy:build']);
    gtx.alias('build:js', ['coffee:compile','concat:components','uglify:components','clean:coffee']);
    gtx.alias('build:css', ['recess:components','pleeease:custom']);
    gtx.alias('build:html', ['jadephp:compile']);
    gtx.finalise();
}