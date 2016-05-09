module.exports = {
    components: {
        src:[
            '<%= package.directory %>js/compiled.js'
        ],
        dest:'<%= package.directory %>js/compiled.min.js'
    }
}