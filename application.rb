require 'sinatra/base'
require 'nationbuilder'

class SkeletonNBApp < Sinatra::Base

	post '/people' do
	    status 200
	    headers \
		    "Access-Control-Allow-Origin" => "https://lacity-staging.demo.socrata.com",
		    "Accces-Control-Allow-Origin" => "https://data.lacity.org",
		    "Access-Control-Allow-Methods" => "POST",
		    "Access-Control-Allow-Headers" =>  "Content-Type",
		    "Access-Control-Max-Age" => "86400" 
	    content_type :json
	 
	    nb_client = NationBuilder::Client.new('testnation', ENV['NB_API_KEY'])
	    post_data = {
	      person: {
	        email: params[:email],
	        tags: ["compiler", "compilerla website signup"]
	      }
	    }
	 
	    nb_client.call(:people, :create, post_data).to_json
	end
end