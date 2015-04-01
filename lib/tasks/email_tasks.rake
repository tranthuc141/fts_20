desc 'send remind email'
task send_remind_email: :environment do
  ExamMailer.send_remind_email.deliver!
end
