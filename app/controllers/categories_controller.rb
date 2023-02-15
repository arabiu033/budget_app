class CategoriesController < ApplicationController
  def index
    @categories = Category.all.where('user_id = ?', User.first)
  end

  def show
    @category = Category.find(params[:id])
    @services = @category.all_services
    @total_sum = @category.totalSum
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    @category.user = User.first
    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: "#{@category.name} was successfully created." }
      else
        flash[:error] = @category.errors.full_messages
        format.html { redirect_to new_category_path }
      end
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon, :description)
  end
end
