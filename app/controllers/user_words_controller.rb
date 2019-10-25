class UserWordsController < ApplicationController

  # GET: /user_words
  get "/" do
    user_not_logged_in
    redirect "/user_words"
  end

  get "/user_words" do
    user_not_logged_in
    #@user_words = UserWord.where(user_id: session[:id])
    @user_words = current_user.user_words
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

    if word
      user_word_exist = UserWord.find_by(user_id: session[:id], word_id: word.id)
      if !user_word_exist
        UserWord.create(user_id: session[:id], word_id: word.id)
      end
      redirect "/user_words/#{word.id}"
    else
      erb :"/failure"
    end
  end

  # GET: /user_words/5
  get "/user_words/:id" do
    user_not_logged_in
    word = Word.find(params[:id])
    @range_end = Rhymebot.phoneme_count(word)
    @range_start = word.last_vowel_placement
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
    if user_word
      user_word.delete
    end
    #UserWord.delete(user_word.id)
    redirect "/user_words"
  end
end
