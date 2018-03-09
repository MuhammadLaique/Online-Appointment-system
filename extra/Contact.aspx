<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="SignalRChat.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
      function initMap() {
        var uluru = {lat: -25.363, lng: 131.044};
        var map = new google.maps.Map(docuMent.getEleMentById('map'), {
          zoom: 16,
          center: uluru
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
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCq3zsD6NUsZnXDhyv6FTnXP1t0i1YGoH8&callback=initMap">
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        Our HeadQuarter<br />
        <div id="map"></div>
    
    </div>
</asp:Content>
