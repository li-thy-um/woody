class TickTockJob < ActiveJob::Base
  queue_as :time

  def perform
    loop do
      sleep 1
      WebsocketRails[:time].trigger 'tick_tock', (s=Time.now.strftime('%Y-%m-%d %H:%M:%S'))
      puts s
    end
  end
end
