require_relative 'db_connection'
require_relative '01_sql_object'
require 'byebug'

module Searchable
  def where(params)
    where = ""
    where_str = params.keys.map { |i| "#{i} = ?" }.join(" AND ")
    # debugger
    x = DBConnection.execute(<<-SQL, *params.values)
    SELECT
      *
    FROM
      #{self.table_name}
    WHERE
      #{where_str}
    SQL
    x.map { |i| self.new(i) }
  end

end

class SQLObject
  extend Searchable


  # Mixin Searchable here...
end
