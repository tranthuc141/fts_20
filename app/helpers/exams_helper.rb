module ExamsHelper
  def second_to_time s
    return "00:00:00" if s <= 0
    hours = (s / 3600).floor
    minutes = (s / 60).floor - hours * 60
    seconds = s.floor % 60
    "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
  end

  def delete_expired_exams
    expired_exams = Exam.not_check_yet.expired
    expired_exams.each do |exam|
      exam.destroy
    end
  end
end
