class File
  def self.my_read(file_name)
    f = self.new(file_name, 'r')
    result = yield f
    f.close
    result
  end

  def self.my_write(file_name)
    f = self.new(file_name, 'w')
    yield f
    f.close
    f
  end

  def self.my_readlines(file_name)
    f = self.new(file_name, 'r')
    result = yield f
    f.close
    result
  end
end
