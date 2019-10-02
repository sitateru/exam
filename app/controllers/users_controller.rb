class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    render_ok(User.all)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    user = User.new(user_params)

    if user.save
      render_ok(user)
    else
      render_ng(400, user.errors)
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if User.where( id: user_params[:id] ).update( name: user_params[:name], mail_address: user_params[:mail_address] )
      render_ok(user_params)
    else
      render_ng(400, user.errors)
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    #
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      user = User.find(params[:id])

      if user.save
        render_ok(user)
      else
        render_ng(400, user.errors)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :mail_address)
    end
end
