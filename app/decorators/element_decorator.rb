class ElementDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def command
    name = object.id_name
    entries = parse
    type = entries[0][0]
    parameters = []

    if entries[1][0] == "time"
      time = entries[1][1]
    else
      time = 1
    end

    if type == "move"
      entries.shift(2)
      entries.each do |k,v|
        if !v.nil?
          parameters << "#{k}: #{v}"
        else
          parameters << k
        end
      end
      values = parameters.join(",")
    end

    output = "TweenMax.to(#{name}, #{time}, {#{values}});"
    output.html_safe
  end

  def parse
    code = object.js
    commands_hash = {}
    raw_commands_array = []
    raw_script = code.gsub(/\r\n/,"").split(";")
    raw_script.each do |command|
      raw_commands_array << command.split(":")
    end
    raw_commands_array
  end
end


# TweenMax.to(cat3, 1, {top:"200", right:"200", repeat: -1, yoyo:true, delay: 1});
