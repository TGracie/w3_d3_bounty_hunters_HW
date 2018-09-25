require('pg')

class BountyHunter

  #####################################################################
  attr_reader(:id, :name, :homeworld)
  attr_accessor(:favourite_weapon, :danger_level)
  #####################################################################
  def initialize( options )

    @id = options['id'].to_i if options['id']
    @name = options['name']
    @favourite_weapon = options['favourite_weapon']
    @homeworld = options['homeworld']
    @danger_level = options['danger_level']

  end
  #####################################################################
  #####################################################################
  ## CLASS METHODS ##

  def self.delete_all()
    db = PG.connect({ dbname: 'bounty_hunters', host: 'localhost'})
    sql = "DELETE FROM bounty_hunters"
    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all")
    db.close
  end

  def self.all()
    db = PG.connect({ dbname: 'bounty_hunters', host: 'localhost'})
    sql = "SELECT * FROM bounty_hunters"
    db.prepare("all", sql)
    hunters = db.exec_prepared("all")
    db.close
    return hunters.map { |hunter_hash| BountyHunter.new( hunter_hash )}
  end

  def self.find()
    db = PG.connect({ dbname: 'bounty_hunters', host: 'localhost'})
    sql = "SELECT * FROM bounty_hunters
    WHERE id = [$1]"
    values = [@id]
    db.prepare("find", sql)
    db.exec_prepared("find", values)
    db.close
  end

  #####################################################################
  #####################################################################
  ## OBJECT METHODS ##

  def save()
    db = PG.connect({ dbname: 'bounty_hunters', host: 'localhost'})
    sql = "INSERT INTO bounty_hunters
    (
      name,
      favourite_weapon,
      homeworld,
      danger_level
      )
      VALUES
      (
        $1, $2, $3, $4
      )
      RETURNING id"
      values = [@name, @favourite_weapon, @homeworld, @danger_level]
      db.prepare("save", sql)
      @id = db.exec_prepared("save", values)[0]["id"].to_i
      db.close
  end
  #####################################################################
  def delete()
    db = PG.connect({ dbname: 'bounty_hunters', host: 'localhost'})
    sql = "DELETE FROM bounty_hunters
          WHERE id = $1"
    values = [@id]
    db.prepare("delete", sql)
    db.exec_prepared("delete", values)
    db.close
  end
  #####################################################################

end #class end
