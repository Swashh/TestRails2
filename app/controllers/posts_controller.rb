class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def edit
    @category = Category.find(params[:category_id])
    @post = @category.posts.edit(post_params)
    redirect_to category_path(@category)
  end

  def create
    @category = Category.find(params[:category_id])
    @post = @category.posts.create(post_params)
      if @post.save
        redirect_to category_path(@category)
      else
        render 'new'
    end
  end
  def update
    @category = Category.find(params[:category_id])
    @post = @category.posts.update(post_params)
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end
end
