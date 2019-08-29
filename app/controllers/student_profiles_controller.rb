class StudentProfilesController < ApplicationController
  before_action :require_student_logged_in
  
  def new
    @student_profile = current_student.build_student_profile
  end

  def create
    @student_profile = current_student.build_student_profile(student_profile_params)
    
    if @student_profile.save
      flash[:success] = 'プロフィールを登録しました。'
      redirect_to @student_profile
    else
      flash.now[:danger] = 'プロフィールの登録に失敗しました。'
      render :new
    end
  end

  def show
    @student_profile = current_student.student_profile
    unless @student_profile
      flash[:danger] = 'プロフィールを登録してください。'
      render :new
    end
  end

  def edit
    @student_profile = current_student.student_profile
  end

  def update
    @student_profile = current_student.student_profile
    
    if @student_profile.update(student_profile_params)
      flash[:success] = 'プロフィールを更新しました。'
      redirect_to @student_profile
    else
      flash.now[:danger] = 'プロフィールの更新に失敗しました。'
      render :edit
    end
  end
  
  private
  
  def student_profile_params
    params.require(:student_profile).permit(:nickname, :introduction)
  end
  
end
