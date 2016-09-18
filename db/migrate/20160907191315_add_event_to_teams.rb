class AddEventToTeams < ActiveRecord::Migration[5.0]
  def change
    add_reference :teams, :event, foreign_key: true
  end
end
