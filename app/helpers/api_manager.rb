require './config/environment'

class APImanager
# create a client object with your app credentials
CLIENT = Soundcloud.new(:client_id => "#{ENV['SOUNDCLOUD_CLIENT_ID']}")
# find all sounds of buskers licensed under 'creative commons share alike'
def self.search_tracks(query)
page_size = 50
tracks = CLIENT.get('/tracks', :q => "#{query}", :licence => 'cc-by-sa', :limit => page_size) #:linked_partitioning => 1)


# track_url = 'https://soundcloud.com/ynwmelly/mixed-personalities-feat-kanye-west'
# embed_info = CLIENT.get('/oembed', :url => track_url)
end

end
