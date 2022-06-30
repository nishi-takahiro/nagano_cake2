class CartItem < ApplicationRecord
    has_one_attached :image
    belongs_to :customer
    belongs_to :item
    
    #消費税の計算
    def add_tax_price
        (self.price*1.10).round
    end
    
    #小計の計算
    def subtotal
        item.add_tax_price * amount
    end
    
    #合計金額を出すための計算
    def sum_tax
    item.add_tax_price*amount
  end
end
