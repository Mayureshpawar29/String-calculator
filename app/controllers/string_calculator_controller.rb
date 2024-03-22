class StringCalculatorController < ApplicationController
  def add
    numbers = params[:numbers]
    delimeter = numbers[2] if params[:numbers].include?("//")

    render json: numbers.split(/\n|,|#{delimeter}/).map(&:to_i).sum
  end
end
