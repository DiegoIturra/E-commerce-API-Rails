require 'mercadopago'

class MercadoPagoController < ApplicationController

    def create_preferences
        sdk = Mercadopago::SDK.new('TEST-6321677395685821-062700-34986bef4de426a90f7732ef973c53d4-349547927')
        products = params[:_json]
        items = []

        products.each do |product|
            item = {}

            item[:title] = product[:title]
            item[:unit_price] = product[:price]
            item[:description] = product[:description]
            item[:quantity] = product[:quantity]
            item[:currency_id] = 'CLP'

            items << item
        end

        preference_data = {
            items: items,
            back_urls: {
                success: "http://localhost:3000/",
                failure: "http://localhost:3000/"
            },
            auto_return: "approved",
            payer: {
              email: 'diego@gmail.com'
            }
        }
          
        preference_response = sdk.preference.create(preference_data)
        preference = preference_response[:response]

        render json: preference
    end

end
