class ListsController < ApplicationController
  load_and_authorize_resource

  def index
    @lists = current_user.lists
  end

  def create
    @list.user = current_user
    if @list.save
      redirect_to @list
    else
      flash[:error] = @list.errors.full_messages.to_sentence
      redirect_to lists_path
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :user_id)
  end
end
