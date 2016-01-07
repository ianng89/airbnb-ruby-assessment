get '/properties' do
	@properties = Property.all
	erb :"static/properties/index"
end

get '/properties/new' do
	erb :"static/properties/new"
end

post '/properties/new' do 
	property = Property.create(prop_name: params[:prop_name], location: params[:location], prop_type: params[:prop_type], occupancy: params[:occupancy], price: params[:price], details: params[:details], user_id: session[:user_id])
	if property.save
		redirect '/properties'
	else
		redirect 'fail'
	end
end

get '/properties/:prop_id' do
	@property = Property.find(params[:prop_id])
	@comment = @property.comments
	erb :"static/properties/single"
end

get '/properties/:prop_id/edit' do
	@property = Property.find(params[:prop_id])
	erb :"static/properties/edit"
end

post '/properties/:prop_id/edit' do
	@property = Property.find(params[:prop_id])
	@property.update(prop_name: params[:prop_name], location: params[:location], prop_type: params[:prop_type], occupancy: params[:occupancy], price: params[:price], details: params[:details])
	redirect "/properties/#{params[:prop_id]}"
end

get '/properties/:prop_id/delete' do
	@property = Property.find(params[:prop_id])
	erb :"static/properties/delete"
end

post '/properties/:prop_id/delete' do
	@property = Property.find(params[:prop_id])
	@property.destroy
	redirect "/properties"
end
