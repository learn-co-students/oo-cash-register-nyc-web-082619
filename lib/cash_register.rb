class CashRegister
  attr_accessor :discount, :total
  attr_reader :items

  
  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @transaction_stack = []
  end
  
  def add_item(item, price, quantity=1)
    @total += price*quantity
    add_to_items(item, quantity)
    add_to_transaction_stack(item, price,quantity)
    @items
  end
  
  def add_to_transaction_stack(item, price,quantity)
    @transaction_stack.push([item, price, quantity])
  end
      
  def add_to_items(item, quantity)
    (1..quantity).each do
      @items.push(item)
    end
  end
  
  def void_last_transaction
    void_transaction = @transaction_stack.pop
    item = void_transaction[0]
    price = void_transaction[1]
    quantity = void_transaction[2]
    
    
    @total -= price*quantity
    (1..void_transaction[2]).each do
      @items.pop
    end
  end
  
  def apply_discount
    if(@discount == 0)
      return "There is no discount to apply."
    end
    @total = @total * (100-@discount) / 100.00
    "After the discount, the total comes to $#{@total.round(0)}."
  end
end

