class ElementDecorator < Draper::Decorator
  delegate_all

  def command
    commands = parse
    type = commands[0][0].downcase

    case type
      when "animate"
        if commands[1].include?("time")
          time = commands[1][1]
        else
          time = 1
        end
        commands.shift(2)
        animate(time, commands)
      when "onclick", "onmouseup", "onmousedown", "onmouseover", "onmouseout"
        commands.shift
        mouse(type, commands)
    end
  end

  def mouse(type, array)
    parameters = []

    array.each do |k, v|
      if v.strip == "show"
        parameters << "#{k}.style.display = 'inline-block';"
      elsif v.strip == "hide"
        parameters << "#{k}.style.display = 'none';"
      end
    end
    values = parameters.join(" ")
    output = "#{object.id_name}.#{type} = function() {#{values}}"
    output.html_safe
  end

  def animate(time, array)
    parameters = []

    array.each do |k,v|
      if !v.nil?
        parameters << "#{k}: #{v}"
      else
        parameters << k
      end
    end
    values = parameters.join(",")
    output = "TweenMax.to(#{object.id_name}, #{time}, {#{values}});"
    output.html_safe
  end

  def parse
    commands_array = []

    raw_code = object.js
    script = raw_code.gsub(/\)|\}|\\|\(/,"").gsub(/;;/,';').gsub(/; /, ';').gsub(/: /, ':').gsub(/\r\n/,"").split(";")

    script.each do |command|
      if !command.include?("alert")
        commands_array << command.split(":")
      end
    end
    commands_array
  end
end
