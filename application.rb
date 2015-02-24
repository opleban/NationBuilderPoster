require 'sinatra/base'
require 'nationbuilder'
require 'rack/cors'

class SkeletonNBApp < Sinatra::Base
	register Sinatra::CrossOrigin
	use Rack::Cors do
		allow do
			origins 'lacity-staging.demo.socrata.com', 'data.lacity.org'
			resource '/people',
				methods: [:post],
			end
		end
	end

	post '/people' do
		before do
	  		if request.request_method == 'OPTIONS'
	    		response.headers["Access-Control-Allow-Origin"] = "https://lacity-staging.demo.socrata.com"
	    		response.headers["Access-Control-Allow-Methods"] = "POST"
	    		halt 200
			end
		end
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