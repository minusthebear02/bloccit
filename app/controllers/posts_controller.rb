class PostsController < ApplicationController

  before_action :require_sign_in, except: :show
  before_action :find_post, except: [:index, :new, :create]
  before_action :can_update, only: [:edit, :update, :new, :create]
  before_action :can_delete, only: [:destroy]

  def show
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(post_params)
    @post.user = current_user

    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
  end

  def update
    @post.assign_attributes(post_params)

    if @post.save
      flash[:notice] = "Post was updated."
      redirect_to [@post.topic, @post]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
      redirect_to @post.topic
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

  def can_update
    unless current_user.admin? || current_user.moderator? || current_user == @post.user
      flash[:alert] = "You must be an admin or moderator to do that."
      redirect_to topics_path
    end
  end

  def can_delete
    unless current_user.admin? || current_user == @post.user
      flash[:alert] = "You must be an admin to do that."
      redirect_to topics_path
    end
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
