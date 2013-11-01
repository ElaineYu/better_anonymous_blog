# SHOW ME ALL POSTS WITH A GIVEN TAG

get '/:tag_name' do
	@tag = Tag.find_by_name(params[:tag_name])
	# @tag = Tag.where("name = ?", params[:tag_name]) #tag object

	#Example in rake console
	# Tag.where("name = ?", "physics")
	#OR
	# Tag.where(name: "physics")
	# @tag_id = @tag.first.id #integer

	#join table query

	@tag_posts = @tag.posts

	# @tag_posts = Post.joins(:tags).where(id: @tag_id)
	# @item = Post.find(params[:item_id])


	erb :tag_posts
end

