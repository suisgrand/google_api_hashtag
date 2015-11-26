
module Remove_non_latin

  def process

    list_item = super
    elements = []
    list_item.each do |item|

      temp_value = item.encode('UTF-8', :invalid => :replace, :undef => :replace)

      elements.push(temp_value)
    end

    return elements

  end

end