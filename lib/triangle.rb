class Triangle
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    validate
    if side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side2 == side3 || side1 == side3
      :isosceles
    else
      :scalene
    end
  end

  def validate
    valid_triangle = [
      (side1+side2>side3), (side2+side3>side1), (side1+side3>side2)
    ]
    [side1, side2, side3].each do |side|
      valid_triangle << false if side <= 0
      raise TriangleError if valid_triangle.include? (false)
    end
    end

    class TriangleError < StandardError
    end

end
