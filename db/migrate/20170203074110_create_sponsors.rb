class CreateSponsors < ActiveRecord::Migration[5.0]
  def change
    create_table :sponsors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :sponsorship_tier
      t.string :sponsor_type

      t.timestamps
    end
  end
end
