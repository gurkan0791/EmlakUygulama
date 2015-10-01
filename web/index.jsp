<%-- 
    Document   : index
    Created on : 07.Ara.2014, 11:44:57
    Author     : sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/main.css" />
        <!--<link rel="stylesheet" href="<%=request.getContextPath()%>/css/iletisimform.css" />-->
        <script src="js/modernizr-latest.js" type="text/javascript"></script>

    <style type="text/css">
       
       
       #map_canvas {width :100%; height: 600px; margin: 0 auto; padding: 0; position: relative; z-index: 3; background-color: rgb(229,227,223); }
       #map_canvas img {max-width: none;}
       #panel {
        position: absolute;
        top: 180px;
        left: 50%;
        margin-left: -180px;
        z-index: 5;
        background-color: #fff;
        padding: 0px;
        border: 1px solid #999;
      }
      .detail_properties {
width: 214px;
background-color: #ffffff;
border-top: 1px dotted #cacaca;
height: 26px;
line-height: 26px;
float: left;
padding: 0 1px 0 0;
margin: 0 10px;
}
.detail_properties label {
float: left;
font-weight: bold;
line-height: 26px;
margin: 0 0 0 3px;
padding: 0;
}
label {
cursor: default;
}
.detail_properties .text {
float: right;
line-height: 26px;
margin: 0 3px 0 0;
padding: 0;
}
.clear {
clear: both;
font-size: 0.1em;
}
    </style>
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
                var geocoder;
                var map;
      function initialize() {
         
        geocoder = new google.maps.Geocoder();
        var latlng= new google.maps.LatLng(38.675124,39.217375);
         
        var mapOptions = {
          center: latlng,
          zoom: 15,
          mapTypeId: google.maps.MapTypeId.HYBRID
        };
            map = new google.maps.Map(document.getElementById('map_canvas'),
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
//            document.getElementById("enlem").value = markers[i][1];
//            document.getElementById("boylam").value = markers[i][2];
//            document.getElementById("evid").value = markers[i][3];
//            document.getElementById("result").value = markers[i][4];
//            document.getElementById("result1").value = markers[i][5];
//            document.getElementById("result2").value = markers[i][6];
//            document.getElementById("result3").value = markers[i][0];
            document.getElementById("fiyat").innerHTML = markers[i][9];
            document.getElementById("odasayisi").innerHTML = markers[i][10];
            document.getElementById("durumu").innerHTML = markers[i][7];
            document.getElementById("metrekare").innerHTML = markers[i][8];
//            
//           document.getElementById("evid1").value = markers[i][3];
            
  
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
        
        
        }  

        
        
              
        
        
//            document.getElementById("enlem").value = lat; 
//            document.getElementById("boylam").value = lng; 
//            document.getElementById("result").value = "";
//            document.getElementById("result1").value = "";
//            document.getElementById("result2").value = "";
//            document.getElementById("result3").value = "";
//            document.getElementById("result4").value = "";
//            document.getElementById("result5").value = "";
//            document.getElementById("result6").value = "";
//            document.getElementById("result7").value = "";
//            document.getElementById("evid").value = "";
       
        
        
        
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
      function codeAddress() {
        var address = document.getElementById('address').value;
        geocoder.geocode( { 'address': address}, function(results, status) {
          if (status ==google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            var marker1 = new google.maps.Marker({
                map: map,
                position: results[0].geometry.location
            });
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        });
      }
    //  google.maps.event.addDomListener(window, 'load', initialize);
  
    </script>
</head>
<body onload="initialize()">
   
    <div id="wrapper">

    <jsp:include page="jsp/AnaSayfa/header.jsp"></jsp:include>
    
        <div id="panel">
          <input id="address" type="text" value="Elazığ, İzzetpaşa">
          <input type="button" value="Yer Ara" onclick="codeAddress()">
        </div>
        <div id="map_canvas">
         <!--Harita-->
        </div>
    
    <div class="detail_properties_outerbox">
        <div class="detail_properties">
            <label>Fiyat</label>
            <div class="text darkred bold"><span id="fiyat"></span></div>
            <div class="clear"></div>
         </div> 
        <div class="detail_properties">
            <label>Metrekare</label>
            <div class="text darkred bold"><span id="metrekare"></span></div>
            <div class="clear"></div>
         </div>  
        <div class="detail_properties">
            <label>Oda Sayısı</label>
            <div class="text darkred bold"><span id="odasayisi"></span></div>
            <div class="clear"></div>
         </div> 
        <div class="detail_properties">
            <label>Durumu</label>
            <div class="text darkred bold"><span id="durumu"></span></div>
            <div class="clear"></div>
         </div> 
        <div class="detail_properties">
            <label>AD</label>
            <div class="text darkred bold">asdl</div>
            <div class="clear"></div>
         </div> 
        <div class="detail_properties">
            <label>AD</label>
            <div class="text darkred bold">asdl</div>
            <div class="clear"></div>
         </div> 
        <div class="detail_properties">
            <label>AD</label>
            <div class="text darkred bold">asdl</div>
            <div class="clear"></div>
         </div> 
        <div class="detail_properties">
            <label>AD</label>
            <div class="text darkred bold">asdl</div>
            <div class="clear"></div>
         </div> 
    </div>
    
<!--    <div id="form-main">
    <div id="form-div">
        <form class="form" id="form2" action="<%=request.getContextPath()%>/MesajGonderServlet">
      
      <p class="name">
        <input name="name" type="text" class="validate[required,custom[onlyLetter],length[0,100]] feedback-input" placeholder="Name" id="name" />
      </p>
      
      <p class="email">
        <input name="email" type="text" class="validate[required,custom[email]] feedback-input" id="email" placeholder="Email" />
      </p>
      
      <p class="text">
        <textarea name="text" class="validate[required,length[6,300]] feedback-input" id="comment" placeholder="Comment"></textarea>
      </p>
      
      
      <div class="submit">
        <input type="submit" value="SEND" id="button-blue"/>
        <div class="ease"></div>
      </div>
    </form>
    </div>
   -->
    <jsp:include page="jsp/AnaSayfa/footer.jsp"></jsp:include>
    </div>
    
    
<!--    <script >
            var form = $('#form2');
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
            
    </script>   -->
</body>
</html>
