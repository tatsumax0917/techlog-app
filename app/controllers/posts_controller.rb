class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  
  def new
    @post = Post.new
  end
  
  def show
    @post = Post.find_by(id: params[:id])
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = '投稿しました'
      redirect_to root_path
    else
      flash[:alert] = '投稿に失敗しました'
      render :new
    end
  end
  
  private 
  
   def post_params
     params.require(:post).permit(:title, :content)
   end
end