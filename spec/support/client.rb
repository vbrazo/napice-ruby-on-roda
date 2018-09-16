CONSUMER_STRUCT = Struct.new(:consumer_key, :consumer_secret)

class Client < CONSUMER_STRUCT
  DUMMY_KEY    = 'key'.freeze
  DUMMY_SECRET = 'shhhh'.freeze

  def self.find_by_consumer_key(key)
    new(key, DUMMY_SECRET) if key == DUMMY_KEY
  end
end
