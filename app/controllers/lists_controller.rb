class ListsController < ApplicationController
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
    @list = List.find_by(id: params[:id])
  end

  def confirm
    @list = List.new(list_params)
  end

  def destroy
    @list = List.find_by(id: params[:id])
    @list.destroy
    redirect_to lists_path, notice:"削除しました。"
  end

  def edit
    @list = List.find_by(id: params[:id])
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
end
