class RegistrationsController < Devise::RegistrationsController
  private
    def sign_up_params
      params.require(:user).permit(:email, :first_name, :last_name, :job_title, :company, :password, :password_confirmation).merge(role_id: 1)
    end

    def account_update_params
      params.require(:user).permit(:first_name, :last_name, :job_title, :company, :current_password, :password, :password_confirmation) 
    end
end
