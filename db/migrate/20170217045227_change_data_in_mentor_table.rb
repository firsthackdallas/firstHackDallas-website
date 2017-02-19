class ChangeDataInMentorTable < ActiveRecord::Migration[5.0]
  def change
    change_column :mentors, :time, :text
  end
end
