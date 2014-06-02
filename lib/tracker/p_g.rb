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
  end
end
