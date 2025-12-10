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
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy 
    
    redirect_to posts_path, notice: "投稿を削除しました。"
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post, notice: "投稿を編集しました。"
    else
      # 失敗したら編集画面に戻る
      render :edit, status: :unprocessable_entity
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :body, :status, images: [])
  end
  
end
