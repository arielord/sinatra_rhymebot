class UsersController < ApplicationController

  # GET: /users
  get "/users/login" do
    #show all user_words
    erb :"/users/login.html"
  end

  # GET: /users/new
  get "/users/signup" do
    erb :"/users/signup.html"
  end

  # POST: /users
  post "/users" do
    @user = User.new
    @user.email = params[:email]
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.password = params[:password]

    if @user.save
      redirect '/login'
    else
      redirect "/users/new"
    end
  end
end
