class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    erb :"/users/index.html"
  end

  # GET: /users/new
  get "/signup" do
    erb :"/users/new.html"
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
      redirect "/signup"
    end
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
