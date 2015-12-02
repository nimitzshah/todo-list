gulp       = require 'gulp'
watch      = require 'gulp-watch'
jade       = require 'gulp-jade'
clean      = require 'gulp-clean'
open       = require 'gulp-open'
coffee     = require 'gulp-coffee'
stylus     = require 'gulp-stylus'
sourcemaps = require 'gulp-sourcemaps'

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

styles = () ->
  gulp.src(['!assets/css/_*.styl', 'assets/css/*.styl'])
    .pipe(sourcemaps.init())
    .pipe(stylus())
    .pipe(sourcemaps.write())
    .pipe(gulp.dest('public/css'))

gulp.task('clean', () ->
  gulp.src('public').pipe(clean())
)

gulp.task('scripts', ['clean'], scripts)

gulp.task('jade', ['clean'], jade_task)

gulp.task('stylus', ['clean'], styles)


gulp.task('open', ['jade', 'scripts', 'stylus'], () ->
  gulp.src('public/index.html').pipe(open())
)

gulp.task('watch', () ->
  gulp.watch('views/*.jade', jade_task)
  gulp.watch('assets/js/*.coffee', scripts)
  gulp.watch('assets/css/*.styl', styles)
)

gulp.task('default', ['clean', 'jade', 'scripts', 'stylus', 'open', 'watch'])
