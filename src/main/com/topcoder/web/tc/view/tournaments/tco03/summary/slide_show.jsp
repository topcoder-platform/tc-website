<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Summary - Final Round Photos</title>

<jsp:include page="../../../script.jsp" />

<script language="JavaScript" type="text/javascript">
<!-- Hide from non-JavaScript browsers

var imageDir = "/i/tournament/tco03/download_photos/";
var imageNum = 1;
var totalImages = 316;

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

</head>

<%if (!currImage.equals("")) { %>
<body onload="changeImage('slideImg', <%=currImage%>);">
 <% } else { %>
 <body onload="changeImage('slideImg', 1);">
 <% } %>


<jsp:include page="../../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../../includes/global_left.jsp">
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%">

<jsp:include page="../tco03Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="../tco03Links.jsp" >
   <jsp:param name="selectedContest" value="coding"/>
   <jsp:param name="selectedTab" value="coding_summary"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="../tco03Sublinks.jsp" >
   <jsp:param name="selectedList" value="summary"/>
   <jsp:param name="selectedTab" value="final"/>
</jsp:include>

            <p><br/></p>

            <p class="terciary"><div align="center">
                <a href="Javascript:void changeImage('slideImg', 1);">Reception</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="Javascript:void changeImage('slideImg', 21);">Room 1</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="Javascript:void changeImage('slideImg', 49);">Room 2</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="Javascript:void changeImage('slideImg', 68);">Room 3</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="Javascript:void changeImage('slideImg', 110);">Room 4</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="Javascript:void changeImage('slideImg', 147);">NVIDIA Gathering</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="Javascript:void changeImage('slideImg', 168);">Component Finals</a><br/>

                <a href="Javascript:void changeImage('slideImg', 191);">Intel Presentation</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="Javascript:void changeImage('slideImg', 196);">War Room</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="Javascript:void changeImage('slideImg', 204);">Coding Finals</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="Javascript:void changeImage('slideImg', 254);">Winners</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="Javascript:void changeImage('slideImg', 282);">Press Conference</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="Javascript:void changeImage('slideImg', 304);">Awards Dinner</a>
            </div></p>
            <p>
              <form name="blah" action="/tc">
                <input type="hidden" name="module" value="Static"/>
                <input type="hidden" name="d1" value="tournaments"/>
                <input type="hidden" name="d2" value="tco03"/>
                <input type="hidden" name="d3" value="summary"/>
                <input type="hidden" name="d4" value="slide_show"/>
                <input type="text" value="1" name="<%=CURR_IMAGE_KEY%>" size="3"/>
              </form>
              of
              <script language="JavaScript"><!--
              document.write(totalImages);
             //-->
             </script>
            </p>

            <div align="center">
                <img src="" width="448" height="336" name="slideImg" class="photoFrameBig">
            </div>

            <p class="terciary"><div align="center">
	        &lt;&lt; <a href="#" onClick="prevImage('slideImg');">previous</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onClick="nextImage('slideImg');">next</a> &gt;&gt;</a>
            </div></p>

            <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../../foot.jsp" />

</body>

</html>
