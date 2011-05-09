class Golf
  def self.hole1 a
    a.reduce 1,:*
  end
  
  def self.hole2 s
    s.split(' ').sort_by { |a| a[1] }.join ' '
  end

  def self.hole3 n
    (1..n).inject :*
  end
  
  def self.hole4 a
    a.map do |e|
      case e
        when /man\((\w+)\)/   : "hat(man(#{$1}))"
        when /dog\((\w+)\)/   : "dog(#{$1}(bone))"
        when /cat\((\w+)\)/   : "dead(#{$1})"
      end
    end
  end
  
  def self.hole5(b)
    (1..b.length).map {|n|
      b.combination(n).to_a.reject {|s| !b.join(",").include?(s.join(","))}
    }.flatten(1)
  end
  
  def self.hole7(ints)
    ranges = []
    ints.each do |int|
      found = false
      ranges = ranges.map do |range|
        if int == range.begin - 1
          found = true
          (range.begin - 1)..(range.end)
        elsif int == range.end + 1
          found = true
          (range.begin)..(range.end + 1)
        else
          range
        end
      end
      ranges << (int..int) unless found
    end
    ranges.map do |range|
      if range.begin == range.end
        range.begin.to_s
      else
        "#{range.begin}-#{range.end}"
      end
    end
  end
  
  def self.hole6(n)
    (1..n).map{|i|
      s = "#{'fizz' if i % 3 == 0}#{'buzz' if i % 5 == 0}"
      s == '' ? i : s
    }
  end
  
  def self.hole8 n
    l = [1, 1]
    3.upto(n) { |i|
      l << l[i - 2] + l[i - 3]
    }
    l
  end
  
  def self.hole9(f)
    r = File.readlines(f)
    e = []
    loop {
      v = Hash.new(0)
      r.each {|s| v[(s.gsub(/ |\n/, "").split(",") - e)[0]] += 1}
      x = v.sort_by(&:last)
      tc       = x[-1][0]
      tcv = x[-1][-1]
      bc    = x[0][0]
      return tc if tcv > r.length / 2
      bc ? e << bc :(return tc)
    }
  end

end

