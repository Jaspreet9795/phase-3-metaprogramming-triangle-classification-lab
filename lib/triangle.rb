class Triangle
  attr_reader :a, :b, :c 
  
  def initialize(a,b,c)
    @a=a
    @b=b
    @c=c
  end


  def kind 
    validate_triangle
    if a==b && b==c
      :equilateral
    elsif 
      a==b || b==c || c==a
      :isosceles
    else
      :scalene
    end
  end 


   def sides_greater_than_zero?
    [a, b, c].all?(&:positive?)
   end

   def triangle_sides_sum?
    a + b > c && a + c > b && b + c > a
   end

   def validate_triangle
    raise TriangleError unless sides_greater_than_zero? && triangle_sides_sum?
   end

   class TriangleError < StandardError
   end

end
