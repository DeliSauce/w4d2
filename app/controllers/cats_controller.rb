class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find_by(id: params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      render :new
    end
  end

  def edit
    @cat = Cat.find_by(id: params[:id])
    if @cat
      render :edit
    else
      redirect_to new_cat_url
    end
  end

  def update
    @cat = Cat.find_by(id: params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      render :edit
    end
  end

  # def destroy
  #   cat = Cat.find_by(id: params[:id])
  #   if cat
  #     cat.delete
  #   else
  #     redirect_to cats_url
  #   end
  # end

  private

  def cat_params
    params.require(:cat).permit(:name, :color, :birth_date, :sex, :description)
  end
end
