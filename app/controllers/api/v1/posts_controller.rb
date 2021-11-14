class Api::V1::PostsController < ApplicationController
  before_action :authenticate_api_v1_user!
  before_action :set_post, except:[:index, :create]

  def index
    @posts = Post.preload(:user)
    render json: @posts, each_serializer: PostSerializer
  end

  def show
    render json: @post
  end

  def create
    user = current_api_v1_user
    post = user.posts.create(
      text: post_params[:text],
      user_id: user.id
    )
    if post
      render json: { data: post }
    else
      render status: 400, json: { data: post.errors }
    end
  end

  def update
    user = current_api_v1_user
    if @post.update(
      text: post_params[:text],
      user_id: user.id
    )
      render json: { data: @post }
    else
      render status: 400, json: { data: @post.errors }
    end
  end

  def destroy
    @post.destroy
    render status: 200, json: { msg: '投稿を削除しました。' }
  end

  private

  def set_post
    @post = Post.find_by(params[:id])
  end

  def post_params
    params.permit(:text)
  end
end
