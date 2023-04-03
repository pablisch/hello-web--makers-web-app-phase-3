require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET to /" do
    it "returns 200 OK with the right content" do
      response = get("/")
      expect(response.status).to eq 200
      expect(response.body).to eq "Some response data"
    end
  end

  context "POST to /submit" do
    it "returns 200 OK with the right content" do
      response = post("/submit?name=Dana")
      expect(response.status).to eq 200
      expect(response.body).to eq "Hello Dana"
    end
  end

  context "GET to /names" do
    it "returns 200 OK with the right content" do
      response = get("/names?names=Julia,Mary,Karim")
      expect(response.status).to eq 200
      expect(response.body).to eq "Julia, Mary, Karim"
    end

    it "returns 200 OK with the right content" do
      response = get("/names?names=Henry,Mary,Sabina")
      expect(response.status).to eq 200
      expect(response.body).to eq "Henry, Mary, Sabina"
    end
  end

  context "GET /" do
    it 'returns 200 OK with correct content' do
      response = post('/sort-names', names: "Joe,Alice,Zoe,Julia,Kieran")
      expect(response.status).to eq(200)
      expect(response.body).to eq "Alice,Joe,Julia,Kieran,Zoe"
    end

    it 'returns 200 OK with correct content' do
      response = post('/sort-names', names: "Zoe,Alice,Sabina,Julia,Kieran")
      expect(response.status).to eq(200)
      expect(response.body).to eq "Alice,Julia,Kieran,Sabina,Zoe"
    end
  end
  

  
  
end