class SubsController < ApplicationController

  before_action :require_moderator, only:[:edit, :update]

  def edit
    @sub = find_by(id: params[:id])
    render :edit
  end

  def require_moderator
    if current_user.subs.find_by(id: params[:id])
      return 
    else
      render json: 'Forbidden'
    end
  end
  
  def new
    @sub = Sub.new
    render :new
  end

  def update
    
  end

  def create
    @sub = Sub.new(sub_params)

    @sub.moderator_id = current_user.id

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def index
    @subs = Sub.all
    render :index
  end

  def show
    @sub = Sub.find_by(id: params[:id])
    render :show
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
