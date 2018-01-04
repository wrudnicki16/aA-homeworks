require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    result = []
    table = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL

    table.first.each do |column_str|
      result << column_str.to_sym
    end
    @columns = result
  end

  def self.finalize!
    columns.each do |column_name|
      define_method(column_name) do

        attributes[column_name]
      end
      setter_name = "#{column_name.to_s}=".to_sym
      define_method(setter_name) do |value|
        attributes[column_name] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name.to_s.tableize
  end

  def self.table_name
    @table_name ||= self.to_s.tableize
  end

  def self.all
    table = self.table_name
    # debugger
    all_info = DBConnection.execute(<<-SQL)
      SELECT
        #{table}.*
      FROM
        #{table}
    SQL

    parse_all(all_info)
  end

  def self.parse_all(results)
    new_result = []
    results.each do |result|
      new_result << self.new(result)
    end
    new_result
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    self.class.finalize!
    params.each do |attribute, value|
      # debugger
      attr_name = attribute.to_sym
      unless self.class.columns.include?(attr_name)
        raise "unknown attribute '#{attribute}'"
      end
      send("#{attr_name}=", value)
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
