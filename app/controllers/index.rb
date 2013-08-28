get '/' do
  erb :index
end

get '/cat/:cat_id' do
	@selected_category = Category.find(params[:cat_id])
	p @selected_category
	@posts = Post.where(category_id: @selected_category.id)
	if @posts != []
		erb :post_list
	else
		"No posts."
	end
end

get '/post/:post_id' do
	@post = Post.find(params[:post_id])
	if @post
		erb :post
	else
		"This post doesn't exist."
	end
end

get '/post/:post_id/*' do
	p params
	if params[:edit_key]
		@post = Post.where(edit_key: params[:splat]).first
		erb :post
	elsif params[:splat] != ["edit"]
		post_edit_key = params[:splat].first
		p post_edit_key
		@post = Post.where(edit_key: post_edit_key).first
		erb :post_edit
	else
		@post = Post.find(params[:post_id])
		erb :post
	end

end

get '/post_create' do
	erb :post_create
end

post '/post_create' do
	@post = Post.new(params["post"])
	@post.save!
	redirect to("/post/#{@post.id}/edit?edit_key=#{@post.edit_key}")
end

post '/post_edit' do
	@post.attribute_assignment(params["post"])
	@post.save!
	redirect to("/post/#{@post.id}/edit?key=#{@post.edit_key}")
end