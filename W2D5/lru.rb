class LRUCache
    def initialize(size = 4)
      @cache = Array.new(size)
    end

    def count
      # returns number of elements currently in cache
      i = 0
      while i < @cache.length
        if @cache[i].nil?
          return i
        end
        i += 1
      end
    end

    def add(el)
      # adds element to cache according to LRU principle
      if full?
        oldest_idx = 0
        (1...@cache.length).each do |i|
          oldest_idx = i if @cache[i][1] > @cache[oldest_idx][1]
        end
        @cache[oldest_idx] = [el, 0]

      else
        i = 0
        while @cache[i]
          @cache[i][1] += 1
          i += 1
        end
        @cache[i] = [el, 0]
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      result = Array.new(@cache.length)
      i = 0
      while @cache[i]
        result[@cache[i][1]] = @cache[i] if @cache[i][1] < @cache.length
        i += 1
      end
      result
    end

    private
    # helper methods go here!
    def full?
      count == @cache.length
    end
end

p lru = LRUCache.new
p lru.add(["thingy", "ma", "bopper"])
p lru.show
p lru.add("dosey doe")
p lru.show
p lru.add([1, 2])
p lru.show
p lru.add(1)
p lru.show
p lru.add("oops")
p lru.show
