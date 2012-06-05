xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Friends' Shit"
    xml.description "A place to share yout friends shit and get some fun of others shits!"
    xml.link "http://www.friendsshit.com/assets/mini-logo.png"

    for shit in @shits
      xml.item do
        xml.friend shit.friends[0].name
        xml.photo mage_tag shit.friends[0].photo.thumb('120x122#').url if !shit.friends.empty?
        xml.phrase "'#{shit.phrase}'"
        xml.location shit.location
        xml.link "http://www.friendsshit.com/shit/#{shit.id}"
      end
    end
  end
end