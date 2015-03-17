class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :question_id
      t.text :content
      t.boolean :correct

      t.timestamps
    end
  end
end
