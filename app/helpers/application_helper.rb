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
  
  
  def kudos_sparkline_tag(kudos_data, background_color, chart_color = '000000', size = '90x18')
    if kudos_data.size < 20
      kudos_data = ([0] * (20 - kudos_data.size)) + kudos_data
    end
    min = kudos_data.min
    max = kudos_data.max
    scale = max
    scale = -min if min.abs > scale
    base_url = "http://chart.apis.google.com/chart?cht=ls&chs=#{size}&chco=#{chart_color}&chf=bg,s,#{background_color}&chls=1,1,0&chm=o,990000,0,20,3,1"
    "<img src='#{base_url}&chds=#{-scale},#{scale}&chd=t:#{kudos_data.join(',')}'/>"
  end

  def gravatar_url(user = nil)
    if user && !user.email.blank?
      hash = Digest::MD5.hexdigest(user.email)
      url = URI.parse "http://www.gravatar.com/avatar/#{hash}.jpg?s=105&d=404"
      Net::HTTP.start(url.host, url.port) do |http|
        if http.head(url.request_uri).code == "200"
         "http://www.gravatar.com/avatar/#{hash}.jpg?s=105"
        else
          "/images/thumb/missing_person.png"
        end
      end
    else
      "/images/thumb/missing_person.png"
    end
  end
  
end
