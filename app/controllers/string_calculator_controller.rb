class StringCalculatorController < ApplicationController
  def add
    begin
      numbers = params[:numbers]
      delimiter = find_delimiter(numbers)
      numbers = numbers.split("\n")[1] if delimiter.present?
      numbers = delimiter.present? ? numbers.split(delimiter) : numbers.split(/,|\n/)

      negative_numbers = numbers.split(/\n|,/).flatten.select { |num| num.to_i < 0 }

      raise "negative numbers not allowed #{negative_numbers.join(',')}" if negative_numbers.present?

      render json: numbers.map(&:to_i).reject{|num| num >1000 }.sum
    rescue => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  private

  def find_delimiter(numbers)
    if numbers.include?("//[")
      index = numbers.index("//[")
      closing_bracket_index = numbers.index("]")
      delimiter = numbers[(index + 3)...(closing_bracket_index)]
    elsif numbers.include?("//")
      index = numbers.index("//")
      delimiter = numbers[index + 2]
    end

    delimiter
  end
end
