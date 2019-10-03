class OpponentSelectForm
  include ActiveModel::Model
 
  attr_accessor  :opponent

  # constant
  REGISTRABLE_ATTRIBUTES = %i(opponent)
  SELECT_ITEMS = [["奥さん", "wife"], ["おばあちゃん", "grandmother"], ["お母さん", "mother"], ["友達", "femalefriend"]]

end
