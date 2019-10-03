require 'active_support/concern'
require 'open-uri'

module Giftmall
  extend ActiveSupport::Concern

  def get_giftmall(cat_num, price)
    url = "https://giftmall.silveregg.net/pycre5/jsonp/dispatch?action=pc215&page_type=pc_list&cookie=553fd48fd43d19e606c6c308230992c77ca1c91ad8afc9efafca4b7d6196da9a&num=20&merch=giftmall&t=#{cat_num}"
    # Rails.logger.debug url
    charset = nil
    result = open(url) do |f|
      charset = f.charset
      f.read
    end
    result.gsub!("callback(", "")
    result.gsub!(");\n", "")
    doc = JSON.parse(result)
    # Rails.logger.debug doc.inspect
    items = []
    doc["items"].reverse.each do |item|
      if price.blank?
      	items << { title: item[0]["title"], image: item[0]["img_url"], url: item[0]["ct_url"], price: item[0]["price_string"] }
      else
        items << { title: item[0]["title"], image: item[0]["img_url"], url: item[0]["ct_url"], price: item[0]["price_string"] } if item[0]["price"] <= price.to_i
      end
      # 取り敢えず3件まで
      break if items.count > 2
    end
    items
  end
  module_function :get_giftmall
end