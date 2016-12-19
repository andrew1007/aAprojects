class XmlDocument
  def initialize(indent = false)
    @indent = indent
    @indent_counter = 0
  end

  def method_missing(name, *attrs, &blk)
    attrs = attrs.first || {}
    subtag = "" + indent
    if block_given?
      @indent_counter += 1 if @indent
      subtag << "<#{name}>"
      subtag << "\n" if @indent
      subtag << blk.call
      subtag << "</#{name}>"
      subtag << "\n" if @indent
      @indent_counter -= 1 if @indent
      subtag << indent
    else
      @indent_counter -= 1 if @indent
      subtag << regular_tags(name, attrs)
      subtag << "\n" + indent if @indent
    end
    return subtag
  end

  def regular_tags(name, attrs)
    hash_tag = attrs.map { |key, value| " #{key}=\"#{value}\""}.join("")
    hash_tag = "" if attrs == {}
    full_tag = "<#{name}#{hash_tag}/>"
  end

  def indent
    @indent_counter = 0 if @indent_counter < 0
    "  " * @indent_counter
  end
end
