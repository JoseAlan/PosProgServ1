Rails.application.routes.draw do
  namespace :api do
  	namespace :v1 do
  		get "hello",to: "products#hello_world"
  		get "products", to:"products#list"
  		post "products", to:"products#create"
  	 end
  	end
end
