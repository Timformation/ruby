class Link_checker

  def initialize(website)
    @@baseurl = website
    @links = []
  end



  def baseurl
    return @@baseurl
  end



  def baseurl=(baseurl)
    @@baseurl = baseurl
  end



  def add_link(link)
    @links << link
  end

def print_link_count
  ret_str = ""
  ret_str += @links.count.to_s
  return ret_str
end

  def print_valid
    ret_str = ""
    @links.each do |link|
      if link.code == "200"
        ret_str += "#{link}\n"
      end

    end
    return ret_str
  end



  def print_invalid
    ret_str = ""
    @links.each do |link|
      if link.code == "404"
        ret_str += "#{link}\n"
      end

    end
    return ret_str
  end



  def print_redirect
    ret_str = ""
    @links.each do |link|
      if link.code == "301" || link.code == "302"
        ret_str += "#{link}\n"
      end

    end
    return ret_str
  end

end


class Link < Link_checker

  attr_accessor :link, :click_value, :link_type, :code

  def initialize (link, click_value)
    @link = link
    @click_value = click_value
    @link_type = link_type
    @code = code

  end


  def to_s
    ret_str = "#{@link}   #{@click_value}   Code: #{@code}  #{@link_type}"
    return ret_str
  end


  def check_link(link)

    case link

      when '#'
        @link_type = "Internal"

      when /\A\/\//
        @link_type = "Internal"

      when /\A\/\w/
        @link_type = "Internal"
        @link = "https://#{@@baseurl}#{link}"

      when /https:\/\/#{baseurl}\//
        @link_type = "Internal"

      when /http:\/\/#{@@baseurl}/
        @link_type = "Internal"

      when /#{@@baseurl}/
        @link_type = "Internal"

      when /\/\/#{@@baseurl}/
        @link = "https:#{link}"

      else
        @link_type = "External"
    end
  end


  def check_code

    case @link

      when nil
        @code = "404"

      when /\a\/\//
        response = Net::HTTP.get_response(URI("https://#{@@baseurl}#{@link}"))
        @code = response.code

      when "#"
        @code = "200"

      when @@baseurl
        response = Net::HTTP.get_response(URI("https://#{@link}"))
        @code = response.code

      when /\A\/\/#{@@baseurl}\/\w/
        response = Net::HTTP.get_response(URI("https:#{@link}"))
        @code = response.code
      when /https:\/\/#{@@baseurl}/
        response = Net::HTTP.get_response(URI(@link))
        @code = response.code

      when /\A\/\w/
        response = Net::HTTP.get_response(URI("https://#{@@baseurl}#{@link}"))
        @code = response.code

      else
        response = Net::HTTP.get_response(URI(@link))
        @code = response.code
    end
  end
end