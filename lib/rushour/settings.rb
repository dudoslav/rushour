require 'settingslogic'

module Rushour
  class Settings < Settingslogic
    CONFIGURATION = 'rushour.yml'

    source "#{ENV['HOME']}/.rushour/#{CONFIGURATION}" \
    if File.exist?("#{ENV['HOME']}/.rushour/#{CONFIGURATION}")

    source "/etc/rushour/#{CONFIGURATION}" \
    if File.exist?("/etc/rushour/#{CONFIGURATION}")

    source "#{File.dirname(__FILE__)}/../../config/#{CONFIGURATION}"
  end
end
