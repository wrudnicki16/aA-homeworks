require 'byebug'

class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name|
      debugger

      define_method(name) do
        string = name.to_s
        string = '@' + string
        instance_variable_get(string)
      end
      setter_name = "#{name.to_s}=".to_sym
      define_method(setter_name) do |value|
        string = name.to_s
        string = '@' + string
        instance_variable_set(string, value)
      end
    end
  end
end
