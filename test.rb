class Image
  attr_accessor :multi_array, :copy_array

  def initialize(multi_array)
    @multi_array = multi_array
    @copy_array = []
    puts "By how many pixels would you like to blur the image?"
    @distance = gets.chomp.to_i
  end
  
  def make_blurry
    get_number_of_rows    
    make_copy_array
    find_ones
    output_image
  end

  private

  def get_number_of_rows
    number_of_rows = @multi_array.count
    number_of_rows.times do
      @copy_array << Array.new
    end
  end

  def make_copy_array
    n = 0
    @multi_array.each do |row|
      row.each do |cell|
        @copy_array[n] << cell
        n += 1 if @copy_array[n].length == @multi_array[0].length
      end
    end
  end

  def find_ones
    @multi_array.each_with_index do |row, row_index|
      row.each_with_index do |cell, cell_index|
        if cell == 1
          blur_image(row_index, cell_index)
        end
      end
    end
  end

  def blur_image(row, column)
    n = 0
    (@distance).times do
      blur_left(row, column, n)
      blur_right(row, column, n)
      blur_up(row, column, n)
      blur_down(row, column, n)

      n += 1
    end
  end

  def blur_left(row, column, n)
    if (column - n) >= 0
      @copy_array[row][column - n - 1] = 1
    end
      # down
    if (row + 1) <= (@multi_array.length - 1) && (column - n) >= 0
      @copy_array[row + 1][column - n] = 1
    end
      # up
    if (row - 1) >= 0 && (column - n) >= 0
      @copy_array[row - 1][column - n] = 1
    end
  end

  def blur_right(row, column, n)
    if (column + n + 1) <= (@multi_array[row].length - 1)
      @copy_array[row][column + n + 1] = 1
    end
      # down
    if (row + 1) <= (@multi_array.length - 1) && (column + n) <= (@multi_array[row].length - 1)
      @copy_array[row + 1][column + n] = 1
    end
      # up
    if (row - 1) >= 0 && (column + n) <= (@multi_array[row].length - 1)
      @copy_array[row - 1][column + n] = 1
    end
  end

  def blur_up(row, column, n)
    if (row - n - 1) >= 0
      @copy_array[row - n - 1][column] = 1
    end
      # left
    if @copy_array[row][column - 1] && (row - n) >= 0
      @copy_array[row - n][column - 1] = 1
    end
      # right
    if @copy_array[row][column + 1] && (row - n) >= 0
      @copy_array[row - n][column + 1] = 1
    end
  end

  def blur_down(row, column, n)
    if (row + n + 1) <= (@multi_array.length - 1)
      @copy_array[row + n + 1][column] = 1
    end
      # left
    if @copy_array[row][column - n] && (row + n) <= (@multi_array.length - 1)
      @copy_array[row + n][column - 1] = 1
    end
      # right
    if @copy_array[row][column + n]  && (row + n) <= (@multi_array.length - 1)
      @copy_array[row + n][column + 1] = 1
    end
  end

  def output_image
    @copy_array.each do |row|
      puts row.join(" ")
    end
  end
end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
])


image.make_blurry
