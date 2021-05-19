class Array
  def my_reduce(arg1 = nil, arg2 = nil)
    if arg1.is_a?(Symbol)
      memo = self[0]
      case arg1
      when :+
        n = 1
        until n == size
          memo += self[n]
          n += 1
        end
        memo
      when :-
        n = 1
        until n == size
          memo -= self[n]
          n += 1
        end
        memo
      when :*
        n = 1
        until n == size
          memo *= self[n]
          n += 1
        end
        memo
      when :/
        n = 1
        until n == size
          memo /= self[n]
          n += 1
        end
        memo
      when :**
        n = 1
        until n == size
          memo **= self[n]
          n += 1
        end
        memo
      end
    elsif arg1.is_a?(Integer) && arg2.is_a?(Symbol)
      memo = arg1
      n = 0
      case arg2
      when :+
        until n == size
          memo += self[n]
          n += 1
        end
        memo
      when :-
        until n == size
          memo -= self[n]
          n += 1
        end
        memo
      when :*
        until n == size
          memo *= self[n]
          n += 1
        end
        memo
      when :/
        until n == size
          memo /= self[n]
          n += 1
        end
        memo
      when :**
        until n == size
          memo **= self[n]
          n += 1
        end
        memo
      end
    elsif arg1.is_a?(Integer)
      memo = arg1
      n = 0
      while n < size
        memo = yield(memo, self[n])
        n += 1
      end
      memo
    else
      memo = self[0]
      n = 1
      until n == size
        memo = yield(memo, self[n])
        n += 1
      end
      memo
    end
    memo
  end
end


puts (5..10).to_a.my_reduce(1, :*)

