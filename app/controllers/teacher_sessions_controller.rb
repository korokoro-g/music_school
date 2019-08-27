class TeacherSessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = 'ログインに成功しました。'
      if current_teacher.teacher_profile
        redirect_to root_path
      else
        flash[:danger] = 'プロフィールを登録してください。'
        redirect_to new_teacher_profile_path
      end
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render 'new'
    end
  end

  def destroy
    session[:teacher_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
  
  private

  def login(email, password)
    @teacher = Teacher.find_by(email: email)
    if @teacher && @teacher.authenticate(password)
      # ログイン成功
      session[:teacher_id] = @teacher.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
  
end
