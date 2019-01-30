class ListsController < ApplicationController
  before_action :set_list, only: [:show,:destroy,:edit]
  
  def index
    @lists = List.all
    @list = List.new
  end

  def new
    @list = List.new
  end

  def new_redirect
    @list = List.new(content: params[:content])
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path, notice:"投稿しました。"
    else
      render"new"
    end
  end

  def show
  end

  def confirm
    @list = List.new(list_params)
    render"new" if @list.invalid?
  end

  def destroy
    @list.destroy
    redirect_to lists_path, notice:"削除しました。"
  end

  def edit
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to lists_path, notice:"編集しました。"
    else
      render "edit"
    end
  end

  private

  def list_params
    params.require(:list).permit(:content)
  end

  def set_list
    @list = List.find_by(id: params[:id])
  end
end
