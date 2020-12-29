'use strict';

/* Const for environment */
const environment = process.env.NODE_ENV || 'development';

/* Activate or desactivate Stylint on CSS task. true: activate | false: desactivate */
const lintcss = true;

/* Paths */
const theme = './src/assets/';
const paths = {
  sassAssets: {
    src: [
      './assets/scss/**/*.scss'
    ],
    srcMain: [
      './assets/scss/theme.scss'
    ],
    vendor: [
      './node_modules/normalize.css/normalize.css'
    ],
    dest: theme + 'css/',
  },
  fontAssets: {
    src: [
      './assets/fonts/*'
    ],
    dest: theme + 'css/fonts/'
  },
  imgAssets: {
    src: [
      './assets/img/**/*.svg',
      './assets/img/**/*.png',
      './assets/img/**/*.jpeg',
      './assets/img/**/*.jpg',
      './assets/img/**/*.gif',
      './assets/img/**/*.ico'
    ],
    dest: theme + 'img/',
  },
};

/* Options */
const options = {
  stylelint: {
    reporters: [
      {
        formatter: 'string',
        console: true
      }
    ]
  },
  sass: {
    outputStyle: 'compressed', // output_style = expanded or nested or compact or compressed
    precision: 10
  },
  uglifyCss: {
    "maxLineLen": 80,
    "uglyComments": false
  }
};

/* Exports */
exports.environment = environment;
exports.lintcss = lintcss;
exports.paths = paths;
exports.options = options;
