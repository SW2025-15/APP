class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    
    if @post.save
      # 保存成功でshow画面へ
      redirect_to @post, notice: "投稿が完了しました。"
    else
      # 保存失敗で、new画面を再表示+エラーメッセージ
      render :new, status: :unprocessable_entity 
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :body, :status, images: [])
  end
  
  
end
