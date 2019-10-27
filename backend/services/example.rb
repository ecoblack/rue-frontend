# Q: What is the function of services in Ruby?
# A: To provide namespaces. To provide a mechanism for multiple inheritance. To facilitate code reuse.
# Q: What is the difference between a module and class?
# A: A module cannot be instantiated.
# Q: What is the difference between extend and include?
# A: extend adds the instance methods of a module to a class as class methods. include adds the instance methods of a module to a class as instance methods.


# Q: INCLUDE
# If we look at the ancestors of the Service class, we can see that the Logging module is present just between the class itself and its direct superclass, which is Object.
module A
  def q_cast
    puts 'MODULE A'
  end
end

module B
  def q_cast
    puts 'MODULE A'
  end
end

module C
  def q_cast
    puts 'MODULE A'
  end
end

class Example
  prepend C
  include B
  #extend A
  prepend A

  def q_cast
    puts 'MODULE A'
    super
  end

end

puts Example.ancestors
Example.new.q_cast