class TeacherProfilesController < ApplicationController
  before_action :require_teacher_logged_in, only: [:new, :create, :edit, :update]
  
  def new
    @teacher_profile = current_teacher.build_teacher_profile
  end

  def create
    @teacher_profile = current_teacher.build_teacher_profile(teacher_profile_params)
    
    if @teacher_profile.save
      flash[:success] = 'プロフィールを登録しました。'
      redirect_to @teacher_profile
    else
      flash.now[:danger] = 'プロフィールの登録に失敗しました。'
      render :new
    end
  end

  def show
    @teacher_profile = current_teacher.teacher_profile
    unless @teacher_profile
      flash[:danger] = 'プロフィールを登録してください。'
      render :new
    end
  end

  def index
    @teacher_profiles = TeacherProfile.order(id: :desc).page(params[:page]).per(20)
  end

  def edit
    @teacher_profile = current_teacher.teacher_profile
  end

  def update
    @teacher_profile = current_teacher.teacher_profile
    
    if @teacher_profile.update(teacher_profile_params)
      flash[:success] = 'プロフィールを更新しました。'
      redirect_to @teacher_profile
    else
      flash.now[:danger] = 'プロフィールの更新に失敗しました。'
      render :edit
    end
  end
  
  private
  
  def teacher_profile_params
    params.require(:teacher_profile).permit(:nickname, :instrument, :level, :lesson_fee, :introduction)
  end

end
