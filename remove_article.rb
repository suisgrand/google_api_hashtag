
module Remove_article

  def process

    list_item = super
    elements = []
    list_item.each do |item|
      temp_value = '#' + item
      elements.push(temp_value)
    end

    return elements

  end

end