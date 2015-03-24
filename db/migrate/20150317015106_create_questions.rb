class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :content
      t.integer :course_id
      t.string :type_question

      t.timestamps
    end
  end
end
