$: << File.dirname(__FILE__) unless $:.include?(File.dirname(__FILE__))

class String
  def sed!(str)
    match   = nil
    flags   = []
    options = 0
    parts   = str.split('/', -1)
    result  = ''

    raise "Invalid sed command" if parts.length < 3

    if parts.length > 3
      flags = parts[3].split('')
      options |= Regexp::IGNORECASE if flags.include?('i')
      options |= Regexp::EXTENDED   if flags.include?('x')
    end

    options = nil if options.zero?

    case parts[0]
    when 's'
      match = Regexp.new(parts[1], options)
    #when 'y'
      # ???
    else
      raise "Invalid sed command"
    end

    if flags.include?('g')
      self.gsub!(match) { parts[2] }
    else
      self.sub!(match) { parts[2] }
    end

    self
  end

  def sed(str)
    self.clone.sed!(str)
  end
end
