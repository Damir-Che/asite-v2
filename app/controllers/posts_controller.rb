class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]) # для отображение тэгов
    else
      @posts = Post.published
    end
  end

  def show
  end

  def new
    @post = Post.new
  end


    def create
      @post = current_user.posts.new(post_params)
      if @post.save
        flash[:success] = 'Статья создана!'
        redirect_to @post
      else
        flash.now[:error] = 'Статья не создана'
        render :new
      end
    end


  def edit
  end

  def update
    @post.update_attributes(post_params)
    if @post.save
      flash[:success] = 'Статья обновлена!'
      redirect_to @post
    else
      flash.now[:error] = 'Ошибка!'
      render 'edit'
    end
  end


  def destroy
    @post.destroy
    flash[:success] = 'Статья удалена!'
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :tag_list, :status )
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
