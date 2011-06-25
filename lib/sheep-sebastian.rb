require "sheep-sebastian/version"
require 'twitter'
require 'yaml'

class SheepSebastian
  module DB
    def self.load(filename, default)
      db = _load(filename, default)
      def db.filename=(fname) @fname = fname end
      def db.save() File.open(@fname, 'w') {|f| f.write(self.to_yaml) } end
      db.filename = filename
      db
    end

    def self._load(filename, default)
      YAML::load(File.read(filename)) rescue default
    end
  end

  def tweets(db)
    since_id = db[:since_id]
    opts = since_id ? { :since_id => since_id } : {}
    tweets = Twitter.user_timeline('dan5ya', opts)
    unless tweets.empty?
      db[:since_id] = tweets.first.id
      db.save
    end
    tweets
  end

  def hit?(text, recipe)
    recipe[:keywords].each {|keyword| text[keyword] or return false }
    return true
  end

  def atend_new_post(text, recipe)
    tmp, month, day = text.match(/(1?\d)\/([1-3]?\d)/).to_a
    tmp, hour, minutes = text.match(/([12]?\d):([0-5]?\d)/).to_a
    at = sprintf("%04d-%02d-%02d", Time.now.year, month, day) # todo: next year...
    at_time = sprintf("%02d:%02d", hour, minutes)
    template = Post_template
    template[:started_at] = at
    template[:started_at_time] = at_time
    template[:ended_at] = at
    p text
    p template
  end

  def initialize()
    db = DB.load(DB_filename, {:since_id => nil})
    recipe = Recipe
    tweets(db).each do |tweet|
      if hit?(tweet.text, recipe)
        __send__ recipe[:handle], tweet.text, recipe
      end
    end
  end
end
