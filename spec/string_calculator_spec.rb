require 'rails_helper'

RSpec.describe StringCalculatorController, type: :controller do
  describe ".add" do
    context "given an empty string" do
      it "returns sum of the numbers" do
        get :add, params: { numbers: "" }
        expect(response.parsed_body).to eql(0)
      end
    end

    context "given an string 1" do
      it "returns sum of the numbers" do
        get :add, params: { numbers: "1" }
        expect(response.parsed_body).to eql(1)
      end
    end

    context "given an string 1,2 " do
      it "returns sum of the numbers" do
        get :add, params: { numbers: "1, 2" }
        expect(response.parsed_body).to eql(3)
      end
    end

    context "given an large number of string 1,2,3,4,5,6 " do
      it "returns sum of the numbers" do
        get :add, params: { numbers: "1,2,3,4,5,6" }
        expect(response.parsed_body).to eql(21)
      end
    end

    context "given an large number of string 1\n2,3 " do
      it "returns sum of the numbers" do
        get :add, params: { numbers: "1\n2,3" }
        expect(response.parsed_body).to eql(6)
      end
    end
  end
end
