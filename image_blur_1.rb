class Image
  attr_accessor :multi_array

  def initialize(multi_array)
    @multi_array = multi_array
  end

  def output_image
    self.multi_array.each do |row|
      puts row.join
    end
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.output_image