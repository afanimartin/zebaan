class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        form.html { redirect_to root_path, notice: "user created successfully." }
      else
        format.html { render :new, notice: "user could not be created.", status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_path(@user), notice: "user updated successfully." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_path, notice: "user deleted successfully." }
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :job_title, :company, :password, :password_confirmation).merge(role_id: 2)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
