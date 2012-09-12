module CalendarHelper
  def month_link(month_date)
    link_to(I18n.localize(month_date, :format => "%B"), {:month => month_date.month, :year => month_date.year})
  end
  
  def prev_month_link(month_date)
    link_to(raw('<i class="icon-arrow-left"></i> ') + I18n.localize(month_date, :format => "%B"), {:month => month_date.month, :year => month_date.year})
  end

  def next_month_link(month_date)
    link_to( raw(I18n.localize(month_date, :format => "%B") + ' <i class="icon-arrow-right"></i>'), {:month => month_date.month, :year => month_date.year})
  end
  
  # custom options for this calendar
  def event_calendar_opts
    { 
      :first_day_of_week => @first_day_of_week,
      :year => @year,
      :month => @month,
      :event_strips => @event_strips,
      :month_name_text => I18n.localize(@shown_month, :format => "%B %Y"),
      :previous_month_text => '<ul class="pager"><li class="previous">' + prev_month_link(@shown_month.prev_month) +'</li></ul>',
      :next_month_text =>  '<ul class="pager"><li class="next">' + next_month_link(@shown_month.next_month) +'</li></ul>',
      :use_all_day => true
    }
  end

  def event_calendar
    # args is an argument hash containing :event, :day, and :options
    calendar event_calendar_opts do |args|
      event, day = args[:event], args[:day]
      html = %(<a href="/events/#{event.id}" title="#{h(event.name)}">)
      html << display_event_time(event, day)
      html << %(#{h(event.name)}</a>)
      html
    end
  end

  def display_event_time(event, day)
    time = event.start_at
    if !event.all_day
      t = I18n.localize(time, :format => :"calendar.hour_and_minute")
      %(<span class="ec-event-time">#{t}</span>)
    else
      ""
    end
  end
end