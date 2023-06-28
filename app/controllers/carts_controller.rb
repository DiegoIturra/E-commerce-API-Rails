class CartsController < ApplicationController

    def index
        @carts = Cart.all
        render json: @carts
    end

    def show
        @cart = Cart.find(params[:id])
        render json: @cart
    
        rescue ActiveRecord::RecordNotFound
            render json: { error: 'Record not found' }, status: :not_found
    end

    def create
        @cart = Cart.new(cart_params)

        if @cart.save
            #TODO: enviar datos para el correo con Sidekiq
            SendEmailsJob.perform_async(cart_params[:user_id], cart_params[:total_price], cart_params[:product_ids])

            render json: @cart, status: :ok
        else
            render json: @cart.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @cart = Cart.find(params[:id])
        @cart.destroy

        head :no_content
    end

    def destroy_all_carts
        Cart.destroy_all
        head :no_content
    end


    private
    def cart_params
        params.require(:cart).permit(:user_id, :total_price, :product_ids, :product_quantities)
    end

end
