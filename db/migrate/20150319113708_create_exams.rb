class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :user_id
      t.integer :course_id
      t.string :status

      t.timestamps
    end
  end
end
