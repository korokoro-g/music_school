class TeacherProfilesController < ApplicationController
  before_action :require_teacher_logged_in, only: [:new, :create, :edit, :update, :me]
#  before_action :correct_teacher, only: [:edit, :update]
  
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
  
# 自分以外のユーザーが見るための詳細ページ
  def show
    @teacher_profile = TeacherProfile.find_by(id: params[:id])
  end

  def index
    @teacher_profiles = TeacherProfile.order(id: :desc).page(params[:page]).per(5)
    counts(TeacherProfile)
  end

  def edit
    @teacher_profile = current_teacher.teacher_profile
  end

  def update
    @teacher_profile = current_teacher.teacher_profile
    
    if @teacher_profile.update(teacher_profile_params)
      flash[:success] = 'プロフィールを更新しました。'
      redirect_to me_path
    else
      flash.now[:danger] = 'プロフィールの更新に失敗しました。'
      render :edit
    end
  end
  
  def search
    @teacher_profiles = TeacherProfile.search(params[:search]).page(params[:page]).per(20)
    counts(@teacher_profiles)
  end
  
# 自分が見るための詳細ページ  
  def me
    @teacher_books = current_teacher.bookings.order(:booked_at_date)
    @teacher_profile = current_teacher.teacher_profile
    if @teacher_profile.nil? 
      flash[:danger] = 'プロフィールを登録してください。'
      redirect_to  new_teacher_profile_path
    else
      render :show
    end
  end
  
  private
  
  def teacher_profile_params
    params.require(:teacher_profile).permit(:nickname, :instrument, :level, :lesson_fee, :introduction)
  end
  
  def correct_teacher
    @teacher_profile = current_teacher.teacher_profile.find_by(id: params[:id])
    unless @teacher_profile
      redirect_to root_url
    end
  end
  
#   def correct_teacher
#    unless current_teacher.teacher_profile.id == params[:id]
#      redirect_to root_url
#    end
#  end

end
