class TeacherProfilesController < ApplicationController
  before_action :require_teacher_logged_in, only[:edit, :update]
  
  def new
    @teacher_profile = TeacherProfile.new
  end

  def create
    @teacher_profile = TeacherProfile.new(teacher_profile_params)
    if @teacher_profile.save
      flash[:success] = 'プロフィールを登録しました。'
      redirect_to @teacher_profile
    else
      flash.now[:danger] = 'プロフィールの登録に失敗しました。'
      render :new
    end
  end

  def show
    @teacher_profile = TeacherProfile.find(params[:id])
  end

  def index
  end

  def edit
  end

  def update
  end
  
  private
  
  def teacher_profile_params
    params.require(:teacher_profile).permit(:nickname, :instrument, :level, :lesson_fee, :introduction)
  end

end
