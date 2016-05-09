module.exports = {
    build: {
        auth: {
            host: '',
            authKey: ''
        },
        src: '<%= package.templates %>',
        dest: '/var/www/vhosts/monavis.iskra.ua/public/wp-content/themes/monavis',
        exclusions: ['<%= package.templates %>**/.idea'],
        serverSep: '/',
        progress: true
    }
}