require 'pry'

class CashRegister
    attr_reader :total, :discount, :items, :price, :last_price, :last_quantity

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_quantity
    end

    def total=(total)
        @total = total
    end

    def add_item(title, price, quantity = 0)
        if quantity > 0
            @total += (price * quantity)
        else
            @total += price
        end
        i=1
        while i < quantity
        
            @items << title
            i += 1
        end

        @items << title
         @last_price = price
         @last_quantity = quantity

    end

    def apply_discount
        if @discount > 0
            @total = @total - @total * @discount/100
            p "After the discount, the total comes to $#{@total}."
        else
            p "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
    if @last_quantity <1 
        @total -= @last_price
    else
      @total = @total - (@last_price * @last_quantity)
    end


    end


end

# binding.pry
