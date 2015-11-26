

module Keep_non_blank_in_array

  def process

    list_item = super
    elements = []
    list_item.each do |item|
      unless item.nil? && item == 0
        elements.push(item)
      end
    end

    return elements

  end

end