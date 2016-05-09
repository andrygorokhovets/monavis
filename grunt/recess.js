module.exports = {
    components: {
        files: {
            '<%= package.directory %>css/compiled.min.css': [
                'bower_components/bootstrap/dist/css/bootstrap.css',
                'bower_components/font-awesome/css/font-awesome.css',
                'license_components/ilightbox/css/skin.css',
                'license_components/ilightbox/css/ilightbox.css',
                'bower_components/jquery-carousel/jquery.carousel.css',
                'bower_components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css',
                'bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css',
                'bower_components/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css',
                'bower_components/bootstrap-select/dist/css/bootstrap-select.css',
                'less/theme.less'
            ]
        }
    },
    options: {
        compile: true,
        compress: true
    }
}