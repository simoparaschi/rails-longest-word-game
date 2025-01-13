require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = Random.alphanumeric(10, chars: [*"a".."z"]).chars
  end

  def score
    @word = params[:word].chars
    @letters = params[:letters].chars

    if @word.present?
      # Check if letters are in grid
      @is_english_word = true
      @word.each do |letter|
        if @letters.include?(letter)
          index = @letters.find_index(letter)
          @letters.delete_at(index)
        else
          @is_in_array = false
        end
      end

      # Check if word is English word
      url = "https://dictionary.lewagon.com/#{@word.join("")}"
      parsed_url = URI.parse(url).read
      response = JSON.parse(parsed_url)
      @is_english_word = response["found"]
    end
  end
end
