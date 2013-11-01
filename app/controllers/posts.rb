# CREATE A POST 
post '/create_post' do 
	@post = Post.find_or_create_by(params[:post])
	@tags = Tag.find_or_create_by(name: params[:tags]) 

	# Shovel tags into post
	@post.tags << @tags
	# Shove post into tags
	# @tags.posts << @post

	@posts = Post.all

	erb :see_post
end

# SHOW ME ALL POSTS
get '/see_all_posts' do
	@posts = Post.all
	erb :see_all_posts
end

# SHOW ME A PARTICULAR POST
get '/:post_title/:post_id' do
	@post = Post.find_by_title(params[:post_title]) # category object
	@post_id = @post.id

	erb :see_single_post
end

# EDIT AN EXISTING POST
get '/:post_title/:post_id/edit' do
	@post = Post.find_by_title(params[:post_title]) # category object
	@post_id = @post.id

	erb :edit_post
end

post'/:post_title/:post_id/edit' do
	@post = Post.find_by_title(params[:post_title]) # category object
	@post_id = @post.id
	@post.update_attributes(params[:post])

	redirect to("/#{@post.title}/#{@post.id}")
end

# DELETE AN EXISITING POST
get '/:post_title/:post_id/delete' do
	@post = Post.find_by_title(params[:post_title]) # category object
	@post_id = @post.id
	@post.destroy

 	redirect to('/see_all_posts')
end


