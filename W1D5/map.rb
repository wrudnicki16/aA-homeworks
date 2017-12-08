class Map
  def initialize(dict = [])
    @dict = dict
  end

  def assign(key, val)
    pair_idx = nil
    @dict.each_with_index do |pair, i|
      if pair[0] == key
        pair_idx = i
      end
    end

    if pair_idx
      @dict[pair_idx][1] = val
    else
      @dict << [key, val]
    end
  end

  def lookup(key)
    @dict.each do |pair|
      if pair[0] == key
        return pair[1]
      end
    end
  end

  def remove(key)
    @dict.each_with_index do |pair, i|
      if pair[0] == key
        @dict.delete_at(i)
      end
    end
  end

  def show
    @dict.dup
  end
end
