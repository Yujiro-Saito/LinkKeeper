class LinksController < ApplicationController

  before_action :set_link, only: [:show, :edit, :update, :destroy]

  def index
    @links = Link.all
  end

  def show
  end

  def create
    @link = Link.new(link_params, params[:folder_id])
    if @link.save
      redirect_to @link
    else
      render 'new'
    end
  end

  def new
    @link = Link.new(folder_id: params[:folder_id])
  end

  def edit
  end

  def update
    if @link.update(link_params)
      redirect_to @link
    else
      render 'edit'
    end
  end

  def destroy
    @link.destroy
    redirect_to folders_path
  end


  private

  def link_params
    params.require(:link).permit(:name, :url,:folder_id)
  end

  def set_link
    @link = Link.find(params[:id])
  end





end
