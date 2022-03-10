class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = category.new(category_params)

    if @product.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def destroy
    @category = Categories.find params[:id]
    @category.destroy
    redirect_to [:admin, :categories], notice: 'Category deleted!'
  end

  private

  def catagory_params
    params.require(:category).permit(
      :name
    )
  end
end
