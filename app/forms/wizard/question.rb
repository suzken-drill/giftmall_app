module Wizard
  module Question
    REGISTRABLE_ATTRIBUTES = %i(event opponent price)
    SELECT_EVENTS = [["母の日", "mothersday"], ["結婚記念日", "weddinganniversary"], ["誕生日", "birthday"]]
    SELECT_OPPONENTS = [["奥さん", "wife"], ["おばあちゃん", "grandmother"], ["お母さん", "mother"]]
    SELECT_PRICES = [["5,000円", "5000"], ["20,000円", "20000"], ["50,000円", "50000"], ["不問", ""]]

    class Base
      include ActiveModel::Model
      attr_accessor :event, :opponent, :price
      def initialize(args={})
        args.each do |key, value|
          self.send("#{key}=", value) if self.methods.include?(key.to_sym)
        end
      end
      def attributes
        {event: @event, opponent: @opponent, price: @price}
      end
      def attributes=(args={})
        args.each do |key, value|
          self.send("#{key}=", value) if self.methods.include?(key.to_sym)
        end
      end
    end
    class Index < Base
    end
    class Opponent < Index
      validates :event, presence: {message: "イベントを選択してください"}
    end
    class Price < Opponent
      validates :opponent, presence: {message: "相手を選択してください"}
    end
    class Result < Price
    end
  end
end
