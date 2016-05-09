module.exports = {
    components: ['bower_components/*'],
    js: ["<%= package.templates %>assets/js/*.js", "!<%= package.templates %>assets/js/*.min.js"],
    coffee: ['compiled-js'],
    options: { force: true }
};