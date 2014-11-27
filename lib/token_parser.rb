class TokenParser

  def parse(input)
    input.scan(/(>=)|([a-z]+)|([>])|([0-9]+)|([=])+|([(])+|([)])|([<])|([&]+)+|([|]+)+/).flatten.compact
  end

end