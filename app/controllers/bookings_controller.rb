class BookingsController < ApplicationController
  before_action :require_student_logged_in, only: [:new, :create]

  def new
    @booking = current_student.bookings.build
  end
  
  def create
    @booking = current_student.bookings.build(booking_params)
    
    if @booking.save
      flash[:success] = '予約しました。'
      redirect_to student_profile_path(current_student)

    else
      flash.now[:danger] = '予約できませんでした。'
      render :new
    end
  end

  def show
    if teacher_logged_in?
      @teacher_booking = Booking.find(params[:id])
    elsif student_logged_in?
      @student_booking = Booking.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    if teacher_logged_in?
      @teacher_booking = current_teacher.bookings.find(params[:id])
      @teacher_booking.update(finish_teacher: true)
      flash[:success] = 'レッスンを完了しました。'
      redirect_back(fallback_location: root_path)
    elsif student_logged_in?
      @student_booking = current_student.bookings.find(params[:id])
      @student_booking.update(finish_student: true)
      flash[:success] = 'レッスンを完了しました。'
      redirect_back(fallback_location: root_path)
    else
      redirect_to root_path    
    end
  end

  def destroy
    if teacher_logged_in?
      @teacher_booking = Booking.find(params[:id])
      @teacher_booking.destroy
      flash[:danger] = '予約をキャンセルしました。'
      redirect_to me_path
    elsif student_logged_in?
      @student_booking = Booking.find(params[:id])
      @student_booking.destroy
      flash[:danger] = '予約をキャンセルしました。'
      redirect_to student_profile_path(current_student)
    else
      redirect_to root_path
    end
  end

  private
  
  def booking_params
    params.require(:booking).permit(:teacher_id, :booked_at_date, :booked_at_time)
  end
  
end
