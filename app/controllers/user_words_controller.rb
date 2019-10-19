class UserWordsController < ApplicationController

  # GET: /user_words
  # get "/" do
  #   redirect "/user_words"
  # end

  get "/user_words" do
    erb :"/user_words/index.html"
  end

  # GET: /user_words/new
  get "/user_words/new" do
    erb :"/user_words/new.html"
  end

  # POST: /user_words
  post "/user_words" do
    redirect "/user_words"
  end

  # GET: /user_words/5
  get "/user_words/:id" do
    erb :"/user_words/show.html"
  end

  # GET: /user_words/5/edit
  get "/user_words/:id/edit" do
    erb :"/user_words/edit.html"
  end

  # PATCH: /user_words/5
  patch "/user_words/:id" do
    redirect "/user_words/:id"
  end

  # DELETE: /user_words/5/delete
  delete "/user_words/:id/delete" do
    redirect "/user_words"
  end
end
