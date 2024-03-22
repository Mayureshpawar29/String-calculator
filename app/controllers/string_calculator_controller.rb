class StringCalculatorController < ApplicationController
  def add
    numbers = params[:numbers]

    render json: numbers.split(/\n|,/).map(&:to_i).sum
  end
end
