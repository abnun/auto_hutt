// Define the resources for exposure via Resources plugin
modules = {
    'auto-hutt' {

        dependsOn 'jquery, nine-sixty-grid-system-custom'

        resource id: 'main', url: [dir: 'css', file: 'main.css'],
                attrs: [media: 'all']

        resource id: 'special', url: [dir: 'css', file: 'special.css'],
                attrs: [media: 'all']
    }

    'nine-sixty-grid-system-custom' {

        /**
         * According to HTML 5 Boilerplate Docs, don't use 960 reset.css and text.css
         * http://html5boilerplate.com/docs/#960.gs
         */
        /*resource id: 'reset', url: [plugin: 'nine-sixty-grid-system', dir: 'css/nine-sixty-grid-system', file: 'reset.css'],
                  attrs: [media: 'all']
          resource id: 'text', url: [plugin: 'nine-sixty-grid-system', dir: 'css/nine-sixty-grid-system', file: 'text.css'],
                  attrs: [media: 'all']*/
        dependsOn 'html-five-boilerplate'

        resource id: '960', url: [plugin: 'nineSixtyGridSystem', dir: 'css/nine-sixty-grid-system', file: '960.css'],
                attrs: [media: 'all']
    }

    'html-five-boilerplate' {

        dependsOn 'modernizr'

        resource id: 'style', url: [plugin: 'htmlFiveBoilerplate', dir: 'css/html-five-boilerplate',
                file: 'style.css']

        // Uncomment if you are specifically targeting less enabled mobile browsers
        // resource id: 'style', url: [plugin: 'html-five-boilerplate', dir: 'css/html5boilerplate',
        //		file: 'handheld.css']

        // IE fix for transparent pngs
        resource id: 'dd_belatedpng', url: [plugin: 'htmlFiveBoilerplate', dir: 'js/html-five-boilerplate',
                file: 'dd_belatedpng.js'], exclude:'minify', wrapper: { s -> "<!--[if lt IE 7]>$s<![endif]-->" }
    }

    'photo-album-gallery' {
        dependsOn 'auto-hutt'

        resource id: 'highslide', url: [dir: 'highslide', file: 'highslide.css', plugin: 'photo-album']
        resource id: 'highslide', url: [dir: 'highslide', file: 'highslide-ie6.css', plugin: 'photo-album'],
                wrapper: { s -> "<!--[if lt IE 7]>$s<![endif]-->" }

        resource id: 'highslide', url: [dir: 'highslide', file: 'highslide-with-html.packed.js', plugin: 'photo-album']

        resource id: 'highslide', url: [dir: 'highslide', file: 'highslide_de.js', plugin: 'photo-album']
//        resource id: 'highslide', url: [dir: 'highslide', file: 'highslide_en.js\'', plugin: 'photo-album']
        resource id: 'highslide', url: [dir: 'js/highslide', file: 'gallery.js', plugin: 'photo-album']
    }
}