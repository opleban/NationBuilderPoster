require 'sinatra/base'
require 'sinatra/cross_origin'
require 'nationbuilder'

class SkeletonNBApp < Sinatra::Base

	post '/people' do
		cross_origin
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