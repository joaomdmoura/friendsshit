atom_feed :language => 'en-US' do |feed|
  feed.title "Friends' Shit"
  feed.updated @updated

  @shits.each do |shit|
    feed.entry( shit ) do |entry|
      entry.friend shit.friends[0].name
      entry.photo image_tag shit.friends[0].photo.thumb('120x122#').url, :type => 'html' if !shit.friends.empty?
      entry.phrase "'#{shit.phrase}'"
      entry.location shit.location
      entry.link "http://www.friendsshit.com/shit/#{shit.id}"
      entry.updated(shit.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 
    end
  end
end