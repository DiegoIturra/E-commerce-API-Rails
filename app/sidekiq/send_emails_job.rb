class SendEmailsJob
  include Sidekiq::Job

  def perform(*args)

    user_id = args[0]
    total_price = args[1]
    product_ids = args[2]

    puts user_id ,total_price ,product_ids

    UserMailer.post_notification(user_id, total_price, product_ids).deliver_later
  end
end
