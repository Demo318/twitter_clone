class RegistrationsController < Devise::RegistrationsController

  def create
    @user = User.new(sign_up_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user}
      else
        format.html { render "devise/registrations/new", status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def sign_up_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :current_password)  
  end

end