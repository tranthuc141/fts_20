require "#{Rails.root}/app/helpers/exams_helper"
include ExamsHelper

desc 'delete expired exams'
task delete_expired_exams: :environment do
  ExamsHelper.delete_expired_exams
end
