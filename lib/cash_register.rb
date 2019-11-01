require 'pry'
class CashRegister
    
    attr_accessor :discount, :total, :last_transaction
    
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @cart = []
    end

    def add_item(item, price, quantity=1)
       @total += price*quantity
        quantity.times do
            @cart << item
        end
        @last_transaction = price * quantity
 
    end

    def apply_discount
        if @discount != 0
            @total = @total - (@total*(@discount)/100)
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @cart
    end

    def void_last_transaction
        @total -= @last_transaction
    end
end