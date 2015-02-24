require 'sinatra/base'
require 'nationbuilder'

class SkeletonNBApp < Sinatra::Base
	before do
    	response.headers["Access-Control-Allow-Origin"] = "*"
    	response.headers["Access-Control-Allow-Methods"] = "POST"
    	p response.headers.inspect
  	end

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