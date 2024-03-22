class StringCalculatorController < ApplicationController
  def add
    numbers = params[:numbers]

    render json: numbers.split(',').map(&:to_i).sum
  end
end
