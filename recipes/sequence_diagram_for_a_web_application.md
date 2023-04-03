# Sequence diagram for a web application

![]()

Drawing this and filling in what was happening made me aware of how little I understand about what is really being passed around. 
What is being passed to and from the client seems relatively clear but beyond that I can't see much more than passing. 
I can see that app.rb can process the data returned from the route block but not at all sure what happens with Rackup, presumably some chicanery to encode and decode HTTProtocal.


```
alias cli=" Client "
alias sin="   Sinatra
Application
  ----------
  Rackup"
  alias app="   Sinatra
Application
  ----------
    app.rb"
  alias get="   Sinatra
Application
  ----------
 route block"


cli->sin:"HTTP Request:
POST /sort-names
names=Joe,Alice,Zoe,Julia,Kieran"
sin->app:"Forwards HTTP Request:
POST /sort-names
names=Joe,Alice,Zoe,Julia,Kieran"
app->get:"??? Forwards HTTP Request:
POST /sort-names
names=Joe,Alice,Zoe,Julia,Kieran ???"
get->app:"Returns HTTP Response:
POST??? Where to?
'Alice,Joe,Julia,Kieran,Zoe'"
app->sin:"Sends HTTP Response:
POST??? Where to?
'Alice,Joe,Julia,Kieran,Zoe'"
sin->cli: "HTTP Response:
POST??? Where to?
'Alice,Joe,Julia,Kieran,Zoe'"
```