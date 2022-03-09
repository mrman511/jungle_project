class CartsController < ApplicationController

  def show
    if enhanced_cart.length == 0
      @msg = "your cart is currently empty"
      flash_class(notice, @msg)
    end
  end

  def add_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, +1)

    redirect_to :back
  end

  def remove_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, -1)

    redirect_to :back
  end

  private

  def modify_cart_delta(product_id, delta)
    cart[product_id] = (cart[product_id] || 0) + delta
    cart.delete(product_id) if cart[product_id] < 1
    update_cart cart
  end

  def flash_class(level, msg)
    bootstrap_alert_class = {
    "success" => "alert-success",
    "error" => "alert-danger",
    "notice" => "#{msg}",
    "alert" => "alert-danger",
    "warn" => "alert-warning"
  }
  end

end
