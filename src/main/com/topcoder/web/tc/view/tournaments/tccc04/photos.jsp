<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Summary</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>

<link type="text/css" rel="stylesheet" href="/css/TCCC04style.css"/>

<script language="JavaScript" type="text/javascript">
<!-- Hide from non-JavaScript browsers

var imageDir = "/i/tournament/tccc04/onsite_photos/";
var imageNum = 1;
var totalImages = 157;

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

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
<jsp:param name="node" value="topcoder_tournaments"/>
</jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%">

<jsp:include page="tccc04Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="tccc04links.jsp" >
   <jsp:param name="tabLev1" value="overview"/>
   <jsp:param name="tabLev2" value="onsite_events"/>
   <jsp:param name="tabLev3" value="photos"/>
</jsp:include>

            <a name="spot"></a>
            <p class="terciary"><div align="center">
                <a href="Javascript:void changeImage('slideImg', 1);">Reception</a>
                &nbsp;&nbsp;|&nbsp;&nbsp;<a href="Javascript:void changeImage('slideImg', 17);">Room 1</a>
                &nbsp;&nbsp;|&nbsp;&nbsp;<a href="Javascript:void changeImage('slideImg', 44);">Room 2</a>
                &nbsp;&nbsp;|&nbsp;&nbsp;<a href="Javascript:void changeImage('slideImg', 67);">Room 3</a>
                &nbsp;&nbsp;|&nbsp;&nbsp;<a href="Javascript:void changeImage('slideImg', 97);">WildCard</a>
                &nbsp;&nbsp;|&nbsp;&nbsp;<a href="Javascript:void changeImage('slideImg', 123);">Component Finals</a>
                &nbsp;&nbsp;|&nbsp;&nbsp;<a href="Javascript:void changeImage('slideImg', 137);">Coding Finals</a><br/>
<%--
                <a href="Javascript:void changeImage('slideImg', 158);">Winners</a>
                &nbsp;&nbsp;|&nbsp;&nbsp;<a href="Javascript:void changeImage('slideImg', 9);">Press Conference</a>
                &nbsp;&nbsp;|&nbsp;&nbsp;<a href="Javascript:void changeImage('slideImg', 10);">Awards Dinner</a>
                &nbsp;&nbsp;|&nbsp;&nbsp;<a href="Javascript:void changeImage('slideImg', 11);">War Room</a>
--%>
            </div></p>

            <table cellpadding="0" cellspacing="5" border="0" align="center">
                <tr valign="middle"><form name="blah" action="/tc"><td class="terciary">&lt;&lt; <a href="#spot" onClick="prevImage('slideImg');">previous</a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td class="terciary">
                        <input type="hidden" name="module" value="Static"/>
                        <input type="hidden" name="d1" value="tournaments"/>
                        <input type="hidden" name="d2" value="tccc04"/>
                        <input type="hidden" name="d3" value="photos"/>
                        <input type="text" value="1" name="<%=CURR_IMAGE_KEY%>" size="3"/> of
                        <script language="JavaScript"><!--
                            document.write(totalImages);
                            //-->
                        </script>
                    </td>
                    <td class="terciary">&nbsp;&nbsp;&nbsp;&nbsp;<a href="#spot" onClick="nextImage('slideImg');">next</a> &gt;&gt;</td></form></tr>
            </table>

            <div align="center">
                <img src="" width="448" height="336" name="slideImg" class="photoFrameBig">
            </div>


         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
