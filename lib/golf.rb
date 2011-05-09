class Golf
  def self.hole1 a
    a.reduce(1,:*)
  end
  
  def self.hole2 s
    s.split(' ').sort { |a,b| a[1] <=> b[1] }.join ' '
  end
  
  def self.hole3(n)
    n == 1 ? 1 : n*hole3(n-1)
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
      f = i % 3 == 0
      b = i % 5 == 0
      s = (f ? 'fizz' : '') + (b ? 'buzz' : '')
      s == '' ? i : s
    }
  end
  
  def self.hole9(path)
    rows = File.readlines(path)
    votes = Hash.new(0)
    rows.each do |row|
      first_preference = row.split(",").first.strip
      votes[first_preference] += 1
    end
    votes.to_a.sort_by {|a| a.last}.reverse.first.first
  end
end
