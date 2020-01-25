class OrdersController < ApplicationController
  def new
  	@products = Product.all
  	@order = Order.new
  end

  def show

  end

  def create
  	@order = Order.new(order_identifier: SecureRandom.hex(10), total_price: 0)
  	product_id_quantity_map = {}
  	params.each do |k,v|
  		if k.match(/inventory_/)
  			buffer = k.split('_')
  			product_id_quantity_map[buffer[1].to_i] = v.to_i
  		end
  	end

  	products = Product.where(id: product_id_quantity_map.keys).index_by(&:id)
  	product_id_quantity_map.each do |product_id, quantity|
    	@order.total_price = @order.total_price + quantity * products[product_id].price
  	end

    @order.save!
    product_id_quantity_map.each do |product_id, quantity|
    	Product.where(id: product_id).update_all("inventory = inventory - #{quantity}")
    	OrderProduct.create(order_id: @order.id, product_id: product_id, quantity: quantity)
  	end

    redirect_to order_path(@order.id)
  end
end
