require 'thor'

module Rushour
  class CLI < Thor
    class_option :check_time,
                 aliases: '-c',
                 desc: 'Checking timer interval in seconds',
                 default: 300
    class_option :executable,
                 aliases: '-e',
                 desc: 'OpenTTD executable',
                 default: 'openttd'

    default_task :host
    
    desc 'host', 'Host Rushour controlled instance of dedicated OpenTTD server'
    def host
      init_settings

      tm = Rushour::TimeManager.new
      ottd = Rushour::ServerProcess.new
      ottd.start

      tm.on_start { || ottd.unpause }
      tm.on_finish { || ottd.pause }

      begin
        while (true)
          tm.check
        end
      rescue SystemExit, Interrupt
        puts 'SHUTTING RUSHOUR DOWN'
      end

      ottd.stop
    end

    desc 'settings', 'Prints configuration'
    def settings
      init_settings
      puts Rushour::Settings.to_hash
    end

    private

    def init_settings
      Rushour::Settings.merge!(options)
    end
  end
end
