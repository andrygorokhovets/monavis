module.exports = {
    components:{
        src:[
            'bower_components/jquery/dist/jquery.js',
            'bower_components/bootstrap/dist/js/bootstrap.js',
            'license_components/ilightbox/js/ilightbox.js',
            'bower_components/jquery-carousel/jquery.carousel.js',
            'bower_components/jquery-mousewheel/jquery.mousewheel.js',
            'bower_components/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.js',
            'bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.js',
            'bower_components/bootstrap-datepicker/js/locales/bootstrap-datepicker.ru.js',
            'bower_components/bootstrap-select/dist/js/bootstrap-select.js',
            'bower_components/bootstrap-validator/dist/validator.js',
            'bower_components/isotope/dist/isotope.pkgd.js',
            'bower_components/jquery.gmap/jquery.gmap.js',
            'compiled-js/coffee.js'
        ],
        dest:'<%= package.directory %>js/compiled.js'
    }
}