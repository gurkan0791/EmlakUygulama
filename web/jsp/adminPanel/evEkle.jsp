<%-- 
    Document   : evEkle
    Created on : 07.Ara.2014, 14:54:42
    Author     : sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    <title>JSP Page</title>
    <style type="text/css">
        html, body{height: 100%; margin: 0px; padding: 0px; }
        body{
         //  background:  url(//d36xtkk24g8jdx.cloudfront.net/bluebar/2dc26eb/images/bg/body_noise.png) repeat 50% 50%;
         background-color: gray;
        }
       #map_canvas {width :70%; height: 70%; margin: 0 auto; padding: 0; position: relative; overflow: hidden; transform:translateZ(0px); background-color: rgb(229,227,223); }
       #map_canvas img {max-width: none;}
       .centered {
        width: 100%;
        margin-left: auto;
        margin-right: auto;
        text-align: center;
       }
    </style>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" integrity="sha256-MfvZlkHCEqatNoGiOXveE8FIwMzZg4W85qfrfIFBfYc= sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.fancybox.css">
    <%-- SELECT * FROM evbilgi;--%>
    <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/emlakuygulama" user="root" password="" />     
    <sql:query var="result" dataSource="${dataSource}" >
                    
                    SELECT a.EVID, a.KONUME, a.KONUMB, b.aptadi, b.mahalle, b.sokak, b.aciklama, c.odasayisi, c.durumu, c.metrekare, c.fiyat FROM evbilgi as a INNER JOIN  evadres as b ON a.EVID = b.EVID INNER JOIN evozellik as c ON a.EVID= c.EVID ORDER BY a.EVID ;
    </sql:query>
   
                    <sql:query var="resimgoster" dataSource="${dataSource}">
                            SELECT * FROM evresim;
                    </sql:query>                
                    
    <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?sensor=false&v=3.exp&libraries=places&signed_in=true&region=tr&language=tr&key=AIzaSyDY0kkJiTPVd2U7aTOAwhc9ySH6oHxOIYM">
    </script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.fancybox.pack.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.ajaxfileupload.js"></script>
    <script type="text/javascript">
       
        var markers = [
           <c:forEach var="row" items="${result.rows}">
                       ['<c:out value="${row.aciklama}" />',
                         <c:out value="${row.KONUME}" />,
                         <c:out value="${row.KONUMB}" />,
                         <c:out value="${row.EVID}" />,
                        '<c:out value="${row.aptadi}" />',
                        '<c:out value="${row.mahalle}" />',
                        '<c:out value="${row.sokak}" />',
                        '<c:out value="${row.durumu}" />',
                        '<c:out value="${row.metrekare}" />',
                        '<c:out value="${row.fiyat}" />',
                        '<c:out value="${row.odasayisi}" />'],
            </c:forEach>   ];  
                
         var resimler = [
        <c:forEach var="sonuc" items="${resimgoster.rows}">
                [
                    <c:out value="${sonuc.ID}" />,
                    <c:out value="${sonuc.EVID}" />,
                    '<c:out value="${sonuc.resim}" />'            
                    
                ],      
        </c:forEach>  
         ];     
                
      function initialize() {
         
                
        var latlng= new google.maps.LatLng(38.675124,39.217375);
         
        var mapOptions = {
          center: latlng,
          zoom: 15,
          mapTypeId: google.maps.MapTypeId.SATELLITE
        };
        var map = new google.maps.Map(document.getElementById('map_canvas'),
            mapOptions);
       //map.setTilt(45);
               
        
        
        
        var image = {
            url: '<%=request.getContextPath()%>\\resimler\\kucukevv.png',
            // This marker is 20 pixels wide by 32 pixels tall.
            size: new google.maps.Size(34, 34),
            // The origin for this image is 0,0.
           origin: new google.maps.Point(0,0),
            // The anchor for this image is the base of the flagpole at 0,32.
            anchor: new google.maps.Point(0, 34)
        };
          //yeni
        
        var infoWindow = new google.maps.InfoWindow(), marker, i;
        for( i = 0; i < markers.length; i++ ) {
        var position = new google.maps.LatLng(markers[i][1],markers[i][2]);
     
        marker = new google.maps.Marker({
            position: position,
            map: map,
            title: markers[i][0],
            icon:image
        });
        google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
            document.getElementById("enlem").value = markers[i][1];
            document.getElementById("boylam").value = markers[i][2];
            document.getElementById("evid").value = markers[i][3];
            document.getElementById("result").value = markers[i][4];
            document.getElementById("result1").value = markers[i][5];
            document.getElementById("result2").value = markers[i][6];
            document.getElementById("result3").value = markers[i][0];
            document.getElementById("result4").value = markers[i][9];
            document.getElementById("result5").value = markers[i][10];
            document.getElementById("result6").value = markers[i][7];
            document.getElementById("result7").value = markers[i][8];
            
           document.getElementById("evid1").value = markers[i][3];
        
  
//            $.fancybox([{
//    href: "<%=request.getContextPath()%>\\resimler\\mimariya.JPG",
//    title: "fist title"
//}, {
//    href: 'http://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Tootsi_jaamahoone.jpg/800px-Tootsi_jaamahoone.jpg',
//    title: "second title"
//}, {
//    href: "http://farm4.staticflickr.com/3818/9036037912_83576fe5ab_b.jpg",
//    title: "third title"
//}], {
//    
//       padding: 0        
//}); 
        var leng = resimler.length;
        var photos = new Array();
        var sayac = 0;
        for(var k=0; k<leng;k++){
            if(resimler[k][1]===markers[i][3]){
        photos[sayac] = {href : '<%=request.getContextPath()%>\\resimler\\'+resimler[k][2], title : 'Ev Resim'};
            sayac++;
            }
        }
        
        
       // photos = [ {href : '<%=request.getContextPath()%>\\resimler\\ekran1.JPG', title : 'Title'}, {href : '<%=request.getContextPath()%>\\resimler\\ekran3.JPG', title : 'Title'} ];
       $.fancybox(photos,{
    'openEffect'    :   'elastic',
    'closeEffect'   :   'elastic',
    'nextEffect'    :   'fade',
    'openSpeed'     :   600, 
    'closeSpeed'    :   200
       }
       ); 



        // fancybox   
            //infoWindow.setContent('');
           // infoWindow.setContent('<img  src=ev.png >');
            //infoWindow.open(map, marker);
        }
        })(marker, i));
        
        
        google.maps.event.addListener(marker, "mouseover", (function (marker,i) { 
            var pictureLabel = document.createElement("img");
            pictureLabel.src = "<%=request.getContextPath()%>\\resimler\\kucukevv.png";
            return function(){
                
               
            }
            
        })(marker, i));
        
        }  
