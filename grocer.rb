def consolidate_cart(cart)
  # code here
  cart_hash = {}
  cart.each do |item|
    item.each do |name, data|
      if !cart_hash[name]
        cart_hash[name] = data
        cart_hash[name][:count] = 1
      else
        cart_hash[name][:count] +=1
      end
    end
  end
  cart_hash
end


 def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    if cart.keys.include?(coupon[:item])
      if cart[coupon[:item]][:count] >= coupon[:num]
        itemwithCoupon = "#{coupon[:item]} W/COUPON"
          if cart[itemwithCoupon]
          cart[itemwithCoupon][:count] += coupon[:num]
          cart[coupon[:item]][:count] -= coupon[:num]
        else
          cart[itemwithCoupon] = {}
          cart[itemwithCoupon][:price] = (coupon[:cost] / coupon[:num])
          cart[itemwithCoupon][:clearance] = cart[coupon[:item]][:clearance]
          cart[itemwithCoupon][:count] = coupon[:num]
          cart[coupon[:item]][:count] -= coupon[:num]
      end
      end
      cart.each do |item|
      if cart[item] == coupon[:item] && cart[coupon[:item]][:count] >= coupon[:num]
        apply_coupons
      end
      end
    end
  end
  cart
end



def apply_clearance(cart)
  # code here
  cart.each do |item, item_info|
    if cart[item][:clearance]
      cart[item][:price] = (cart[item][:price]* 0.8).round(1)
    end
  end
  cart
end

def checkout(cart, coupons)
  # code here
  consolidate_cart
  apply_coupons
  apply_clearance
  consolidate_cart
end
