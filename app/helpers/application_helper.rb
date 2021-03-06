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
        meme_options = {
          :name => "Y%20U%20No",
          :top => "Y%20U%20No",
          :bottom => "like%20JavaScript"
        }.merge(options)

        name = percent_encode(meme_options[:name])
        top = percent_encode(meme_options[:top])
        bottom = percent_encode(meme_options[:bottom])

        full_url = base_url + "/meme?meme=#{name}&top=#{top}&bottom=#{bottom}&font=Impact&font_size=50"
    when "fonts"
      full_url = base_url + "/fonts"
    when "images"
      full_url = base_url + "/images"
    else
      "Invalid"
    end
  end

  def percent_encode(phrase)
    phrase.split.join("%20")
  end

  def uni_get(url)
    Unirest::get url, headers: {
      "X-Mashape-Authorization" => ENV["MEME_APIKEY"]
    }
  end


end
