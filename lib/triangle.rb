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
    valid_triangle = [(side1+side2>side3), (side2+side3>side1), (side1+side3>side2)]
    valid_triangle.each do |combo|
      if !combo
        valid_triangle << false
        raise TriangleError if valid_triangle.include? (false)
      end
    end
  end

  class TriangleError < StandardError
  end

end
