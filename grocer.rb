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
      end
      if cart[coupon[:item]][:count] >= coupon[:num]
        apply_coupons
    end
  end
  cart
end

#cart is a hash with 2 keys with a nested hash with 3 values
  #coupons is an array with a hash with 3 keys and 3 values
  #if coupons[0].values.include?(cart.keys[0]) will find avocado in coupon
  #coupons[0].values[0] is AVOCADO in coupon
  #cart.keys[0] is AVOCADO in cart
  #coupons[0].values[0] + " W/COUPON" creates "AVOCADO W/COUPON"
  #coupons[0].values[1] = 2 the number of coupons
  #coupons[0].values[2] = 5.0 which is the number off need to be divded by 2(number of coupons

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
