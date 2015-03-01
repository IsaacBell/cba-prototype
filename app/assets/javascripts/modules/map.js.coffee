# WIP
$.fn.initMap = ->
  # Example Usage:
  # 
  # <div id="map" width="400" height="400" url="/myJsonData.json" address="225 S Anywhere, Montgomery, Alabama, 23145"> </div>
  # <script type="text/javascript">
  #   $('#map').initMap();
  # </script>

  map         = null
  marker      = null
  markers     = null
  infoWindow  = null
  element     = $(@).get(0)
  url         = $(@).data('url')
  size        = $(@).data('size')
  zoomLevel   = $(@).data('zoom') || 8

  createMarkers = ->
    if !url
      return marker = new google.maps.Marker
        position: latlng # Set a marker at the center address
        map: map
        # animation: google.maps.Animation.DROP
        # icon: 
      # google.maps.event.addListener marker, 'click', showMarker
    markers = $.getJSON(url) ->
      for m in markers # Iterate through the JSON to create markers
        marker = new google.maps.Marker
          position: m.latlng
          map: map
          title: m.name
          animation: google.maps.Animation.DROP
          # icon: 
        google.maps.event.addListener marker, 'click', showMarker

  showMarker = (marker) ->
  # Needs cleaning
    if marker
      # get marker detail information from server
      $.get dataRoot + 'data/' + marker.id + '.html', (data) ->
        # show marker window
        infoWindow.setContent(m.title) # TODO: Show more content
        infoWindow.open map, marker
        return
    else
      alert 'Error marker not found: ' + markerId

  init = ->
    if size
      [width, height] = size.split('x')
      $(@).css({width: Number(width), height: Number(height), background: '#fff'})
   
    wrapperElem = $(@).wrap('<div class="map-wrap"/>').css({background:'#fff'})
    $(@).hide() # To avoid confusing Flash Of Non-interactive Map Content
   
    geocoder = new google.maps.Geocoder
    geocoderParams =
      address: $(@).data('address') || "302 Reed St., Tuscaloosa, Alabama, 35401"
      region: "US"
    results = geocoder.geocode geocoderParams, (results, status) ->
      if status == google.maps.GeocoderStatus.OK
        latlng = results[0].geometry.location
   
        mapOptions =
          mapTypeControl: false
          overviewMapControl: false
          zoom: zoomLevel
          center: latlng
          mapTypeId: google.maps.MapTypeId.ROADMAP
   
        map = new google.maps.Map(element, mapOptions)
        infoWindow = new google.maps.InfoWindow()
        if url then createMarkers(url) else createMarkers()
    $(element).show() # Time to re-show the element

init()
  