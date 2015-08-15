class TestObjectLevel
  def initialize(args)
    AttrArgsShorthand.set(self, args)
  end

  def arg4
    return "special4"
  end

  def arg4=(new_value)
    @arg4 = "something4"
  end
end
