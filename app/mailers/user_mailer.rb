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

