class Item < ApplicationRecord
    has_one_attached :image
    belongs_to :genre
    
    enum is_active: { sale:0 ,stop_sale:1 }
end
