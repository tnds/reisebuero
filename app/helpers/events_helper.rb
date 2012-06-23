module EventsHelper
  def display_time(event)
    
#    start_at = event.start_at
 #   end_at = event.end_at
    day1 = event.start_at.to_date
    day2 = event.end_at.to_date
    time1 = event.start_at - day1.to_time
    time2 = event.end_at - day2.to_time
    seperator = " bis "
    
    if event.all_day
      if day1 == day2
        # all-day
        format_display_time(event,"event.all-day")
      else
        # all-day - all-day
        format_display_time(event,"event.all-day",seperator,"event.all-day")
      end
    else
      if day1 == day2
        if time1 == time2
          #default
          format_display_time(event,"default")
        else
          # default - one-day-end
          format_display_time(event,"default",seperator,"event.one-day-end")
        end
      else
        # default - default
        format_display_time(event,"default",seperator,"default")
      end
    end
  end
end

def format_display_time(event, format_start, seperator = "", format_end = "")
  t_start = I18n.localize(event.start_at, :format => :"#{format_start}")
  if format_end != ""
    t_end = I18n.localize(event.end_at, :format => :"#{format_end}")
  else
    t_end = ""
  end
  
  %(<span class="event-time">#{t_start}#{seperator}#{t_end}</span>)
end