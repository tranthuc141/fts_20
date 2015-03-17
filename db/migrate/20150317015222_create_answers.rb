class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :result_id
      t.integer :option_id
      t.integer :question_id

      t.timestamps
    end
  end
end
