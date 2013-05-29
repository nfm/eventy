module Eventy
  class Event < ::ActiveRecord::Base
    include AbstractEvent

    store_accessor :properties

    def self.record(event_name, identity, properties = {})
      create(name: event_name, identity: identity, properties: properties)
    end
  end
end
