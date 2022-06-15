class SessionsController < Devise::SessionsController
    def create
        email = params[:user][:email]
        password = params[:user][:password]

        if email == ''
            redirect_to new_user_session_path , alert: 'Please enter an email'
        elsif password == ''
            redirect_to new_user_session_path , alert: 'Please enter a password'
        end
    end
  end