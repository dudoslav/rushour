require 'childprocess'

module Rushour
  class ServerProcess
    CMD_STOP    = 'quit'.freeze
    CMD_PAUSE   = 'pause'.freeze
    CMD_UNPAUSE = 'unpause'.freeze

    def initialize
      @ottd_server = ChildProcess.build(Rushour::Settings.executable, '-D')
      @ottd_server.io.stdout = STDOUT
      @ottd_server.io.stderr = STDERR
      @ottd_server.duplex = true
    end

    def start
      @ottd_server.start
    end

    def stop
      @ottd_server.io.stdin.puts CMD_STOP
      @ottd_server.wait
    end

    def pause
      @ottd_server.io.stdin.puts CMD_PAUSE
    end

    def unpause
      @ottd_server.io.stdin.puts CMD_UNPAUSE
    end
  end
end
