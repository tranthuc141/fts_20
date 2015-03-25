$( document ).ready(function() {
  if(Number($('#__exam_time_value').val()) > 0) {
    var intervalId = setInterval(function(){
      var exam_time = Number($('#__exam_time_value').val());
      if(exam_time < 0) {
        clearInterval(intervalId);
        alert('Exam time has expired, your examination will be submitted automatically');
        $('#submit_answer_sheet').click();
        return;
      }
      $('#__exam_time').html(exam_time_s(exam_time));
      $('#__exam_time_value').val(exam_time - 1);
    },1000);
  }
});

function exam_time_s(exam_time) {
  if (exam_time <= 0) {
    return "00:00:00";
  }
  var day = parseInt(exam_time / (24 * 60 * 60));
  var hour = parseInt(exam_time / (60 * 60) % 24);
  var minute = parseInt((exam_time / 60) % 60);
  var second = parseInt(exam_time % 60);
  var s = '';
  if (day > 0) s = s + day + ' day ';
  if (hour > 9)
    s = s + hour;
  else
    s = s + '0' + hour;
  s = s + ':';
  if (minute > 9)
    s = s + minute;
  else
    s = s + '0' + minute;
  s = s + ':';
  if (second > 9)
    s = s + second;
  else
    s = s + '0' + second;
  return s;
}