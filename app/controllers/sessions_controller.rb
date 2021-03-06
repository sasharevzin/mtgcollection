class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      if @user.activated?
        log_in @user
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        redirect_back_or @user
      elsif !@user.activated?
        message = "Account not activated. "
        # re-send activation email
        if 24.hours.ago > @user.activation_sent_at
          @user.update_activation_digest
          @user.send_activation_email
          message += "Check your email for NEW activation link."
        else
          d = @user.activation_sent_at.in_time_zone("Eastern Time (US & Canada)") + 24.hours
          message += "Check your email for the activation link. You'll be able to get a new one after #{d.strftime('%a, %d %b %Y %H:%M:%S')} EST."
        end
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
