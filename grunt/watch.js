module.exports = {
    scripts: {
        files: ['jadephp/*.jade'],
        tasks: ['jadephp']
    },
    styles: {
        files: ['css/*.css', 'less/*.less'],
        tasks: ['recess']
    },
    javascripts: {
        files: ['js/*.js'],
        tasks: ['concat', 'uglify']
    }
}