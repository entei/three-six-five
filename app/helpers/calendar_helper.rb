module CalendarHelper
  def month_link(month_date)
    link_to(I18n.localize(month_date, :format => "%B"), {:month => month_date.month, :year => month_date.year})
  end
  
  # custom options for this calendar
  def event_calendar_opts
    { 
      :first_day_of_week => @first_day_of_week,
      :year => @year,
      :month => @month,
      :event_strips => @event_strips,
      :month_name_text => I18n.localize(@shown_month, :format => "%B %Y"),
      :previous_month_text => "<< " + month_link(@shown_month.prev_month),
      :next_month_text => month_link(@shown_month.next_month) + " >>"  
     }
  end

  def event_calendar
    # args is an argument hash containing :event, :day, and :options
    calendar event_calendar_opts do |args|
    #   event = args[:event]
    #   %(<a href="/events/#{event.id}" title="#{(event.start_at)}\n#{h(event.end_at)}\n#{h(event.description)}">#{h(event.name)}</a>)
      event, day = args[:event], args[:day]
      html = (link_to "#{event.start_at.strftime('%H:%M')} #{event.name}", {controller: "events", action: "show", id: event.id}, remote: true, id: event.id,  title: "#{h(event.name)}\n#{h(event.start_at)}\n#{h(event.end_at)}\n#{h(event.description)}")
    end
  end
end
