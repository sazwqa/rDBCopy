class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    if @user.valid?
      
      # switch DB
      if @user.save_to_production == '1'
        begin
          puts "(1) conecting to production DB"
          ActiveRecord::Base.establish_connection(:production)
          puts "(2) conected to production DB"
        rescue
          puts "(1) couldn't connect to production DB, connecting back to development DB"
          ActiveRecord::Base.establish_connection(:development)
          puts "(2) conected to development DB"
        end
      end
      
      # save on development/production DB
      @user.save!
      
      # switch DB back
      if @user.save_to_production == '1'
        puts "(3) conecting back to development DB"
        ActiveRecord::Base.establish_connection(:development)
        puts "(4) conected to development DB"
      end
      
      # flash & redirect
      if @user.save_to_production == '1'
        flash[:notice] = "User was successfully created on production DB id##{@user.id}"
        redirect_to(users_url)
      else
        flash[:notice] = 'User was successfully created.'
        redirect_to(@user)
      end
      
    else
      render :new
    end
    
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
