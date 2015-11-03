class FoodItemsController < ApplicationController
before_action :set_fooditem, only: [:show, :edit, :update, :destroy]

  def index
    @fooditems = FoodItems.all
  end

  def show
    @fooditems = FoodItem.find(params[:id])
  end

  def new
    @fooditem = FoodItem.new
  end

  def edit
    @fooditem = FoodItem.find(params[:id])
  end

  def create
      @fooditem = FoodItem.new(fooditem_params)

      respond_to do |format|
        if @fooditem.save
          format.html { redirect_to @fooditem, notice: 'Food item was successfully created.' }
          format.json { render :show, status: :created, location: @fooditem }
        else
          format.html { render :new }
          format.json { render json: @fooditem.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /products/1
    # PATCH/PUT /products/1.json
    def update
      respond_to do |format|
        if @fooditem.update(fooditem_params)
          format.html { redirect_to @fooditem, notice: 'Food item was successfully updated.' }
          format.json { render :show, status: :ok, location: @fooditem }
        else
          format.html { render :edit }
          format.json { render json: @fooditem.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /products/1
    # DELETE /products/1.json
    def destroy
      @fooditem.destroy
      respond_to do |format|
        format.html { redirect_to fooditems_url, notice: 'Food item was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_fooditem
        @fooditem = FoodItem.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def fooditem_params
        params.require(:food_item).permit(:title, :description, :price, :city, pictures_attributes: [:url, :alt])
      end
  end
