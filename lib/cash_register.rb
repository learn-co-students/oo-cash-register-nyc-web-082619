require "pry"
class CashRegister
    attr_accessor :discount, :total
    
    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @new_item_array = []
    end

    def add_item(item, price, quantity=1)
        @item = item
        @price = price * quantity
        @total += @price
        @quantity = quantity
        count = 0
        until count == quantity
            @new_item_array << @item 
         count += 1
        end

    end

    def apply_discount
        if discount > 0 
            @total -= (@total *  (@discount/100.00)).to_i
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

   def items
    @new_item_array
    end

    def void_last_transaction
        @total -= @price 
    end
end
