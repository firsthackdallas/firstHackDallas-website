class MentorsController < ApplicationController
  def index
  end

  def new
  end

  def create
    mentor = Mentor.new(mentor_params)
    if mentor
      flash[:success] = "Thank you signing up to mentor!! You have been added to our Mentor email list and will be contacted closer to the event."
      redirect_to "/mentors"
    else
      flash[:errors] = mentor.errors.full_messages
      redirect_to :back
    end
  end

  private
  def mentor_params
    params.require(:mentor).permit(:first_name, :last_name, :email, :tech, :time)
  end
end
