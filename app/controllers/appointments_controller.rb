class AppointmentsController < ApplicationController
  
  def index
  end

  def new
    @appointment = Appointment.new
  end

  def show
    
    @user = User.find(params[:user_id])
     if @user.user_type == "mentor"
       @appointment = @user.mentor_sessions.find(params[:id])
     else
      @appointment = @user.study_sessions.find(params[:id])
     end
  
  end


  def create    
    @user = User.find(params[:user_id])

    start_time = params[:appointment][:start_time]
    end_time = params[:appointment][:end_time]
    topic = params[:appointment][:topic]

    appointment = Appointment.new(mentor_id: params[:user_id], 
                                  start_time: start_time, 
                                  end_time: end_time, 
                                  topic: topic )
    
    if appointment.save
       redirect_to user_path(@user)
       flash[:alert] = "Session slot created successfully!"
    end
  #   args = params[:appointment]
  #   args[:mentor_id] = params[:user_id]
    
  #   args = params[:appointment]
  #  args[:mentor_id] = params[:user_id]
   
  end

  def update
      appointment = Appointment.find(params[:id])
      appointment.update(student_id: params[:user_id])
      redirect_to user_path(params[:user_id])
  end
  
# end

  # appointment = Appointment.new(mentor_id: params[:user_id], start_time: start_time, end_time: end_time, topic: topic )
  
  # if appointment.save
  #    redirect_to user_path(@user)
  #    flash[:alert] = "Session slot created successfully!"
  # end
  
  # end

  # def update
  #     appointment = Appointment.find(params[:id])
  #     appointment.update(student_id: params[:user_id])
  #     redirect_to user_path(params[:user_id])
  # end
  
end

