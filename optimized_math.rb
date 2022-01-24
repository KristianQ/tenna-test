class OptimizedMath
  def start
    (1..100).each do |n|
      puts message_for(n)
    end
  end

  def message_for(n)
    return "The number '#{n}' is divisible by two and three." if n.even? && (n % 3).zero?
    return "The number '#{n}' is divisible by three." if (n % 3).zero?

    if n.odd?
      "The number '#{n}' is odd."
    else
      "The number '#{n}' is even."
    end
  end
end

# run only if the script is being executed from command line
if __FILE__ == $0
  OptimizedMath.new.start
end
