class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :edit, :update, :destroy]

  # GET /friends
  # GET /friends.json
  def index
    # @friends = Friend.all
    @user = Appid.find_by_session(session.id)

    if @user == nil #if it's a new app, save into "Appid"
      #redirect_to "?app=" + session.id
      @user = Appid.new
      @user.session = session.id
      @user.save
      puts "New user created! (new session id)"
      puts @user
    end

    #build view so you only see what's relevant to the user 
    @friends = Array.new

    if @user.spaceids != [] #only if not empty
      @user.spaceids.each do |p| #iterate though each value of the array to build the friend
        puts "p: "
        puts p
        @friends.push(Friend.find(p))
        puts "@Friends"
        puts @friends
      end
    end

  end

  # GET /friends/1
  # GET /friends/1.json
  def show
    
  end

  
  # GET /friends/new
  def new
    @friend = Friend.new
  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends
  # POST /friends.json
  def create
    @friend = Friend.new(friend_params)

    # puts "In Friends controller: create"
    # puts @friend.avatar.url(:medium)

    @friend.save
    friend_id = @friend.id

    @user = Appid.find_by_session(session.id)
    @user.spaceids.push(friend_id)
    @user.save

    respond_to do |format|
      if @friend.save
        format.html { redirect_to root_path, notice: 'Success! Add more rooms or press submit below.' }
        format.json { render action: 'show', status: :created, location: @friend }
      else
        format.html { render action: 'new' }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end

    
   
  end

  # PATCH/PUT /friends/1
  # PATCH/PUT /friends/1.json
  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to @friend, notice: 'Friend was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    @user = Appid.find_by_session(session.id)
    @user.spaceids = @user.spaceids - [@friend.id]
    @user.save
    @friend.destroy
    respond_to do |format|
      format.html { redirect_to friends_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
        @friend = Friend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friend_params
      params.require(:friend).permit(:avatar, :name, :ask)
    end
end
