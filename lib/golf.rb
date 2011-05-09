class Golf
  def self.hole2 s
    s.split(' ').sort { |a,b| a[1] <=> b[1] }.join ' '
  end

  def self.hole3(n)
    n == 1 ? 1 : n*hole3(n-1)
  end
  
  def self.hole4(a)
    a.map do |e|
      case e
        when /man\((\w+)\)/   : "hat(man(#{$1}))"
        when /dog\((\w+)\)/   : "dog(#{$1}(bone))"
        when /cat\((\w+)\)/   : "dead(#{$1})"
      end
    end
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

  def self.hole9(path)
    rows = File.readlines(path)
    num_voters = rows.length
    eliminated = []
    loop do
      votes = Hash.new(0)
      rows.each do |row|
        ranks = row.gsub(/ |\n/, "").split(",")
        votes[(ranks - eliminated).first] += 1
      end
      top_candidate       = votes.to_a.sort_by {|a| a.last}.reverse.first.first
      top_candidate_votes = votes.to_a.sort_by {|a| a.last}.reverse.first.last
      bottom_candidate    = votes.to_a.sort_by {|a| a.last}.first.first
      if top_candidate_votes > num_voters / 2
        return top_candidate
      elsif bottom_candidate == nil
        return top_candidate
      else
        eliminated << bottom_candidate
      end
    end
  end
end

