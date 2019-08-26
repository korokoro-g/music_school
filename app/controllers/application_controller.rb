class ApplicationController < ActionController::Base
  
  include TeacherSessionsHelper
  
  private
  
  def require_teacher_logged_in
    unless teacher_logged_in?
      redirect_to root_path
    end
  end
  
end
