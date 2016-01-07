post '/properties/:prop_id/comment' do
	@comment = Comment.create(user_id: session[:user_id], comment_text: params[:comment_text], rating: params[:rating], property_id: params[:prop_id])
	if @comment.save
		redirect "properties/#{params[:prop_id]}"
	else
		redirect 'fail'
	end
end

get '/properties/:prop_id/comment/:comment_id/edit' do
	@property = Property.find(params[:prop_id])
	@comment = Comment.find(params[:comment_id])
	erb :"/static/comments/edit"
end

post '/properties/:prop_id/comment/:comment_id/edit' do
	@property = Property.find(params[:prop_id])
	@comment = Comment.find(params[:comment_id])
	@comment.update(rating: params[:rating], comment_text: params[:comment_text])
	redirect "/properties/#{params[:prop_id]}"
end

get '/properties/:prop_id/comment/:comment_id/delete' do
	@property = Property.find(params[:prop_id])
	@comment = Comment.find(params[:comment_id])
	erb :"/static/comments/delete"
end

post '/properties/:prop_id/comment/:comment_id/delete' do
	@property = Property.find(params[:prop_id])
	@comment = Comment.find(params[:comment_id])
	@comment.destroy
	redirect "/properties/#{params[:prop_id]}"
end