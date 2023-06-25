class CartsController < ApplicationController

    def show
        @carts = Cart.all
        render json: @carts
    end

    def create
        @cart = Cart.new(cart_params)

        puts "params"
        puts "#{params[:product_ids]}"

        if @cart.save
            render json: @cart, status: :ok
        else
            render json: @cart.errors, status: :unprocessable_entity
        end
    end

    private
    def cart_params
        params.require(:cart).permit(:user_id, :total_price, :product_ids)
    end

end
