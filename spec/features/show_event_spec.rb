require 'rails_helper'

describe "Viewing an individual event" do

  it "shows the event's details" do
    event = Event.create(name: "BugSmash",
                         location: "Denver",
                         price: 10.00,
                         description: 'Fun evening of bug smashing!',
                         starts_at: 10.days.from_now)

    visit event_url(event)

    expect(page).to have_text(event.name)
    expect(page).to have_text(event.location)
    expect(page).to have_text(event.description)
    expect(page).to have_text(event.starts_at)
  end

  it "shows the price if the price is not $0" do
    event = Event.create(event_attributes(price: 20.00))

    visit event_url(event)

    expect(page).to have_text("$20.00")
  end

  it "shows 'Free' if the price is $0" do
    event = Event.create(event_attributes(price: 0.00))

    visit event_url(event)

    expect(page).to have_text("Free")
  end
end
