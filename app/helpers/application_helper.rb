module ApplicationHelper
  def display_time_event(event)
    display_time(event.start_at, event.end_at, event.all_day)
  end
  
  def display_time_lodging(lodging)
    display_time(lodging.start_at.to_time, lodging.end_at.to_time, true)
  end
  
  def display_time(start_time, end_time, all_day)
   
#    start_at = event.start_at
 #   end_at = event.end_at
    day1 = start_time.to_date
    day2 = end_time.to_date
    time1 = start_time - day1.to_time
    time2 = end_time - day2.to_time
    seperator = " t('to_time') "
    
    if all_day
      if day1 == day2
        # all-day
        format_display_time(start_time, end_time, all_day,"event.all-day")
      else
        # all-day - all-day
        format_display_time(start_time, end_time, all_day,"event.all-day",seperator,"event.all-day")
      end
    else
      if day1 == day2
        if time1 == time2
          #default
          format_display_time(start_time, end_time, all_day,"default")
        else
          # default - one-day-end
          format_display_time(start_time, end_time, all_day,"default",seperator,"event.one-day-end")
        end
      else
        # default - default
        format_display_time(start_time, end_time, all_day,"default",seperator,"default")
      end
    end
  end

  def format_display_time(start_time, end_time, all_day, format_start, seperator = "", format_end = "")
    t_start = I18n.localize(start_time, :format => :"#{format_start}")
    if format_end != ""
      t_end = I18n.localize(end_time, :format => :"#{format_end}")
    else
      t_end = ""
    end

    %(<span class="event-time">#{t_start}#{seperator}#{t_end}</span>)
  end
  
  # Return HTML for OK or Remove Glyphicon for boolean value
  def icon_bool(bool)
    icon(bool ? "ok" : "remove")
  end
  
  # Return HTML for Glyphicon
  def icon(icon_class)
    raw("<i class='icon-"+ icon_class + "'></i>")
  end
  
  def button_view(target, button_class='btn btn-mini', title=t('.show', :default => t("helpers.links.view")) )
    link_to icon('eye-open'),
            target, 
            :class => button_class, 
            :title => title
  end
  def button_edit(target, button_class='btn btn-mini', title=t('.edit', :default => t("helpers.links.edit")) )
    link_to icon('pencil'),
            target, 
            :class => button_class, 
            :title => title
  end
  def button_destroy(target, button_class='btn btn-mini btn-danger', title=t('.destroy', :default => t("helpers.links.destroy")), confirm=t('.confirm', :default => t("helpers.links.confirm")) )
    link_to icon('trash'),
            target, 
            :method => :delete,
            :data => { :confirm => confirm },
            :class => button_class, 
            :title => title
  end
end
