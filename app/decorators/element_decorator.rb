class ElementDecorator < Draper::Decorator
  delegate_all

  def command
    commands = parse
    type = commands[0][0].downcase

    if commands[1][0] == "time"
      time = commands[1][1]
    else
      time = 1
    end

    if type == "move"
      commands.shift(2)
      move(time, commands)
    end
  end

  def move(time, array)
    name = object.id_name
    parameters = []

    array.each do |k,v|
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

  def parse
    commands_array = []
    raw_code = object.js
    script = raw_code.gsub(/\r\n/,"").split(";")

    script.each do |command|
      commands_array << command.split(":")
    end
    commands_array
  end

end

# mouse example, to be implemented
# cats.onmouseout = function() {
#   wizard.style.display = "inline-block";
#   cats.style.display = "none";
# }
