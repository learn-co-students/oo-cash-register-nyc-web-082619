class CashRegister
  attr_reader :cash_register, :discount
  attr_accessor :total, :items, :void_last_transaction
  
  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end
  
  def total
    return @total
  end
  
  def add_item(title, price, quantity = 1)
    @total = total + (price * quantity)
    @quantity = quantity
    @price = price
    while quantity > 0 do
      @items << title
      quantity -= 1
    end
  end
  
  def apply_discount
    if discount > 0
      @total = (total * discount) / 25
      "After the discount, the total comes to $#{total}."
    else 
      "There is no discount to apply."
    end 
  end
  
  def items
    @items
  end
  
  def void_last_transaction 
    @total = total - (@price * @quantity)
  end
end
