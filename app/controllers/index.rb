# Only index route, displays the HOMEPAGE only
get '/' do
  # Look in app/views/index.erb
  @tags = Tag.all
  @posts = Post.all
  erb :index
end
