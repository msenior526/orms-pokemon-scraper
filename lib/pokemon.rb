class Pokemon
    attr_accessor :name, :id, :type, :db

    def initialize(name:, type:, db:, id:)
        @name = name
        @type = type
        @db = db
        @id = id
    end

    def self.save(name, type, db)
        sql = <<-SQL
          INSERT INTO pokemon (name, type) VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
    end

    def self.find(number, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
    result = db.execute(sql, number).flatten
        Pokemon.new(:id => result[0], :name => result[1], :type => result[2], :db => db) 
    end
end
