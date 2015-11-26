
MAX_SIZE = 115

module Limit_character

  def process
    list_item = super
    elements = []
    list_item.each do |item|
      #temp_value = item
      temp_value = item[0..MAX_SIZE]
      elements.push(temp_value)
    end

    return elements

  end

end