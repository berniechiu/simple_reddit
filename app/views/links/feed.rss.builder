xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Simple Reddit"
    xml.description "A platform that collects community's favourite links"
    xml.link feed_url

    for link in @links
      xml.item do
        xml.title link.title
        xml.description link.url
        xml.pubDate link.created_at.to_s(:rfc822)
      end
    end
  end
end