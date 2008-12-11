<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tccc07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
    <script language="JavaScript" type="text/javascript" src="/js/slideShow.js"></script>
    <script type="text/javascript">
        function lpad(val) {
          var temp = ""+val;
          while(temp.length<3) temp="0"+temp;
          return temp;
        }
        var imageNum = 1;
                
        var count = 233;
        var images = new Array(count);
        for (var i=0; i<count; i++) {
            images[i]= "/i/tournament/tccc07/onsitePhotos/"+lpad(i+1)+".jpg";
        }
        function getNextIdx() {
            imageNum = imageNum + 1;
            if (imageNum >= images.length) {
                imageNum = 0;
            }
            preload(imageNum);
            if (imageNum<images.length-1) {
                preload(imageNum+1);
            } else {
                preload(0);
            }
            return imageNum;
        }

        function getPrevIdx() {
            imageNum = imageNum - 1;
            if (imageNum < 0) {
                imageNum = images.length - 1;
            }
            preload(imageNum);
            if (imageNum>0) {
                preload(imageNum-1);
            } else {
                preload(images.length-1);
            }
            return imageNum;
        }

        function changeImage(imageIndex) {
            if (imageIndex < 0) imageNum = 0;
            else if (imageIndex >= images.length) imageNum = images.length-1;
            else imageNum = imageIndex;
            document.getElementById("slideImg").src = images[imageNum];
            document.blah.currImage.value = imageNum+1;
            // document.getElementById("slideImg").alt = descriptions[imageNum];
            document.getElementById('currImage').innerHTML = imageNum + 1;
            // document.getElementById('date').innerHTML = dates[imageNum];
            // document.getElementById('caption').innerHTML = descriptions[imageNum];
        }
        function preload(idx) {
          var img = new Image();
          img.src = images[idx];
        }

    </script>

</head>

<%
    final String CURR_IMAGE_KEY = "currImage";
    String currImage = request.getParameter(CURR_IMAGE_KEY)==null?"":request.getParameter(CURR_IMAGE_KEY);
%>


<%if (!currImage.equals("")) { %>
<body onload="changeImage(<%=currImage%>-1);">
<% } else { %>
<body onload="changeImage(0);">
<% } %>

<div align="center" style="background: transparent;">
    <div id="containAll">
    <div id="content">

        <jsp:include page="nav.jsp" >
        <jsp:param name="tabLev1" value="overview"/>
        <jsp:param name="tabLev2" value="onsiteevents"/>
        <jsp:param name="tabLev3" value="photos"/>
        </jsp:include>

        <div id="pageBody" style="padding-bottom: 400px;">

        <h1><span>Photos</span></h1>
        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                        

            <form name="blah" action="/tc">
                <input type="hidden" name="module" value="Static"/>
                <input type="hidden" name="d1" value="tournaments"/>    
                <input type="hidden" name="d2" value="tccc07"/>
                <input type="hidden" name="d3" value="photos"/>

            <div id="slideShow" align="center">
            
                <a href="Javascript:void changeImage(0);">Reception</a>
                | <a href="#spot" onClick="changeImage(25);">Algo Room 1</a>
                | <a href="#spot" onClick="changeImage(48);">Marathon Match</a>
                | <a href="#spot" onClick="changeImage(69);">Algo Room 2</a>
                | <a href="#spot" onClick="changeImage(92);">Algo Room 3</a>
                | <a href="#spot" onClick="changeImage(122);">Studio</a>
                | <a href="#spot" onClick="changeImage(147);">WildCard</a>
                <br />
                <a href="#spot" onClick="changeImage(172);">Component Finals</a>
                | <a href="#spot" onClick="changeImage(205);">Algorithm Finals</a>
                | <a href="#spot" onClick="changeImage(226);">Winners</a>
                <br /><br />
                <a name="spot"></a>
                <a href="#spot" onClick="changeImage(getPrevIdx());">previous</a>
                [ <strong><span id="currImage"></span></strong>
                of <strong><script type="text/javascript">document.write(images.length);</script></strong> ]
                
                <a href="#spot" onClick="changeImage(getNextIdx());">next</a>
                <br />Go to <input type="text" value="1" name="<%=CURR_IMAGE_KEY%>" size="3"/>
                
                <div id="slideImage" style="margin: 6px 0px;">
                    <img src="#" id="slideImg" alt=""/>
                </div>
            </div>
            </form>
            <br clear="all" />

                    </div>
                </td>
            </tr>
        </table>


        </div>
    <jsp:include page="footer.jsp" />
    </div>
</div>
</body>
</html>

