class CreateResetPasswords < ActiveRecord::Migration[5.0]
  def change
    create_table :reset_passwords do |t|
      t.string :token
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
