module.exports = {
    compile: {
        expand: true,
        cwd: 'jadephp/templates/',
        src: ['**/*.jade'],
        dest: '<%= package.templates %>',
        ext: '.php',
        options: {
            client: false,
            basedir: 'jadephp/',
            pretty: false
        }
    }
}