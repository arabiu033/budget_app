class ServicesController < ApplicationController
  def new
    @service = Service.new
    @category = Category.find(params[:category_id])
  end

  def create
    @service = Service.create(service_params)
    @service.user = current_user
    @category = Category.find(params[:category_id])
    respond_to do |format|
      if @service.save
        ServiceCategory.create(service: @service, category: @category)
        format.html { redirect_to category_path(@category), notice: "#{@service.name} was successfully created." }
      else
        flash[:error] = @service.errors.full_messages
        format.html { redirect_to new_category_service_path(@category) }
      end
    end
  end

  private

  def service_params
    params.require(:service).permit(:name, :amount)
  end
end
