# React JS: Starter boilerplate

React JS base repository for any project.

## Project

Built with React JS platform using the following technologies: HTML 5, JavaScript, Redux, Router, CSS3, SASS & Compass, NPM or Yarn, Gulp v.4 and more.

### Installing dependencies

You must install the environment manually: Node.JS, NPM or Yarn and Gulp CLI.

For more information visit:

- Node and NPM: https://nodejs.org/es/
- Yarn: https://yarnpkg.com/es-ES/
- Gulp: https://gulpjs.com/

**Note:** If you work with Windows. To execute the commands, we recommend installing **Cygwin** http://www.cygwin.com/

**Note:** I recommend installing the following IDE for PHP Programming: Visual Studio Code (https://code.visualstudio.com/) or PHPStorm (recommended) (https://www.jetbrains.com/phpstorm/).

### Project skeleton

```
├─ assets/ # Front-end directory
│  ├─ img/
│  ├─ scss/
│  ├─ .htaccess.dist
│  └─ .htpasswd.dist
├─ gulp/
│  ├─ task/
│  └─ config.js # Paths and configuration Gulp system.
├─ public/ # Public directory
├─ src/ # Source directory
├─ .babelrc
├─ .editorconfig
├─ .env.alpha.local.dist
├─ .env.beta.local.dist
├─ .env.development.local.dist
├─ .env.production.local.dist
├─ .gitignore
├─ .htaccess
├─ .stylelintignore
├─ .stylelintrc
├─ deploy.sh
├─ gulpfile.babel.js
├─ LICENSE
├─ package.json
└─ README.md
```

### Installing

2. Open your terminal and browse to the root location of your project.
3. Run `$yarn install --dev`.
3. Run `$yarn start`.
4. End. Happy developing.

### Developing with NPM or Yarn and Gulp.

- Open your terminal and browse to the root location of your project.
- If required. Run: `$yarn install --dev` or `$npm install --save-dev` then: `$gulp [action]`
- To work with and compile your Sass files on the fly start: `$gulp`
- Gulp actions commands list:
    - `$gulp clean` Delete all files.
    - `$gulp css` Compile SASS to CSS and validate SASS according Stylelint (https://stylelint.io/). Not concat.
    - `$gulp cssWithConcat` Concat and compile SASS to CSS and validate SASS according Stylelint (https://stylelint.io/).
    - `$gulp fontAssets` Copy fonts assets to public directory.
    - `$gulp images` Copy and minify PNG, JPEG, GIF and SVG images with imagemin.
    - `$gulp validateScss` Validate SCSS according Stylint (https://stylelint.io/).
    - `$gulp watch` Compile SASS to CSS and concat and minify JS files in real-time.
- NPM actions commands list:
    - `$npm run gulp:dev` Compile for development environment.
    - `$npm run gulp:prod` Compile for production environment.
- Yarn actions commands list:
    - `$yarn start` Runs the app in the development mode according .env.development.local file. Open http://localhost:3000 to view it in the browser. The page will reload if you make edits.
    - `$yarn test` Launches the test runner in the interactive watch mode.
    - `$yarn build` Builds the app according .env.production.local file to the build folder.
    - `$yarn build:alpha` Builds the app according .env.alpha.local file to the build folder.
    - `$yarn build:beta` Builds the app according .env.beta.local file to the build folder.
    - `$yarn eject` Compile for development environment.

### Technologies and tools

The present project uses several technologies and tools for the automation and development process. For more information and learning visit the following links.

1. React: https://reactjs.org/
2. Prop-types: https://github.com/facebook/prop-types
3. Redux: https://redux.js.org/
4. React-Router: https://github.com/ReactTraining/react-router
5. React-Snap: https://github.com/stereobooster/react-snap
6. Material-UI: https://material-ui.com/
7. Normalize: https://github.com/necolas/normalize.css
8. Git: https://git-scm.com/
9. NPM: https://www.npmjs.com/
10. Yarn: https://yarnpkg.com/
11. Sass: https://sass-lang.com/
12. Gulp: https://gulpjs.com/
13. Babel: https://babeljs.io/
14. EditorConfig: https://editorconfig.org/
15. Stylelint: https://stylelint.io/
16. Human.txt: http://humanstxt.org/

**Note:** Thanks a lot of developers that to work on this projects.

### Others clarifications

1. If required. It is possible that on Mac OS the Gulp tasks do not run the correct form. In this case install NodeJS, NPM and Gulp-cli in your OS and execute the tasks outside the Docker containers.

## Finally

More information on the following commits. If required.

Grettings **@jjpeleato**.
