require 'rails_helper'

RSpec.describe StringCalculatorController, type: :controller do
  describe ".add" do
    context "given an empty string" do
      it "returns zero" do
        get :add, params: { numbers: "" }

        # binding.pry

        expect(response.parsed_body).to eql(0)
      end
    end
  end
end
