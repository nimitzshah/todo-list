gulp   = require 'gulp'
watch  = require 'gulp-watch'
jade   = require 'gulp-jade'
clean  = require 'gulp-clean'
open   = require 'gulp-open'
coffee = require 'gulp-coffee'

jade_task = () ->
  gulp.src(['!views/_*.jade', '!views/layout.jade', 'views/*.jade'])
    .pipe(jade({
      pretty: true
    }))
    .pipe(gulp.dest('public/'))
    
scripts = () ->
  gulp.src('assets/js/*.coffee')
    .pipe(coffee(bare: true))
    .pipe(gulp.dest('public/js'))
  
  gulp.src('assets/js/*.js')
    .pipe(gulp.dest('public/js'))

gulp.task('clean', () ->
  gulp.src('public').pipe(clean())
)

gulp.task('scripts', ['clean'], scripts)

gulp.task('jade', ['clean'], jade_task)


gulp.task('open', ['jade', 'scripts'], () ->
  gulp.src('public/index.html').pipe(open())
)

gulp.task('watch', () ->
  gulp.watch('views/*.jade', jade_task)
)

gulp.task('default', ['clean', 'jade', 'scripts', 'open', 'watch'])
