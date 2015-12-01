gulp = require 'gulp'
watch = require 'gulp-watch'
jade = require 'gulp-jade'
clean = require 'gulp-clean'
open = require 'gulp-open'

gulp.task('clean', () ->
  gulp.src('public').pipe(clean())
)

gulp.task('jade', ['clean'], () ->
  gulp.src('views/*.jade')
    .pipe(jade())
    .pipe(gulp.dest('public/'))
)

gulp.task('open', ['jade'], () ->
  gulp.src('public/index.html').pipe(open())
)

gulp.task('default', ['clean', 'jade', 'open'])
