require "eventy/version"
require "eventy/abstract_event"

module Eventy
  def self.configure(options = {})
    case options[:backend].to_sym
    when :active_record
      require "eventy/backends/active_record"
    end
  end

  def self.record(event_name, identity, properties = {})
    begin
      Event.record(event_name, identity, properties)
    rescue NameError
      raise "You must call Eventy.configure with a :backend option before calling Eventy.record"
    end
  end
end
