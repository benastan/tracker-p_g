require 'sequel'
require "tracker/p_g/version"

module Tracker
  def self.pg
    PG.connection
  end

  module PG
    def self.database_url=(database_url)
      @database_url = database_url
    end

    def self.database_url
      @database_url
    end

    def self.connection
      @connection ||= Sequel.connect(database_url)
    end

    def self.reset!
      @connection = nil
      self.database_url = nil
    end

    def self.recursive_parent_story_stories_sql(story_id)
      <<-SQL
WITH RECURSIVE parent_stories(id, parent_story_id, child_story_id) AS (
  SELECT id, parent_story_id, child_story_id FROM story_stories WHERE child_story_id = #{story_id}
UNION ALL
  SELECT ss.id, ss.parent_story_id, ss.child_story_id
  FROM parent_stories ps, story_stories ss
  WHERE ps.parent_story_id = ss.child_story_id
) SELECT id from parent_stories
SQL
    end
  end
end
