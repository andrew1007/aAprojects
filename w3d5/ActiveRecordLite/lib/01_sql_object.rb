require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject < SQLite3::Database
  def self.columns
    table_name = self.table_name
    @x ||= DBConnection.execute2(<<-SQL)
    SELECT
      *
    FROM
      #{table_name}
    SQL

    @x.first.map(&:to_sym)

  end

  def self.finalize!
    self.columns.each do |col|
      define_method("#{col}") do
        self.attributes[col]
      end
      define_method("#{col}=") do |val|
        self.attributes[col] = val
      end
    end
  end

  def self.table_name=(table_name)
    self.to_s.split("").join("_")[1...-1] + "s"
  end

  def self.table_name
    self.to_s.downcase + "s"
  end

  def self.all
    table_name = self.table_name
    x = DBConnection.execute(<<-SQL)
    SELECT
      *
    FROM
      #{table_name}
    SQL
    self.parse_all(x)
  end

  def self.parse_all(results)
    arr = []
    results.each do |obj|
      arr << self.new(obj)
    end
    arr
  end

  def self.find(id)
    table = self.table_name
    x = DBConnection.execute(<<-SQL, id)
    SELECT
      *
    FROM
      #{table}
    WHERE
      id = ?
    SQL
    self.parse_all(x).first
  end

  def initialize(params = {})
    params.each do |attr_name, val|
      attr_symbol = attr_name.to_sym
      if !self.class.columns.include?(attr_symbol)
        raise "unknown attribute '#{attr_name}'"
      end
      send("#{attr_symbol}=", val)
    end
    @params = params
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    @attributes.values
  end

  def insert
    n = self.class.columns.length
    col_names = "(" + self.class.columns.drop(1).join(", ") + ")"
    question_marks = "(" + (["?"] * (n-1)).join(", ") + ")"
    DBConnection.execute(<<-SQL,*attribute_values)
    INSERT INTO
      #{self.class.table_name} #{col_names}
    VALUES
      #{question_marks}
    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    cols = self.class.columns.map! { |col| "#{col} = ?" }.join(", ")
    id = "#{self.class.columns[0]} = ?"
    # debugger
    query = <<-SQL
    UPDATE
      #{self.class.table_name}
    SET
      #{cols}
    WHERE
      #{id}
    SQL
    DBConnection.execute(query, *attribute_values, attribute_values.first)
  end

  def save
    self.class.find(self.id).nil? ? insert : update
  end
end
