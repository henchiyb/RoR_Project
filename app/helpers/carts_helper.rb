module CartsHelper
  def current_order
      Order.find(session[:order_id])
    rescue ActiveRecord::RecordNotFound
      session.delete :order_id
      Order.new(user_id: session[:user_id],order_status_id: "1")
  end
end
