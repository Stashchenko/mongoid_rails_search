# MongoidRailsSearch

Dependency "jquery-ui-rails", '>= 4.2.0'

mongoid_rails_search allows to generate search form and completely full response.
But this is test gem. Use it at your own risk.
 
## Installation

Add this line to your application's Gemfile:

    gem 'mongoid_rails_search', :git => 'https://github.com/Stashchenko/mongoid_rails_search.git'

And then execute:

    $ bundle  install

## Usage
      
The mongoid_rails_search files will be added to the asset pipeline and available for you to use. If they're not already in app/assets/javascripts/application.js by default, add this line:

    //= require mongoid_rails_search

For mongoid_rails_search UI, If they're not already in app/assets/javascripts/application.css by default, add this lines:


    *= require mongoid_rails_search

Simple example:
    
In your app/views/users/index.html.erb page add this line:
    
    <%= search_form(User, [:email, :confirmed_email, :subscribe_on_news, :role, :created_at]) %> 
    
First param (Classname param)   - your model (In my case is the model: User) 

Second param (Array param)      - which fields we use for search ([:email, :confirmed_email, :subscribe_on_news, :role, :created_at])

In your class UserController add these line: 
     
     @users = search_request
     return if @users

Default action:
    
     def index
         @users = User.all
     end
     
After adding search:

     def index
        @users = search_request
        return if @users
        @users = User.all
     end

search_form helper can handle additional parameters: class, method, url.

    class - html class for search form, default 'width_full'
    method - html method for search form, default 'get'
    url - html action url, by default this url gets from 'params[:controller]'

For change url, class, method add these line:  

   <%= search_form(User, [:email, :confirmed_email, :subscribe_on_news, :role, :created_at], 
                    url: search_users_path, class: 'my_css_class', method: 'post') %>
                                          
Don't forget after change url add new route to routes.rb 
Example:
    
    resources :users do
      collection do
          post :search
      end
    end

Good luck.
                                     
## Contributing

This is test gem.  