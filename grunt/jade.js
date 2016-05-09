module.exports = {
    components: {
        files : [
            {src: "jade/index.jade",dest: "<%= package.directory %>"},
            {src: "jade/news.jade",dest: "<%= package.directory %>"}
    ]},
    options: {
        client: false,
        pretty: false
    }
}