//       
         //yeni
        
//        google.maps.event.addListener(map, "rightclick", function(event) {
//            var lat = event.latLng.lat();
//            var lng = event.latLng.lng();
//            // populate yor box/field with lat, lng
//            alert("Lat=" + lat + "; Lng=" + lng);
//        });
        
        google.maps.event.addListener(map, 'click', function(event) {
            placeMarker(event.latLng);
            evBilgiYaz(event.latLng);
         });
       
        function placeMarker(location) {
            var marker = new google.maps.Marker({
                position: location, 
                map: map,
                icon:image
            });
        }
        
        function evBilgiYaz(location){
          //  map.setCenter(location);
         //   map.panTo(location);
            
            var lat = location.lat(); // enlem
            var lng = location.lng();
        // populate yor box/field with lat, lng
        //alert("Lat=" + lat + "; Lng=" + lng);
            document.getElementById("enlem").value = lat; 
            document.getElementById("boylam").value = lng; 
            document.getElementById("result").value = "";
            document.getElementById("result1").value = "";
            document.getElementById("result2").value = "";
            document.getElementById("result3").value = "";
            document.getElementById("result4").value = "";
            document.getElementById("result5").value = "";
            document.getElementById("result6").value = "";
            document.getElementById("result7").value = "";
            document.getElementById("evid").value = "";
        }
        
        
        
//        var infowindow1 = new google.maps.InfoWindow({
//            content: 'Selam Açıklama Buraya'
//           });
//         google.maps.event.addListener(infowindow1,'domready' ,function(){ 
//         
//            $(infowindow1).click(function () {
//              alert("Hello World");
//            });
//            }); 
//           
           
//        var myLatlng = new google.maps.LatLng(e, b);
//        var marker = new google.maps.Marker({
//            position: myLatlng,
//            map: map,
//            title: 'Hello World!',
//            icon: image
//        });
//        var myLatlng = new google.maps.LatLng(e+1, b);
//        var marker1 = new google.maps.Marker({
//            position: myLatlng,
//            map: map,
//            title: 'Hello World!',
//            icon: image
//        });
        
//         google.maps.event.addListener(marker, 'click', function() {
//            infowindow.open(map,marker);
//            var latitude = event.latLng.lat();
//            var longitude = event.latLng.lng();
//            alert(this.position);
//           console.log( latitude + ', ' + longitude );
     //   });
        
      }
    //  google.maps.event.addDomListener(window, 'load', initialize);
  
    </script>
