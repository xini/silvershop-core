let mix = require("laravel-mix").mix;
let path = require('path');

mix.webpackConfig({
    externals: {
        '$': 'jQuery',
        'jquery': 'jQuery'
    }
});

mix.setPublicPath(
    path.resolve(__dirname, 'dist')
);
/*
mix.combine([
  'src/js/lib/jquery.min.js',
  'src/js/lib/jquery-ui.min.js',
  'src/js/functions.js',
], "dist/js/shop.js");
*/

mix.sass("src/scss/silvershop.scss", "dist/css/style.css")
  .options({
    processCssUrls: false
  });
