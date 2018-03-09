<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="SignalRChat.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    

<title>File upload without button click - CODE SCRATCHER</title>
   
<<style>
       #map {
        height: 400px;
        width: 40%;
       }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <%--<h3>My Google Maps Demo</h3>
    <div id="map"></div>
        <script>
      function initMap() {
        var uluru = {lat: -25.363, lng: 131.044};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 16,
          center: uluru
        });
        var marker = new google.maps.Marker({
            position: uluru,
            map: map
        });
        var geocoder = new google.maps.Geocoder();
        geocodeAddress(geocoder, map);
      }
      function geocodeAddress(geocoder, resultsMap) {
          var address = "university of gujrat sialkot campus,sialkot,pakistan"; // here is the addreess input.....
          geocoder.geocode({ 'address': address }, function (results, status) {
              if (status === 'OK') {
                  resultsMap.setCenter(results[0].geometry.location);
                  var marker = new google.maps.Marker({
                      map: resultsMap,
                      position: results[0].geometry.location
                  });
              } else {
                  alert('Geocode was not successful for the following reason: ' + status);
              }
          });
      }
    </script>
   
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyANbX1n_VecQvvM44UJWG39d7svoApIWy4&callback=initMap">
    </script>--%>
   <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript">
 
    <asp:Repeater ID="rptMarkers" runat="server">
    <ItemTemplate>
             {
                "title": '<%# Eval("Name") %>',
                "lat": '<%# Eval("Latitude") %>',
                "lng": '<%# Eval("Longitude") %>',
                "description": '<%# Eval("Description") %>'
            }
    </ItemTemplate>
    <SeparatorTemplate>
        ,
    </SeparatorTemplate>
    </asp:Repeater>
    ];
    </script>
    <script type="text/javascript">
 
        window.onload = function () {
            for (i = 0; i < markers.length; i++) {
                var mapOptions = {
                    center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
                    zoom: 6,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                var infoWindow = new google.maps.InfoWindow();
                var map = new google.maps.Map(document.getElementById("dvMap" + (i + 1)), mapOptions);
 
                var data = markers[i];
                var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                var marker = new google.maps.Marker({
                    position: myLatlng,
                    map: map,
                    title: data.title
                });
                (function (marker, data) {
                    google.maps.event.addListener(marker, "click", function (e) {
                        infoWindow.setContent(data.description);
                        infoWindow.open(map, marker);
                    });
                })(marker, data);
            }
        }
    </script>
    <asp:Repeater ID="rptMaps" runat="server">
        <ItemTemplate>
            <div id='dvMap<%# Container.ItemIndex + 1 %>' style="width: 400px; height: 200px">
            </div>
        </ItemTemplate>
        <SeparatorTemplate>
            <hr />
        </SeparatorTemplate>
    </asp:Repeater>
    </form>
</body>

    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>
</html>
