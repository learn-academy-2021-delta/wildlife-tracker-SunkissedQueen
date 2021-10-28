The Forest Service is considering a proposal to place in conservancy a forest of virgin Douglas fir just outside of Portland, Oregon. Before they give the go-ahead, they need to do an environmental impact study. They've asked you to build an API the rangers can use to report wildlife sightings.
Model class - singular and PascalCase
Model file name - singular and snake_case
Database table - plural and snake_case

$ rails new wildlife_tracker -d postgresql -T
$  cd wildlife_tracker
$  ls -a
$ git remote add origin https://github.com/learn-academy-2021-delta/wildlife-tracker-SunkissedQueen.git
$ git checkout -b main
$ git add .
$ git commit -m "initial commit"
$ git push origin main
$ rails db:create
$  code .
$ bundle add rspec-rails
$  rails generate rspec:install
$  rails s

Story: As a developer I can create an animal model in the database. An animal has the following information: common name, latin name, kingdom (mammal, insect, etc.).
 $ rails g resource Animal common_name:string latin_name:string kingdom:string
$ rails db:migrate

Story: As the consumer of the API I can see all the animals in the database.
Hint: Make a few animals using Rails Console
$ rails c
Animal.create common_name:'wild boar', latin_name:'sus scrofa', kingdom:'mammal'
index controller, params get

Story: As the consumer of the API I can update an animal in the database.
update and show controller with strong params and disable tokens on app controller, 
params get to see index and patch to update, pass info in the raw, body

Story: As the consumer of the API I can destroy an animal in the database.
destroy method in controller, params delete

Story: As the consumer of the API I can create a new animal in the database.
create controller, params post

Story: As the consumer of the API I can create a sighting of an animal with date (use the datetime datatype), a latitude, and a longitude.
Hint: An animal has_many sightings. (rails g resource Sighting animal_id:integer ...)
$ rails g resource Sighting date:datetime latitude:float longitude:float animal_id:integer
model--->Animal has_many :sightings, Sighting belongs_to :animal
$ rails db:migrate
$ gaffy = Animal.first
$ gaffy.sightings.create date:"2021-01-18", latitude:"9.336N", longitude:"18.223W"
$ hop = Animal.find 2
$ liz = Animal.where(common_name:"gazelle").first
$ liz.sightings.create date:"2021-01-18", latitude:"9.336N", longitude:"18.223W"

Change the datatype
$ rails g migration change_latitude_to_be_string_sightings
$ rails db:migrate
Go to the migration
def change
    change_column :sightings, :latitude, :string
    change_column :sightings, :longitude, :string
  end

update the sighting controller with index, show, create, strong params
params--->post/sightings--->body, raw {date, lat,long, animal_id}

Story: As the consumer of the API I can update an animal sighting in the database.


Story: As the consumer of the API I can destroy an animal sighting in the database.


Story: As the consumer of the API, when I view a specific animal, I can also see a list sightings of that animal.
Hint: Checkout the Ruby on Rails API docs on how to include associations.
Story: As the consumer of the API, I can run a report to list all sightings during a given time period.
Hint: Your controller can look like this:
class SightingsController < ApplicationController
  def index
    sightings = Sighting.where(date: params[:start_date]..params[:end_date])
    render json: sightings
  end
end
Remember to add the start_date and end_date to what is permitted in your strong parameters method.

Stretch Challenges
Note: All of these stories should include the proper RSpec tests. Validations will require specs in spec/models, and the controller method will require specs in spec/requests.

Story: As the consumer of the API, I want to see validation errors if a sighting doesn't include: latitude, longitude, or a date.
Story: As the consumer of the API, I want to see validation errors if an animal doesn't include a common name, or a latin name.
Story: As the consumer of the API, I want to see a validation error if the animals latin name matches exactly the common name.
Story: As the consumer of the API, I want to see a validation error if the animals latin name or common name are not unique.
Story: As the consumer, I want to see a status code of 422 when a post request can not be completed because of validation errors.
Check out Handling Errors in an API Application the Rails Way
Super Stretch Challenge
Story: As the consumer of the API, I can submit sighting data along with a new animal in a single API call.
Hint: Look into accepts_nested_attributes_for


We will use fetch to allow a web browser to make an asynchornous request to use another person's API. Ypu will create your own website using someone else's info. A request-response cycle the payload will populate the app. It allows a certain piece of code to wait on a response and allow the other code to continue with a different action. There is a placeholder for the asynchrous action is a promise. This action will finish, which will have success or failure. A response will always happen. A promise is a javascript object. Pending, fullfilled, or rejected

make yarn create react app
cd into folder
text editor

Go to App.js under src
import
class
render
<>
<h2>IP address</h2>
</>
return
export

yarn start to pull up browser


Add custom functions that will live above render()...giving an alert to perform function

    getIP = () => {
        alert("Howdy)
    }
..adding a behavior a button with onclick
Between <> </>
<button>Click me!</button>

Give attribute to button {}allows to escape into the JSX and back into the function to call method
<button onClick={this.getIP}>Click me!</button>

Instead of alert make a request
    Erase alert..create a fetch request to the endpoint of the particular API

    fetch steps out of que and then do the next action..add .json to allow the promise to occur while it waits to give the payload...first then handles the response

    fetch("https://ipapi.co/json/").then(reponse => console.log(response.json()))

    Remove the conosle.log add another then to handle the payload
    fetch("https://ipapi.co/json/")
    .then(reponse => response.json())
    .then(payload => console.log(payload))

    Create a constructor method
    Class
    constructor
    super
    this.state = {
        ip:""
    }
    fetch("https://ipapi.co/json/")
    .then(reponse => response.json())
    .then(payload => this.setState({ip: payload}))

    under render() before return

    console.log(this.state.ip)

    To pull a value from the object use dot notationcode .
    
    ie.  this.state.ip.city

Under the button this.getIp
<h4>{this.state.ip.ip}</h4>

F4N2nhSKUlQcg0YUuOZhPZpgn2XQ65SGBl0cqc3P