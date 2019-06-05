require_relative('../db/sql_runner')

class House

  def initialize(options)
    @name = options['name']
    @id = options['id'] if options['id']
end
