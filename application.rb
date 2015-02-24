require 'sinatra/base'
require 'nationbuilder'

class SkeletonNBApp < Sinatra::Base
	before do
   		content_type :json    
    	headers 'Access-Control-Allow-Origin' => '*', 
           'Access-Control-Allow-Methods' => ['OPTIONS', 'POST'],
           'Access-Control-Allow-Headers' => 'Content-Type'  
	end

	set :protection, false

	post '/people' do
		p params.inspect
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