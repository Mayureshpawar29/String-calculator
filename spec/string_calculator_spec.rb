require 'rails_helper'

RSpec.describe StringCalculatorController, type: :controller do
  describe "#add" do
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

    context "given an large number of string 1\n2\n3\n4 " do
      it "returns sum of the numbers" do
        get :add, params: { numbers: "1\n2\n3\n4" }
        expect(response.parsed_body).to eql(10)
      end
    end

    context "given an large number of string 1,\n " do
      it "returns sum of the numbers" do
        get :add, params: { numbers: "1,\n" }
        expect(response.parsed_body).to eql(1)
      end
    end

    context "given an large number of string //;\n1;2 " do
      it "returns sum of the numbers" do
        get :add, params: { numbers: "//;\n1;2" }
        expect(response.parsed_body).to eql(3)
      end
    end

    context "given an large number of string //;\n1;2 " do
      it "returns sum of the numbers" do
        get :add, params: { numbers: "//;\n1;2" }
        expect(response.parsed_body).to eql(3)
      end
    end

    context "given an large number of string //;\n1;2 " do
      it "returns sum of the numbers" do
        get :add, params: { numbers: "//-\n3-4-5" }
        expect(response.parsed_body).to eql(12)
      end
    end

    context "given an large number of string -1,-2,3,-4 " do
      it "returns sum of the numbers" do
        get :add, params: { numbers: "-1,-2,3,-4" }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.parsed_body['error']).to eq("negative numbers not allowed -1,-2,-4")
      end
    end

    context "given an large number of string //;\n-1;-2;3;-4 " do
      it "returns sum of the numbers" do
        get :add, params: { numbers: "//;\n-1;-2;3;-4" }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.parsed_body['error']).to eq("negative numbers not allowed -1,-2,-4")
      end
    end
  end
end
