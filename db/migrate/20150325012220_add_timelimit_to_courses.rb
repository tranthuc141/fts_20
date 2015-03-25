class AddTimelimitToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :time_limit, :integer
  end
end
