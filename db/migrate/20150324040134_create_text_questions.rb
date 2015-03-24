class CreateTextQuestions < ActiveRecord::Migration
  def change
    create_table :text_questions do |t|
      t.text :content
      t.text :sample_answer
      t.integer :course_id

      t.timestamps
    end
  end
end
