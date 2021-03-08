class SubsController < ApplicationController

  before_action :require_moderator, only:[:edit]

  def edit
    @sub = find_by(id: params[:id])
    render :edit
  end

  

end
