class UserWordsController < ApplicationController

  # GET: /user_words
  get "/" do
    user_not_logged_in
    redirect "/user_words"
  end

  get "/user_words" do
    user_not_logged_in
    @user_words = UserWord.where(user_id: session[:id])
    erb :"/user_words/index.html"
  end

  # GET: /user_words/new
  # get "/user_words/new" do
  #   user_not_logged_in
  #   erb :"/user_words/new.html"
  # end

  # POST: /user_words
  post "/user_words" do
    user_not_logged_in
    word = Word.find_by(spelling: params[:input].upcase)
    UserWord.create(user_id: session[:id], word_id: word.id)
    redirect "/user_words/#{word.id}"
  end

  # GET: /user_words/5
  get "/user_words/:id" do
    user_not_logged_in
    word = Word.find(params[:id])
    @keys = Rhymebot.phoneme_count(word)
    @rhymes = Rhymebot.find_best_rhymes(word)
    erb :"/user_words/show.html"
  end

  # GET: /user_words/5/edit
  get "/user_words/:id/edit" do
    user_not_logged_in
    erb :"/user_words/edit.html"
  end

  # PATCH: /user_words/5
  patch "/user_words/:id" do
    user_not_logged_in
    redirect "/user_words/:id"
  end

  # DELETE: /user_words/5/delete

  delete "/user_words/:id/delete" do
    user_not_logged_in
    user_word = UserWord.find_by(user_id: session[:id], word_id: params[:id])
    user_word.delete
    #UserWord.delete(user_word.id)
    redirect "/user_words"
  end
end
