'use strict';

/*
 * Import require functions
 */
import gulp from 'gulp';
import { clean } from './clean';
import { css } from './styles';
import { cssWithConcat } from './styles';
import { fontAssets } from './styles';
import { images } from './images';
import { validateScss } from './styles';
import { watch } from './watch';

/* Tasks */
gulp.task(
	'default',
	gulp.series(
		clean,
		validateScss,
		cssWithConcat,
		fontAssets,
		images,
	)
);
gulp.task('clean', clean);
gulp.task('css', css);
gulp.task('cssWithConcat', cssWithConcat);
gulp.task('fontAssets', fontAssets);
gulp.task('images', images);
gulp.task('validate', gulp.series(validateScss));
gulp.task('validateScss', validateScss);
gulp.task('watch', watch);
