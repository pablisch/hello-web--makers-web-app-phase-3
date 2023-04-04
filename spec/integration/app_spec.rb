require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  # context "GET to /" do
  #   it "returns 200 OK with the right content" do
  #     response = get("/")
  #     expect(response.status).to eq 200
  #     expect(response.body).to eq "Some response data"
  #   end
  # end

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
      response = post('/sort-names?names=Zoe,Alice,Sabina,Julia,Kieran')
      expect(response.status).to eq(200)
      expect(response.body).to eq "Alice,Julia,Kieran,Sabina,Zoe"
    end
  end

  context "GET /hello" do
    it 'returns 200 OK with correct HTML content at hello.erb' do
      response = get('/hello')
      expect(response.status).to eq(200)
      expect(response.body).to include '<h1>Hello!</h1>'
    end

    it 'returns 200 OK with correct HTML content at hello.erb' do
      response = get('/hello')
      expect(response.status).to eq(200)
      expect(response.body).to include 
      '<body>
        <h1>Hello!</h1>
      </body>'
    end
  end

  it 'returns 200 OK with correct HTML content at index.erb' do
    response = get('/?name=Pablo')
    expect(response.status).to eq(200)
    expect(response.body).to include '<h1>Hello Pablo!</h1>'
  end

  context "GET /my_test" do
    it 'returns 200 OK with correct HTML content using my_test.erb and @name' do
      response = get('/my_test?greeting=Hello&addressing=Pablo')
      expect(response.status).to eq(200)
      expect(response.body).to include '<h1>Hello Pablo!</h1>'
    end
  
    it 'returns 200 OK with correct HTML content using my_test.erb and @name' do
      response = get('/my_test?greeting=Welcome&addressing=all&name1=Toby&name2=Sam&name3=Tom')
      expect(response.status).to eq(200)
      expect(response.body).to include '<h1>Welcome all!</h1>'
      expect(response.body).to include '<p>Names: Toby, Sam and Tom'
    end
  end


end











# context "GET to /" do
#     it "returns 200 OK with the right content" do
#       # Send a GET request to /
#       # and returns a response object we can test.
#       response = get("/")

#       # Assert the response status code and body.
#       expect(response.status).to eq(200)
#       expect(response.body).to eq("Some response data")
#     end
#   end

#   context "POST to /submit" do
#     it "returns 200 OK with the right content" do
#       # Send a POST request to /submit
#       # with some body parameters
#       # and returns a response object we can test.
#       response = post("/submit", name: "Dana", some_other_param: 12)

#       # Assert the response status code and body.
#       expect(response.status).to eq(200)
#       expect(response.body).to eq("Hello Dana")
#     end