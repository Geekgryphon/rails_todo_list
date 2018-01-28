class ListsController < ApplicationController
  before_action :set_list, :only => [:show, :edit, :update, :destroy]


  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create 
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_url
    else
      render :new
    end
  end


  def show 
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    if @list.update_attributes(list_params)
      redirect_to lists_path(@list)
    else
      render :edit
    end
  end

  def destroy
    if @list.can_destroy?
      @list.destroy
      flash[:alert] = 'List was successfully deleted !!'
      redirect_to lists_url
    else
      flash[:alert] = 'List is overdue, can not be deleted !!'
      redirect_to lists_url
    end
    
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :due_date, :note)
  end
end
