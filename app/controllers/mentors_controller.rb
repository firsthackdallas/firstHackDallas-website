class MentorsController < ApplicationController
  def index
  end

  def new
    @nine_eleven_option = @eleven_one_option = @one_three_option = @three_five_option = @five_seven_option = @seven_eight_option = true
    @nine_eleven_count = @eleven_one_count = @one_three_count = @three_five_count = @five_seven_count = @seven_eight_count = 0
    mentors = Mentor.all
    mentor_options(mentors)
  end

  def create
    mentor = Mentor.new(mentor_params)
    if mentor.save
      flash[:success] = "Thank you signing up to mentor!! You have been added to our Mentor email list and will be contacted closer to the event."
      redirect_to "/mentors"
    else
      flash[:errors] = mentor.errors.full_messages
      redirect_to :back
    end
  end

  def mentor_options(mentors)
    mentors.each do |ment|
      ment.time.each do |times|
        if times === "nine_eleven"
          nine_eleven_show_option()
        elsif times === "eleven_one"
          eleven_one_show_option()
        elsif times === "one_three"
          one_three_show_option()
        elsif times === "three_five"
          three_five_show_option()
        elsif times === "five_seven"
          five_seven_show_option()
        elsif times === "seven_eight"
          seven_eight_show_option()
        end
      end
    end
  end

  def nine_eleven_show_option
    if @nine_eleven_count < 4
      @nine_eleven_count += 1
      @nine_eleven_option = true
    else
      @nine_eleven_option = false
    end
  end

  def eleven_one_show_option
    if @eleven_one_count < 4
      @eleven_one_count += 1
      @eleven_one_option = true
    else
      @eleven_one_option = false
    end
  end

  def one_three_show_option
    if @one_three_count < 4
      @one_three_count += 1
      @one_three_option = true
    else
      @one_three_option = false
    end
  end

  def three_five_show_option
    if @three_five_count < 4
      @three_five_count += 1
      @three_five_option = true
    else
      @three_five_option = false
    end
  end

  def five_seven_show_option
    if @five_seven_count < 4
      @five_seven_count += 1
      @five_seven_option = true
    else
      @five_seven_option = false
    end
  end

  def seven_eight_show_option
    if @seven_eight_count < 4
      @seven_eight_count += 1
      @seven_eight_option = true
    else
      @seven_eight_option = false
    end
  end

  private
  def mentor_params
    params.require(:mentor).permit(:first_name, :last_name, :email, :tech, time:[])
  end
end
