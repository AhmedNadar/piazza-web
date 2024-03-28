class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(secure_params)
    if @user.save
      @organization = Organization.create(members: [@user]) # TODO: Log in user...
      redirect_to root_path,
        status: :see_other,
        flash: { success: t(".welcome", name: @user.name) }
    else
      render :new, status: :unprocessable_entity
    end

  end
    private
    def secure_params
      params.require(:user).permit(:name, :email, :password)
    end
end

