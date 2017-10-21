class EventsController < ApplicationController
  def index
    @events = ['BugSmash', 'Hackathon', 'Kada Camp', 'Rails User Group']
  end
end
