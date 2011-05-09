class Golf

  def self.hole2 s
    s.split(' ').sort { |a,b| a[1] <=> b[1] }.join ' '
  end

  def self.hole8 n
    l = [1, 1]
    3.upto(n) { |i|
      l << l[i - 2] + l[i - 3]
    }
    l
  end
end
