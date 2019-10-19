require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    erb :welcome
  end

  def logged_in?
    !!session[:id]
  end

  def log_out
    session.clear
  end

  def user_logged_in?
    if logged_in?
      redirect "/"
    end
  end

  def user_not_logged_in
    if !logged_in?
      redirect "users/login"
    end
  end

end
