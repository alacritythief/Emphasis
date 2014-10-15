class ElementDecorator < Draper::Decorator
  delegate_all

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

    if type.downcase == "move"
      entries.shift(2)
      entries.each do |k,v|
        if !v.nil?
          parameters << "#{k}: #{v}"
        else
          parameters << k
        end
      end
      values = parameters.join(",")
      output = "TweenMax.to(#{name}, #{time}, {#{values}});"
      output.html_safe
    end

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

# mouse example, to be implemented
# cats.onmouseout = function() {
#   wizard.style.display = "inline-block";
#   cats.style.display = "none";
# }
