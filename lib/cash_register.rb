require 'pry'
class CashRegister
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @price = 0 
  end
  
  attr_accessor :total, :discount, :items
  
  def add_item( item, price , quantity = 1 )
    
    count = 1 
    @price = price * quantity
    
    while quantity >= count 
      @items << item
      count += 1 
    end 
    
    self.total += price * quantity
    
  end
  
  def apply_discount 
    
    self.total *= 1 - self.discount/100.to_f
    
    return "After the discount, the total comes to $#{self.total.to_i}." if self.discount > 0
    return "There is no discount to apply."
    
  end
  
  def items
   @items
  end
  
  def void_last_transaction
    
    #return 0.0 if @items.length == 0
    self.total -= @price
    
  end
end