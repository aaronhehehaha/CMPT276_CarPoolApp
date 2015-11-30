class PostsController < ApplicationController
  before_action :logged_in_user
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
  #  @posts = Post.all
   @user=current_user
    @posts = Post.paginate(page: params[:page])
    @hash = Gmaps4rails.build_markers(@posts) do |post, marker|
    marker.lat post.latitude
    marker.lng post.longitude
    marker.infowindow post.Address

  end
 
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @user=current_user
  end

  # GET /posts/new
  def new
    @user = current_user
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = "Post created!"
      redirect_to current_user
      #format.html { redirect_to @post, notice: 'Post was successfully created.' }
      #format.json { render :show, status: :created, location: @post }
    else
      @user=current_user
      render 'new'
      #format.html { render :new}
      #format.json { render json: @post.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    flash[:success] = "post deleted"
    redirect_to :back

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:Address,:destination, :MonStartTime, :MonEndTime,
      :TueStartTime, :TueEndTime, :WenStartTime, :WenEndTime, :ThuStartTime, :ThuEndTime,
       :FriStartTime, :FriEndTime, :Content,:latitude,:longitude)
    end

    def user_params
      params.require(:user).permit(:firstname,:lastname, :email,:password,:password_confirmation)
    end

end
