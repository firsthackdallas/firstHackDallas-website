class RenameSponsorshipTierToPhoneNumberInSponsors < ActiveRecord::Migration[5.0]
  def up
  	rename_column :sponsors, :sponsorship_tier, :phone_number
  end

  def down
  	rename_column :sponsors, :phone_number, :sponsorship_tier
  end
end
