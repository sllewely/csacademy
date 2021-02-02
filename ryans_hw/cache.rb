require "pry"

class Cache

  def initialize(max_size)
    @cache_arr = []
    @queue_arr = []
    @cache_indices = {}
    @max_size = max_size
  end
                            
  def add_item(item) 
    if @queue_arr.size < @max_size || @queue_arr.size == nil
      @cache_arr << item
      @queue_arr << item
      @cache_indices[item] = @cache_arr.length - 1 
    else 
      least_recent = @queue_arr.shift
      least_recent_idx = @cache_indices[least_recent]
      @cache_arr[least_recent_idx] = item
      @cache_indices[item] = least_recent_idx
      @cache_indices.delete(least_recent)
      @queue_arr << item
    end
  end

  def read_item(item)
    if !@cache_indices[item].nil?
      @queue_arr.shift(@cache_indices[item])
      @queue_arr << item
      @cache_indices[item] = @cache_arr.length - 1
      puts "Cache hit"
    else
      puts "Cache miss"
      add_item(item)
    end
  end

  def print_values
    puts "Cache:  #{@cache_arr}"
  end
end

example_cache = Cache.new(8)
example_cache.add_item("a")
example_cache.add_item("b")
example_cache.add_item("c")
example_cache.add_item("d")
example_cache.add_item("e")
example_cache.add_item("f")
example_cache.add_item("g")
example_cache.add_item("h")

example_cache.print_values

example_cache.add_item("i")

example_cache.print_values

example_cache.read_item("i")
example_cache.read_item("p")