get '/properties/:prop_id/booking/new' do
	@property = Property.find(params[:prop_id])
	@comment = @property.comments
	erb :"static/bookings/new"
end

post '/properties/:prop_id/booking/new' do
	@property = Property.find(params[:prop_id])
	booking = Booking.create(user_id: session[:user_id], property_id: @property.id, start_date:params[:start_date], end_date: params[:end_date], num_of_days: params[:num_of_days], total_price: params[:total_price])
	booking.save
	redirect '/'
end

get '/user/:user_id/bookings' do

	@booking = Booking.where(user_id: params[:user_id])
	erb :"static/bookings/index"
end

get '/user/:user_id/bookings/:booking_id/edit' do

	@booking = Booking.find(params[:booking_id])
	erb :"static/bookings/edit"
end

post '/user/:user_id/bookings/:booking_id/edit' do

	@booking = Booking.find(params[:booking_id])
	@booking.update(start_date: params[:start_date], end_date: params[:end_date], num_of_days: params[:num_of_days], total_price: params[:total_price])
	redirect '/'
end

get '/user/:user_id/bookings/:booking_id/delete' do
	@booking = Booking.find(params[:booking_id])
	erb :"static/bookings/delete"
end

post '/user/:user_id/bookings/:booking_id/delete' do
		@booking = Booking.find(params[:booking_id])
		@booking.destroy
		redirect "/user/#{params[:user_id]}/bookings"
end