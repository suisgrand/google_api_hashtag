require 'google_api_hashtag/version'
require 'json'
require 'net/http'
require 'Remove_non_latin'
require 'Limit_character'
require 'Remove_blank'
require 'Add_hashtag'
require 'Keep_non_blank_in_array'

class GoogleApiHashtag

  GOOGLE_PLACES_URL = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location='

  def process(params)

    #catching the parameters
    lat = params[:lat]
    lng = params[:lng]
    km = params[:km]
    google_Key = params[:google_Key]

    #querying google api
    googleTest = GOOGLE_PLACES_URL + lat + ',' + lng + '&radius=' + km + '&key=' + google_Key
    response = Net::HTTP.get_response(URI.parse(googleTest))

    #removing the single quote character (not needed all for the hashtag)
    response_body = response.body.tr('\'', '')
    my_json = JSON.parse(response_body)

    elements = []
    #populating array
    my_json['results'].each do |steph|
      elements.push(steph['name'])
    end

    #decorative pattern:
    element_processed = Remove_blank.new
    element_processed.pass_on(elements)
    element_processed.extend(Remove_non_latin)
    element_processed.extend(Limit_character)
    element_processed.extend(Add_hashtag)
    element_processed.extend(Keep_non_blank_in_array)

    carl = element_processed.process()

    my_return = {:response => response, :my_array => carl}
    return my_return

    #via: [:get], :constraints => { :lat =>  /[^\/]+/, :lng =>  /[^\/]+/  }
    #response = Net::HTTP.get_response(URI.parse('https://freegeoip.net/json/'))

  end

end
