var gulp = require('gulp');
var exec = require('child_process').exec;
var watch = require('gulp-watch');

gulp.task('default', function () {
  gulp.start(['build']);
  gulp.watch(['qrcodes.html.erb', 'html.rb', 'qrcodes.csv'],['build']);
});

gulp.task('build', function (cb) {
  exec('./html.rb > qrcode.html', function (err, stdout, stderr) {
    console.log(stdout);
    console.log(stderr);
    cb(err);
  });
})
