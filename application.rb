require 'sinatra/base'
require 'nationbuilder'

class SkeletonNBApp < Sinatra::Base
	register Sinatra::CrossOrigin

	before do
  		if request.request_method == 'OPTIONS'
    		response.headers["Access-Control-Allow-Origin"] = "lacity-staging.demo.socrata.com"
    		response.headers["Access-Control-Allow-Methods"] = "POST"
    		halt 200
		end
	end

	post '/people' do
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