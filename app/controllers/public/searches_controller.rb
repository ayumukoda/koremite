class Public::SearchesController < ApplicationController
    before_action :authenticate_user!

  def search
    #@range = params[:range]
    @word = params[:word]

    #if @range == "User"
      @users = User.looks(params[:search], params[:word])
    #end
    render "public/searches/search_result"
  end
end
