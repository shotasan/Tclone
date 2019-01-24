class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def new_redirect
    @list = List.new(content: params[:content])
  end

  def create
    List.create(list_params)
    redirect_to new_list_path
  end

  def show
    @list = List.find_by(id: params[:id])
  end

  def confirm
    @list = List.new(list_params)
  end

  def destroy
    @list = List.find_by(id: params[:id])
    @list.destroy
    redirect_to lists_path
  end

  def edit
    @list = List.find_by(id: params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:content)
  end
end
