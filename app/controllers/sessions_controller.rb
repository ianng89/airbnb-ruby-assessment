#login
post '/session/new' do 

	if user = User.authenticate(params[:email], params[:password]) 
	  session['user_id'] ||= user.id
		redirect '/success' 
	else 
	    redirect '/fail'
  	end
end

#logout
post '/session/destroy' do
	session['user_id'] = nil
	redirect '/'
end