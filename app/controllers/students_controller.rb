class StudentsController < ApplicationController
  
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = 'ユーザー登録しました！'
      redirect_to @student
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def show
    @student = Student.find(params[:id])
  end
  
  private

  def student_params
    params.require(:student).permit(:name, :email, :birthday, :address, :password, :password_confirmation)
  end
  
end
