class CashRegister

    attr_accessor :total, :items, :last_item

    attr_reader :discount


    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title,price,quantity=1)
        self.total += price*quantity
        @last_item = price*quantity
        quantity.times do
            self.items << title
        end

    end

    def apply_discount
        if self.discount
            self.total *= (1 - (self.discount.to_f/100))
            return "After the discount, the total comes to $#{self.total.to_int}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.last_item
        if total == 0.0
            return 0.0
        end
    end


end
