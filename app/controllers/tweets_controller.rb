class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :require_user,only:[:new,:create,:friends_tweets]

  # GET /tweets
  # GET /tweets.json
  def friends_tweets
    @tweets=[]
    @friends=@current_user.friends
    
    @friends.each do |friend|
      user=User.find(friend.id)
      @tweets+=user.tweets
    end
    @tweets=@tweets.sort{|a,b| a<=>b}
    @tweets.reverse!
    
  end

  def index
    if params[:user]
      @tweets = User.find(params[:user]).tweets.order('created_at DESC')
      @user=User.find(params[:user])
      @title='Showing All Tweets By '+@user.username

    else
      @tweets=Tweet.order('created_at DESC')
    end
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
   # @tweet = Tweet.new
    @tweet = @current_user.tweets.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets
  # POST /tweets.json
  def create
    #@tweet = Tweet.new(tweet_params)
    @tweet = @current_user.tweets.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to user_path(session[:user_id])}
        format.json { render :show, status: :created, location: @tweet }
        flash[:noticee]= 'Tweet was successfully created.'
      else
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet}
        format.json { render :show, status: :ok, location: @tweet }
        flash[:noticee]= 'Tweet was successfully updated.'

      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to user_path(session[:user_id])}
      format.json { head :no_content }
      flash[:noticee]= 'Tweet was successfully deleted.'
    end
  end

  def fullsize_image
    @tweet=Tweet.find(params[:tweet])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:title, :content,:image)
    end
end
