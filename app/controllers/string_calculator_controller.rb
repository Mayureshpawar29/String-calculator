class StringCalculatorController < ApplicationController
  def add
    begin
      numbers = params[:numbers]
      delimiter = numbers[2] if numbers.include?("//")
      numbers = numbers.split("\n")[1] if delimiter.present?
      numbers = delimiter.present? ? numbers.split(delimiter) : numbers.split(/,|\n/)

      negative_numbers = numbers.split(/\n|,/).flatten.select { |num| num.to_i < 0 }

      raise "negative numbers not allowed #{negative_numbers.join(',')}" if negative_numbers.present?

      render json: numbers.map(&:to_i).sum
    rescue => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end
end
