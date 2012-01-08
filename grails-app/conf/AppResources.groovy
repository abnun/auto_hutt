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
}