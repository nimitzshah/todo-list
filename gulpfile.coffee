gulp  = require 'gulp'
watch = require 'gulp-watch'
jade  = require 'gulp-jade'
clean = require 'gulp-clean'
open  = require 'gulp-open'

jade_task = () ->
  gulp.src('views/*.jade')
    .pipe(jade())
    .pipe(gulp.dest('public/'))

gulp.task('clean', () ->
  gulp.src('public').pipe(clean())
)

gulp.task('jade', ['clean'], jade_task)

gulp.task('open', ['jade'], () ->
  gulp.src('public/index.html').pipe(open())
)

gulp.task('watch', () ->
  gulp.watch('views/*.jade', jade_task)
)

gulp.task('default', ['clean', 'jade', 'open', 'watch'])
