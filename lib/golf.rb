class Golf
  class << self
    def hole1 a
      a.reduce 1,:*
    end
    
    def hole2 s
      s.split(' ').sort_by { |a| a[1] }.join ' '
    end
    
    def hole3 n
      (1..n).inject :*
    end
  
    def hole5(b)
      (1..b.length).map {|n|
        b.combination(n).to_a.reject {|s| !b.join(",").include?(s.join(","))}
      }.flatten(1)
    end
  
    def hole4 a
      a.map { |e|
        case e
          when /man\((\w+)\)/   : "hat(man(#{$1}))"
          when /dog\((\w+)\)/   : "dog(#{$1}(bone))"
          when /cat\((\w+)\)/   : "dead(#{$1})"
        end
      }
    end
  
  def hole7(l)
      r = []
      l.each do |i|
          f = false
          r = r.map do |s|
            if i == s[0] - 1
              f = true
              [s[0] - 1, s[-1]]
            elsif i == s[-1] + 1
              f = true
              [s[0], s[-1] + 1]
            else
              s
            end
          end
          r << [i] unless f
        end
        r.map {|s|s.size == 1 ? s[0].to_s : "#{s[0]}-#{s[-1]}"}
      end
  

    def hole6 n
      (1..n).map {|i|
        s = "#{'fizz' if i % 3 == 0}#{'buzz' if i % 5 == 0}"
        s == '' ? i : s
      }
    end
    
    def hole8 n
      l = [1, 1]
      3.upto(n) { |i|
        l << l[i - 2] + l[i - 3]
      }
      l
    end
    
    def hole9 f
      r = File.readlines f
      e = []
      loop {
        v = Hash.new(0)
        r.each {|s| v[(s.gsub(/ |\n/, "").split(",") - e)[0]] += 1}
        x = v.sort_by &:last
        tc  = x[-1][0]
        tcv = x[-1][-1]
        bc  = x[0][0]
        return tc if tcv > r.length / 2
        bc ? e << bc : (return tc)
      }
    end
  end
end

