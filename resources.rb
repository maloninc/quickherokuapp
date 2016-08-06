class Record
  include DataMapper::Resource

  property :gid, Serial

end

DataMapper::setup(:default, ENV['DATABASE_URL'] || 'sqlite3:db.sqlite3')
DataMapper::Model.raise_on_save_failure = true

DataMapper.finalize
DataMapper.auto_upgrade!
