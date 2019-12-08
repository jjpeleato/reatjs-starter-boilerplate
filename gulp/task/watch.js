'use strict';

/*
 * Import require functions
 */
import gulp from 'gulp';
import config from '../config';
import { cssWithConcat } from './styles';
import { validateScss } from './styles';

/* Tasks */
function watch()
{
    gulp.watch(config.paths.sassAssets.src, { ignoreInitial: false }, gulp.series(validateScss, cssWithConcat));
}

exports.watch = watch;
