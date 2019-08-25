class TeachersController < ApplicationController
  
  def show
     @teacher = Teacher.find(params[:id])
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      flash[:success] = 'ユーザー登録しました！'
      redirect_to @teacher
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :email, :birthday, :address, :password, :password_confirmation)
  end
  
end
