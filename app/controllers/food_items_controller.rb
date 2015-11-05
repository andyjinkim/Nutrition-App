class FoodItemsController < ApplicationController
before_action :set_fooditem, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    if params[:q]
     @fooditems = @user.food_items.where(:consumed_date => params[:q].to_date)
   else
     @fooditems = @user.food_items.all
   end
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
    @user = current_user
    @fooditem = @user.food_items.new(food_item_params)
    @fooditem.user_id = @user.id
    if @fooditem.save
      redirect_to food_items_path
    else
      render 'new'
    end
  end

    # PATCH/PUT /products/1
    # PATCH/PUT /products/1.json
    def update
      respond_to do |format|
        if @fooditem.update(food_item_params)
          format.html { redirect_to @fooditem, notice: 'Food item was successfully updated.' }
          format.json { render :show, status: :ok, location: @fooditem }
        else
          format.html { render :edit }
          format.json { render json: @fooditem.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @fooditem = FoodItem.find(params[:id])
      if @fooditem.destroy
        redirect_to food_items_path
      else
        render 'index'
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_fooditem
        @fooditem = FoodItem.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def food_item_params
        params.require(:food_item).permit(:name, :calories, :sugar, :sodium, :protein, :consumed_date)
      end
    end
