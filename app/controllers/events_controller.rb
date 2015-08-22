class EventsController < WebsocketRails::BaseController

  def start_timing
    TickTockJob.perform_later
  end

end
