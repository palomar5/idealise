# Methods added to this helper will be available to all templates in the application.
require 'digest/md5'
module ApplicationHelper
  def format_kudos(kudos)
    content_tag("span", kudos, :class => color_class_for_kudos(kudos))
  end
  
  def color_class_for_kudos(kudos)
    case(kudos)
    when (-100000..-10); "crap"
    when (-9..-1); "bad"
    when (10..100000); "super"      
    when (1..9); "good"
    else; "boring"
    end
  end
  
  
  def kudos_sparkline_tag(kudos_data, background_color)
    label_color = "990000"
    base_url = "http://chart.apis.google.com/chart?cht=lc&chs=50x12&chco=000000&chf=bg,s,#{background_color}&chls=1,1,0&chm=o,#{label_color},0,20,4&chxp=0,#{kudos_data.last}&chxt=r,x,y&chxs=0,990000,11,0,_|1,990000,1,0,_|2,990000,1,0,_"
    image_tag("#{base_url}&chd=t:#{kudos_data.join(',')}")
  end

  def gravatar_url(user = nil)
    if user && !user.email.blank?
      hash = Digest::MD5.hexdigest(user.email)
      "http://www.gravatar.com/avatar/#{hash}.jpg?s=100"
    else
      "/images/rails.png"
    end
  end
  
end
