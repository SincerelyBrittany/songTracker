require './config/environment'

class APImanager


#
#  def self.get_quote
#
# # create a client object with your app credentials
# # CLIENT = Soundcloud.new(:client_id => "#{ENV['SOUNDCLOUD_CLIENT_ID']}")
# #
# # create client object with app credentials
CLIENT = Soundcloud.new(:client_id => "#{ENV['SOUNDCLOUD_CLIENT_ID']}",
                        :client_secret => "#{ENV['SOUNDCLOUD_CLIENT_ID2']}",
                        :redirect_uri => 'https://example.com/callback')
#
# binding.pry
# # exchange authorization code for access token
# code = params[:code]
# access_token = client.exchange_token(:code => code)
#
# # create client object with access token
# client = Soundcloud.new(:access_token => 'YOUR_ACCESS_TOKEN')
#
# # make an authenticated call
# current_user = client.get('/me')
# puts current_user.username
#
#
# find all sounds of buskers licensed under 'creative commons share alike'
def self.search_tracks(query)
  page_size = 50
  tracks = CLIENT.get('/tracks', :q => "#{query}", :licence => 'cc-by-sa', :limit => page_size) #:linked_partitioning => 1)
end
#
# def self.display_track
#   track_url = 'https://api.soundcloud.com/tracks/835366600/stream"'
#   embed_info = CLIENT.get('/oembed', :url => track_url)
#   puts embed_info['html']
#   # embed_info = CLIENT.get('/oembed', :url => "https://soundcloud.com/ynwmelly/mixed-personalities-feat-kanye-west")
#   # puts embed_info['html']
# end



# def self.stream_track
# # fetch track to stream
# track = CLIENT.get('https://api.soundcloud.com/tracks/835366600/stream')
# binding.pry
# # get the tracks streaming URL
# # @stream_url = CLIENT.get(track.stream_url, :allow_redirects => true)
# # print the tracks stream URL
# tracks = CLIENT.get('/tracks', :limit => 10, :order => 'hotness')
# # print each link
# tracks.each do |track|
#   puts track.permalink_url
# end
# end
end
