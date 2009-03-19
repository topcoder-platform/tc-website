<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
<script language="JavaScript" type="text/javascript">
<!-- Hide from non-JavaScript browsers

var imageDir = "/i/tournament/tccc06/onsitePhotos/";
var imageNum = 1;
var totalImages = 221;

<%
    final String CURR_IMAGE_KEY = "currImage";
    String currImage = request.getParameter(CURR_IMAGE_KEY)==null?"":request.getParameter(CURR_IMAGE_KEY);
%>

function lpad(val) {
  var temp = ""+val;
  while(temp.length<4) temp="0"+temp;
  return temp;
}

function getNextImage() {
    imageNum = (imageNum+1) % (totalImages+1);
    if (imageNum==0) imageNum++;
    var new_image = imageDir+lpad(imageNum)+".jpg";
    return(new_image);
}

function getPrevImage() {
    imageNum = (imageNum-1) % (totalImages+1);
    if (imageNum==0) imageNum=totalImages;
    var new_image = imageDir+lpad(imageNum)+".jpg";
    return(new_image);
}

function prevImage(place) {
    var new_image = getPrevImage();
    document.blah.<%=CURR_IMAGE_KEY%>.value = imageNum;
    document[place].src = new_image;
}

function nextImage(place) {
    var new_image = getNextImage();
    document.blah.<%=CURR_IMAGE_KEY%>.value = imageNum;
    document[place].src = new_image;
}

function changeImage(place, imageIndex) {
    var temp = imageIndex;
    if (imageIndex>totalImages) {
      temp = totalImages;
    } else if (imageIndex<1) {
      temp = 1;
    }
    imageNum = temp;
    var new_image = imageDir+lpad(temp)+".jpg";
    document.blah.<%=CURR_IMAGE_KEY%>.value = temp;
    document[place].src = new_image;

}
// End Hiding -->
</script>
<%if (!currImage.equals("")) { %>
<body onload="changeImage('slideImg', <%=currImage%>);">
<% } else { %>
<body onload="changeImage('slideImg', 1);">
<% } %>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="onsite_events"/>
<jsp:param name="tabLev3" value="photos"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<span class="bigTitle">Onsite Photos</span>
<br><br>
            <a name="spot"></a>
            <p class="terciary"><div align="center" nowrap="nowrap">
                <a href="Javascript:void changeImage('slideImg', 1);">Reception</a>
                 | <a href="Javascript:void changeImage('slideImg', 15);">Room 1</a>
                 | <a href="Javascript:void changeImage('slideImg', 65);">Room 2</a>
                 | <a href="Javascript:void changeImage('slideImg', 98);">Room 3</a>
                 | <a href="Javascript:void changeImage('slideImg', 147);">WildCard</a>



<br>
                 <a href="Javascript:void changeImage('slideImg', 171);">Component Finals</a>
                | <a href="Javascript:void changeImage('slideImg', 195);">Algorithm Finals</a>
                 | <a href="Javascript:void changeImage('slideImg', 212);">Winners</a>
<%--
                 | <a href="Javascript:void changeImage('slideImg', 145);">Press Conference</a>
--%>            

                
            </div></p>
            
            <table cellpadding="0" cellspacing="5" border="0" align="center">
                <tr valign="middle"><form name="blah" action="/tc"><td class="bodyText">&lt;&lt; <a href="#spot" onClick="prevImage('slideImg');">previous</a>&#160;&#160;&#160;&#160;</td>
                    <td class="terciary">
                        <input type="hidden" name="module" value="Static"/>
                        <input type="hidden" name="d1" value="tournaments"/>
                        <input type="hidden" name="d2" value="tccc06"/>
                        <input type="hidden" name="d3" value="photos"/>
                        <input type="text" value="1" name="<%=CURR_IMAGE_KEY%>" size="3"/> of 
                        <script language="JavaScript"><!--
                            document.write(totalImages);
                            //-->
                        </script>
                    </td>
                    <td class="terciary">&#160;&#160;&#160;&#160;<a href="#spot" onClick="nextImage('slideImg');">next</a> &gt;&gt;</td></form></tr>
            </table>

            <div align="center">
                <img src="" width="448" height="336" name="slideImg" class="photoFrameBig">
            </div>

        </div>
      </td>
        
         
<!-- Right Column-->
        <td width="170" align="right">
            <jsp:include page="../right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
