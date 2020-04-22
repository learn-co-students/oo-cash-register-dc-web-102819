class CashRegister
    attr_accessor :total, :title, :price, :discount, :item, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @item = []
    end

    def add_item(title, price, quantity = 1)
        self.total += ((price.to_f) * quantity)
        quantity.times do
            item << title
        end
        self.last_transaction = price * quantity
    end

    def apply_discount
        if self.discount == 0
           "There is no discount to apply."
        else
            self.total -= (self.total *= (self.discount/100.to_f))
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def items
        self.item
    end

    def void_last_transaction
        self.total = self.total - self.last_transaction
    end

end