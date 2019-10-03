class PriceSelectForm
  include ActiveModel::Model

  attr_accessor :price

  REGISTRABLE_ATTRIBUTES = %i(price)
  SELECT_ITEMS = [["〜3,000円", "3000"], ["5,000円", "5000"], ["10,000円", "10000"], ["20,000円", "20000"], ["50,000円", "50000"], ["不問", ""]]

end
