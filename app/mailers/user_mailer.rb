class UserMailer < ApplicationMailer

    def post_notification(user_id, total_price, product_ids)
        @user = User.find(user_id)
        @product_ids = product_ids.split(" ")
        @total_price = total_price
        @list_of_products = get_products(@product_ids)
        
        mail(to: @user.email, subject: 'Boleta de compra en E-commerce')
    end

    private
    def get_products(product_ids)
        list_of_products = []

        product_ids.each do |id|
            article = Article.find(id)
            list_of_products << article.to_json
        end

        list_of_products
    end

end


# {"id":3,"title":"Notebook Asus Tuf",
#     "description":"Salta directamente a la acción con la computadora portátil para juegos TUF Gaming F15, aprovechando el rendimiento completo de juego de la GPU GeForce RTX 3060 con un interruptor MUX dedicado y una CPU Intel Core i7-12700 de 12a generación.",
#     "price":1500000,
#     "image_url":"https://m.media-amazon.com/images/I/81Q-FwBZyYL._AC_SL1500_.jpg","created_at":"2023-06-26T00:54:57.694Z","updated_at":"2023-06-26T00:54:57.694Z"}

