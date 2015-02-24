require 'sinatra/base'
require 'nationbuilder'
require 'rack/cors'

class SkeletonNBApp < Sinatra::Base
	register Sinatra::CrossOrigin
	use Rack::Cors do
		allow do
			origins '*'
			resource '/people',
				methods: [:post],
			end
		end

		allow do 
			origins '*'
			resource '/people',
			methods: [:post]
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