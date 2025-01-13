class GamesController < ApplicationController
  def new
    @letters = Random.alphanumeric(10, chars: [*"a".."z"]).chars
  end

  def score
  end
end
