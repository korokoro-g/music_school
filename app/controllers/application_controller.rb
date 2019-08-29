class ApplicationController < ActionController::Base
  
  include TeacherSessionsHelper
  include StudentSessionsHelper
  
  private
  
  def require_teacher_logged_in
    unless teacher_logged_in?
      redirect_to teacher_login_path
    end
  end
  
  def require_student_logged_in
    unless student_logged_in?
      redirect_to student_login_path
    end
  end
  
  def counts(profile)
    @teacher_profile_number = profile.count
  end
  
end
