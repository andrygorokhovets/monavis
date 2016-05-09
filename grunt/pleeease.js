module.exports = {
    custom: {
        options: {
            "minifier": {preserveHacks: true, removeAllComments: true},
            "mqpacker": true,
            "less": false
        },
        files: {
            '<%= package.directory %>css/compiled.min.css' : '<%= package.directory %>css/compiled.min.css'
        }
    }
}