</head>
<body onload="initialize()">
   
  <!--Hoşgeldiniz :--> 
  <%--<%=request.getSession().getAttribute("ad") %>--%>
  <c:choose>
    <c:when test="${empty sessionScope.ad}">
    <div><h3><p style="padding-top: 500px; margin: 0 auto; text-align: center;">  <a href="<%=request.getContextPath()%>/jsp/adminPanel/adminPanel.jsp"  > Lütfen Giriş Yapın!</a></p><h3></div>
    </c:when>
    <c:otherwise>
        
        <h3  style="color:white;"> Hoşgeldiniz :   <c:out value="${sessionScope.ad}"></c:out></h3>
    <div id="map_canvas">

    </div>
    
     
    
      <div class="container">
    <div id="bilgi" style="margin:0 auto; text-align: center;">
       Arsa Ekle :  <input type="radio" name="b" class="a" id="secim" onclick="goster();"></input>
       Ev Ekle :  <input type="radio" name="b" class="a" id="secim1" onclick="goster();"></input>
        <form class="formAlani1" name="form1" id="form1" method="GET" action="<%=request.getContextPath()%>/EvKaydetServlet">
            <pre>
            <h2>Gayrimenkul eklemek için ilk önce harita üzerinden konum seçin</h2>
          Enlem        : <input type="text" class="input-sm" id="enlem" name="enlem"/><br />
          Boylam       : <input type="text" class="input-sm" id="boylam" name="boylam"/><br />
                  <input type="hidden" id="evid" name="evid"></input>
            
          Apartman Adı : <input  class="input-sm" id="result" name="aptadi" type="text"/><br />
          Mahalle      : <input  class="input-sm" id="result1" name="mahalle" type="text"/><br />
          Sokak        : <input  class="input-sm" id="result2" name="sokak" type="text"/><br />
          Açıklama     : <textarea id="result3"  name="aciklama" rows="3" cols="18"></textarea><br />
          Fiyat        : <input  class="input-sm" id="result4" name="fiyat" type="text"/><br />
          Oda Sayısı   : <input  class="input-sm" id="result5" name="odasayisi" type="text"/><br />
          Durumu       : <input  class="input-sm" id="result6" name="durumu" type="text"/><br />
          Metrekare    : <input  class="input-sm" id="result7" name="metrekare" type="text"/><br />
             <input type="submit" class="btn btn-success" value="Kaydet" id="kaydet"/>   <input type="button" class="btn btn-warning" value="Güncelle" id="guncelle"/>
             </pre>
        </form>
            <form class="formAlani2" id="form1" style="display:none;">
                <pre>
                   Enlem:  <input type="text" id="enlem" name="enlem"/><br />
                   Boylam: <input type="text" id="boylam" name="boylam"/><br /> 
                   Metrekare :     <input  id="result7" name="metrekare" type="text"/><br />
                </pre>
            </form>
            
    </div>
            <div style="text-align: center; margin: 0 auto; ">
            <form id="form2" method="GET">
                <div >
                   
                        <h4>Seçilen Eve Resim Yükle</h4>
                        <input type="file" class="btn btn-info" name="file" style="margin: 0 auto;" />
                        <div id="upload" style="display: none;">Uploading..</div>
                        <div id="message"></div>
                </div>
            </form>
                </div>
<script type="text/javascript">
       
       
//$(document).ready(function() {
  $('input[type="file"]').click(function() {
      
    var a=  $('#evid1').val();
    if(typeof a == "undefined" || a == null || a.length<0){
        alert("Lütfen Ev Seçin");
        return;
    }
  $('input[type="file"]').ajaxfileupload({
      'action' : "<%=request.getContextPath()%>/"+'UploadFile?evida='+a,
  'onComplete' : function(response) {
      $('#upload').hide();
      $('#message').show();
                        
      var statusVal = JSON.stringify(response.status);

     if(statusVal == "false")
     {
     $("#message").html("<font color='red'>"+JSON.stringify(response.message)+"</font>");
     }  
     if(statusVal == "true")
     {
     $("#message").html("<font color='green'>"+JSON.stringify(response.message)+"</font>");
     }        
     setTimeout(function() { location.reload() },2000);
},
'onStart' : function() {
        $('#upload').show();
        $('#message').hide();
}
});

});
//});        
        
        
        
$(document).ready(function(){
   $(".a").click(function(event){
       if ($("#secim").is(':checked')) {
            $(".formAlani1").hide();
             $(".formAlani2").show();
        }else{
            $(".formAlani1").show();
             $(".formAlani2").hide();
        }
        
     
   });
   
});




var guncel = $('#guncelle');
var form = $('#form1');
form.submit(function () {
 
$.ajax({
type: form.attr('method'),
url: form.attr('action'),
data: form.serializeArray(),
success: function (data) {
//var result=data;

//$('#result').attr("value",result);
alert("Ev Kaydedildi.");
}
});
 
return false;
});

$(document).ready(function(){
 $("#guncelle").click(function(){
            var form_data = $("#form1").serialize();
            $.ajax({
            url: "<%=request.getContextPath()%>/EvGuncelleServlet",
            type: 'GET',
            data: form_data,
            success: function (data) {
             // $("#searchresults").html(data);
             alert("Güncellendi");
            }
    });
    return false;
  });
});
</script>
            <input type="text" id="evid1" name="evid1" ></input>
          
            </c:otherwise>
</c:choose>
            <pre>
<footer>
        <div class="footer-left">Copyright@ 2014</div>
        <div style="float: right;"><a href="<%=request.getContextPath()%>/index.jsp">AnaSayfa Git</a></div>
</footer>
</pre>
</div>
</body>
</html>
