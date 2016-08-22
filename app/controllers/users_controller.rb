class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  before_action :require_user,only:[:request_friend,:accept_friend,:remove_friend]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def login
  end

  def login_user
    @user=User.find_by(username: params[:username])

    #Checks if unincripted password entered matches encripted password saved in database
    if @user && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      session[:username]=@user.username
      redirect_to tweets_path
    else
      redirect_to login_path
      flash[:fail]='Incorrect email or password'
    end
end

  def logout
    session[:user_id]=nil
    redirect_to users_path
    reset_session
    flash[:logout]='You Have Logged Out'
    end  

  def request_friend
    @user = User.find(params[:id])
    @friending_user=User.find(@current_user)
    @friending_user.friend_request(@user)
    redirect_to user_path(@friending_user)
  end  

  def accept_friend
    @user=User.find(params[:id])
    @friending_user=User.find(@current_user)
    @friending_user.accept_request(@user)
    redirect_to user_path(@friending_user)
  end

  def remove_friend
    @user=User.find(params[:id])
    @friending_user=User.find(@current_user)
    @friending_user.remove_friend(@user)
    redirect_to user_path(@friending_user)
  end
    

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :first_name, :last_name,:password,:password_confirmation,:requested_friends,:pending_friends,:friends)
    end
end
