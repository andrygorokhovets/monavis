module.exports = {
    fonts: {
        nonull: true,
        files: [
            {src: "**", dest: "<%= package.directory %>fonts", cwd: 'bower_components/bootstrap/fonts', expand : true},
            {src: "**", dest: "<%= package.directory %>fonts", cwd: 'bower_components/font-awesome/fonts', expand : true},
            {src: "**", dest: "<%= package.directory %>fonts", cwd: 'fonts', expand : true},
            {src: "**", dest: "<%= package.directory %>img/ilightbox", cwd: 'license_components/ilightbox/img', expand : true}
        ]
    }
};