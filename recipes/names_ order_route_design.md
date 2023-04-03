# {{ METHOD }} {{ PATH}} Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)

  Response:   |  "Alice,Joe,Julia,Kieran,Zoe" - sorted names
   Method:    |  POST
    Path:     |  /sort-names
Query params: |  
Body params:  |  names=Joe,Alice,Zoe,Julia,Kieran

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

When query param `names` is `Joe,Alice,Zoe,Julia,Kieran`
```
Alice,Joe,Julia,Kieran,Zoe
```

When query param `names` is `Zoe,Alice,Sabina,Julia,Kieran`
```
Alice,Julia,Kieran,Sabina,Zoe
```


## 3. Write Examples

_Replace these with your own design._

```
# Request:
POST /sort-names with params names=Joe,Alice,Zoe,Julia,Kieran

# Expected response:
Alice,Joe,Julia,Kieran,Zoe
```

```
# Request:
POST /sort-names with params names=Zoe,Alice,Sabina,Julia,Kieran

# Expected response:
Alice,Julia,Kieran,Sabina,Zoe
```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

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
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.