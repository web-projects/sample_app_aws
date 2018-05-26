class SessionsController < ApplicationController

  def new
    #debugger
    #(byebug) session[:forwarding_url]
    #"http://localhost:3000/users/1/edit"
  end

  def create

    #user = User.find_by(email: params[:session][:email].downcase)
    #if user && user.authenticate(params[:session][:password])
    #  # Log the user in and redirect to the user's show page.
    #  log_in user

    #  # Rember user
    #  params[:session][:remember_me] == '1' ? remember(user) : forget(user)

    #  #redirect_to user_url(user) - rails automatic conversion below vvv
    #  redirect_to user
    #else
    #  #flash[:danger] = 'Invalid email/password combination' # Not quite right!
    #  flash.now[:danger] = 'Invalid email/password combination'
    #  render 'new'
    #end

    @user = User.find_by(email: params[:session][:email].downcase)
    #user = User.find_by(email: params[:session][:email].downcase)

    if @user && @user.authenticate(params[:session][:password])
    #if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      #log_in @user

      # Rember user
      #params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)

      #redirect_to @user
      #redirect_back_or @user

      if @user.activated?
        log_in @user
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        redirect_back_or @user
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end

    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end

  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
