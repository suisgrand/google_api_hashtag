
class Remove_blank

=begin
  def initialize(list_item)
    @my_array = list_item
  end
=end

  def pass_on(list_item)
    @my_array = list_item
  end

  def process
    elements = []
    @my_array.each do |item|
      temp_value = item
      temp_value = temp_value.delete(' ')
      elements.push(temp_value)
    end

    return elements

  end

end