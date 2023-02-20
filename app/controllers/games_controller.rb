require 'json'
require 'open-uri'

class GamesController < ApplicationController

  def new
    @letters = Array.new(10) { ('a'..'z').to_a.sample }
  end

  def score
    @guess = params[:letter]
    if exist(@guess) == true
      @message = "Congratulations! #{@guess} is a valid English word"
  end

  end

  def exist(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    a = JSON.parse(URI.open(url).read)
    return a['found']
  end
end
