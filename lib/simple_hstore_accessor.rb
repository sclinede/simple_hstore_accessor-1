require 'active_support'
require 'active_record'
require 'activerecord-postgres-hstore'
require 'simple_hstore_accessor/version'

module SimpleHstoreAccessor
  # Public: Rails4-like method which defines simple accessors for hstore fields
  #
  # hstore_attribute - your Hstore column
  # keys - Array of fields in your hstore
  #
  # Example
  #
  #   class Person < ActiveRecord::Base
  #     store_accessor :favorites_info, :book, :color
  #   end
  #
  # Returns nothing
  def store_accessor(hstore_attribute, *keys)
    serialize hstore_attribute, ActiveRecord::Coders::Hstore

    Array(keys).flatten.each do |key|
      define_method("#{key}=") do |value|
        send("#{hstore_attribute}_will_change!")
        send("#{hstore_attribute}=", (send(hstore_attribute) || {}).merge(key.to_s => value))
      end
      define_method(key) do
        send(hstore_attribute) && send(hstore_attribute)[key.to_s]
      end
    end
  end
end

ActiveSupport.on_load(:active_record) { extend SimpleHstoreAccessor }
