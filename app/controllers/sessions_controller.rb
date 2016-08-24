class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message  = "Account not activated. "
        message += "Check your email for the activation." 
        message += " #{view_context.link_to "Resend Activation E-Mail", { action: "resend_activation",
        controller: "account_activations", email: user.email }, method: :post}"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger].html_safe = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
  
end
