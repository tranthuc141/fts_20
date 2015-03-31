class ExamMailer < ActionMailer::Base
  default from: "testingsystem20@gmail.com",
          return_path: "testingsystem20@gmail.com",
          sender: "testingsystem20@gmail.com"

  def send_remind_email
    unless emails.empty?
      mail(to: emails, subject: 'Warning about your exam')
    end
  end

  def emails
    exams = Exam.not_check_yet.warning
    users = exams.map(&:user)
    users.map(&:email).flatten
  end
end
