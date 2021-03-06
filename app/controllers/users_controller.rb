class UsersController < ApplicationController

  # GET: /users
  get "/users/login" do
    user_logged_in?
    @current_page = "login"
    erb :"/users/login.html"
  end

  get "/users/signout" do
    session.clear
    redirect "/users/login"
  end

  # GET: /users/new
  get "/users/signup" do
    user_logged_in?
    @current_page = "signup"
    erb :"/users/signup.html"
  end

  get "/users/:id/edit" do
    user_not_logged_in
    @user = User.find(session[:id])
    erb :"/users/edit.html"
  end

  patch '/users/:id/edit' do
    user = User.find(session[:id])

    user.first_name = params[:first_name]
    user.last_name = params[:last_name]

    user.save

    redirect "/"
  end

  # POST: /users
  post "/login" do
    @current_page = "login"
    @errors = false
    user = User.find_by(email: params[:email])

    if user
      if user.authenticate(params[:password])
        session[:id] = user.id
        redirect "/"
      else
        @errors = "Incorrect password."
        erb :"/users/login.html"
      end
    else
      @errors = "There are no accounts registered with this email."
      erb :"/users/login.html"
    end
  end

  post "/signup" do
    @current_page = "signup"
    @errors = false
    user = User.new
    user.email = params[:email]
    user.first_name = params[:first_name]
    user.last_name = params[:last_name]
    user.password = params[:password]

    if user.save
      redirect "/users/login"
    else
      @errors = "Error. Email may have already been used to create account."
      erb :"/users/signup.html"
    end
  end
end
