class ListItemsController < ApplicationController
  load_and_authorize_resource

  def create
    if @list_item.save
      redirect_to list_path(@list_item.list) and return
    else
      flash[:error] = @list_item.errors.full_messages.to_sentence
      redirect_to list_path(@list_item.list)
    end
  end

  def update
    if @list_item.update_attributes(list_item_params)
      redirect_to list_path(@list_item.list) and return
    else
      flash[:error] = @list_item.errors.full_messages.to_sentence
      redirect_to list_path(@list_item.list)
    end
  end

  def destroy
    @list_item.destroy
    redirect_to list_path(@list_item.list)
  end

  def mark_completed
    @list_item.update_columns(completed: true)
    redirect_to list_path(@list_item.list)
  end

  def mark_not_completed
    @list_item.update_columns(completed: false)
    redirect_to list_path(@list_item.list)
  end

  private

  def list_item_params
    params.require(:list_item).permit(:list_id, :task, :completed)
  end
end