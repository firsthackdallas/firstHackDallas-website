class ChangeDataTypeColumnMentors < ActiveRecord::Migration[5.0]
  def change
    change_column :mentors, :time, :string
  end
end
