class SponsorsController < ApplicationController
  def index
  end
  def create
    sponsor = Sponsor.new(sponsor_params)
    if sponsor.save
      flash[:sponsorship_success] = "Thanks for helping us out with this event. We will reach out to you shortly."
      redirect_to '/sponsors'
    else
      flash[:registration_errors] = sponsor.errors
			redirect_to :back
    end
  end

  private
		def sponsor_params
			params.require(:sponsor).permit(
				:first_name,
				:last_name,
				:email,
				:phone_number,
        :sponsor_type
			)
		end
end
