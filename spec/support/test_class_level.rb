class TestClassLevel
  AttrArgsShorthand.set_attrs(self, [:name, :arg])

  def initialize(args)
    AttrArgsShorthand.set_args(self, args)
  end
end
