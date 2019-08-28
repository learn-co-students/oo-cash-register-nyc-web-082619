require "pry"
class CashRegister 
  attr_accessor :total, :discount, :items, :last_transaction  
  
  def initialize(discount=0)
    @total = 0 
    self.discount = discount
    @items = []
  end
  
  def add_item(title, price, quantity=1)
    @total = @total + (price*quantity)
    quantity.times do
      @items.push(title)
    @last_transaction = [title, price, quantity]
    end 
  end
  
  
  def void_last_transaction
    @total = @total - (@last_transaction[1]*last_transaction[2])
    @last_transaction[2].times do 
      @items.delete(last_transaction[0])
    end
  end
  

  
  def apply_discount
    if @discount>0
    discount_amount = (@discount/100.00)*@total 
    @total = @total - discount_amount
    return "After the discount, the total comes to $#{total.to_i}."
    else 
      return "There is no discount to apply."
    
  end
  
end
  
end 
