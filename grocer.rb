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

#
#  def apply_coupons(cart, coupons)
#    cart.each do |food, info|
#      coupons.each do |coupon|
#        if cart.keys.include?(coupon[:item])
#          if food == coupon[:item] && cart[coupon[:item]][:count] >= coupon[:num]
#            itemwithCoupon = "#{coupon[:item]} W/COUPON"
#            if cart[itemwithCoupon]
#              cart[itemwithCoupon][:count] += coupon[:num]
#              cart[coupon[:item]][:count] -= coupon[:num]
#            else
#              cart[itemwithCoupon] = {}
#              cart[itemwithCoupon][:price] = (coupon[:cost] / coupon[:num])
#              cart[itemwithCoupon][:clearance] = cart[coupon[:item]][:clearance]
#              cart[itemwithCoupon][:count] = coupon[:num]
#              cart[coupon[:item]][:count] -= coupon[:num]
#            end
#         end
#       end
#       if cart[coupon[:item]][:count] >= coupon[:num]
#         apply_coupons
#       end
#     end
#   end
#   cart
# end



 def apply_coupons(cart, coupons)
  # code here	  result = {}
  # code here#
  cart.each do |food, info|
    coupons.each do |coupon|
      if food == coupon[:item] && info[:count] >= coupon[:num]
        info[:count] =  info[:count] - coupon[:num]
        if result["#{food} W/COUPON"]
          result["#{food} W/COUPON"][:count] += 1
        else
          result["#{food} W/COUPON"] = {:price => coupon[:cost], :clearance => info[:clearance], :count => 1}
        end
      end
    end
    result[food] = info
  end
  result
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
