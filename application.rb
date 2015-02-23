require 'sinatra/base'
require 'nationbuilder'

class SkeletonNBApp < Sinatra::Base

	post '/people' do
	    content_type :json
	 
	    nb_client = NationBuilder::Client.new('dtla', 'mytoken')
	    post_data = {
	      person: {
	        email: params[:email],
	        tags: ["compiler", "compilerla website signup"]
	      }
	    }
	 
	    nb_client.call(:people, :create, post_data).to_json
	end
end