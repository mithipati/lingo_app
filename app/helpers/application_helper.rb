module ApplicationHelper
  def full_title(page_title)
    base_title = "Lingo"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def response_for(item, options = {})
    base_url = "https://ronreiter-meme-generator.p.mashape.com"
    case item
    when "memes"
      if options
        name = url_encode(options[:name]) || "Y U No"
        top = url_encode(options[:top]) || "Y U No"
        bottom = url_encode(options[:bottom]) || "like JavaScript"
        font = url_encode(options[:font]) || "Impact"
        size = options[:size] || 50
        @response = base_url + "/meme?meme=#{name}&top=#{top}&bottom=#{bottom}&font=#{font}&font_size=#{size}"
      else
        "Invalid"
      end
    when "fonts"
      @response = base_url + "/fonts"
    when "images"
      @response = base_url + "/images"
    else
      "Invalid"
    end
  end

  def url_encode(phrase)
    phrase.split.join("%20")
  end

  def uni_get(url)
    Unirest::get url, headers: {
      "Content-Type" => "application/json",
      "Accept" => "application/json",
      "X-Mashape-Authorization" => ENV["MEME_APIKEY"]
    }
  end

end
