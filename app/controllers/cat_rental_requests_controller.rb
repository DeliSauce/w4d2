class CatRentalRequestsController < ApplicationController

    # def index
    #   @cat_rental_request = CatRentalRequest.all
    #   render :index
    # end

    # def show
    #   @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
    #   render :show
    # end

    def new
      @cats = Cat.all
      @cat_rental_request = CatRentalRequest.new
      render :new
    end

    def create
      @cat_rental_request = CatRentalRequest.new(cat_rental_request_param)
      if @cat_rental_request.save
        redirect_to cat_url(@cat_rental_request)
      else
        render :new
      end
    end

    # def edit
    #   @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
    #   if @cat_rental_request
    #     render :edit
    #   else
    #     redirect_to new_cat_url
    #   end
    # end

    # def update
    #   @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
    #   if @cat_rental_request.update_attributes(cat_rental_request_param)
    #     redirect_to cat_url(@cat_rental_request)
    #   else
    #     render :edit
    #   end
    # end


    private

    def cat_rental_request_param
      params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
    end

end
