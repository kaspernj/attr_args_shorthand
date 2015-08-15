class AttrArgsShorthand
  def self.set(object, arguments, args = {})
    arguments.each do |key, value|
      object.instance_variable_set("@#{key}", value)

      unless object.respond_to?(key)
        object.define_singleton_method(key) do
          instance_variable_get("@#{key}")
        end
      end

      unless object.respond_to?("#{key}=")
        object.define_singleton_method("#{key}=") do |value|
          instance_variable_set("@#{key}", value)
        end
      end
    end
  end

  def self.set_attrs(clazz, args)
    args.each do |arg|
      clazz.__send__(:define_method, arg) do
        instance_variable_get("@#{arg}")
      end

      clazz.__send__(:define_method, "#{arg}=") do |value|
        instance_variable_set("@#{arg}", value)
      end
    end
  end

  def self.set_args(object, args)
    args.each do |key, value|
      object.instance_variable_set("@#{key}", value)
    end
  end
end
