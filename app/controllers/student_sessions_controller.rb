class StudentSessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if student_login(email, password)
      flash[:success] = 'ログインに成功しました。'
      if current_student.student_profile
        redirect_to root_path
      else
        flash[:danger] = 'プロフィールを登録してください。'
        redirect_to new_student_profile_path
      end
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render 'new'
    end
  end

  def destroy
    session[:student_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
  
  private

  def student_login(email, password)
    @student = Student.find_by(email: email)
    if @student && @student.authenticate(password)
      session[:student_id] = @student.id
      return true
    else
      return false
    end
  end
  
end
