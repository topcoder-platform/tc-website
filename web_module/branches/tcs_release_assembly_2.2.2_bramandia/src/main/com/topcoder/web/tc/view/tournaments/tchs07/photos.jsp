<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html> 
<head> 
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/coders.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/tchs07.css"/>
    <title>TopCoder High School 2007</title> 
    <script language="JavaScript" type="text/javascript" src="/js/slideShow.js"></script>
    <script type="text/javascript">
        var imageNum = 1;
        var images =["/i/tournament/tchs07/onsitePhotos/001.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/002.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/003.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/004.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/005.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/006.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/007.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/008.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/009.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/010.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/011.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/012.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/013.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/014.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/015.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/016.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/017.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/018.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/019.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/020.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/021.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/022.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/023.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/024.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/025.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/026.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/027.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/028.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/029.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/030.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/031.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/032.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/033.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/034.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/035.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/036.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/037.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/038.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/039.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/040.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/041.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/042.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/043.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/044.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/045.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/046.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/047.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/048.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/049.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/050.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/051.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/052.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/053.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/054.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/055.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/056.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/057.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/058.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/059.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/060.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/061.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/062.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/063.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/064.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/065.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/066.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/067.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/068.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/069.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/070.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/071.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/072.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/073.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/074.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/075.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/076.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/077.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/078.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/079.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/080.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/081.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/082.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/083.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/084.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/085.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/086.jpg"
            ,"/i/tournament/tchs07/onsitePhotos/087.jpg"
            ];
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
    <div class="content">
        <img src="/i/tournament/tchs07/contentN.png" alt="contentN" style="display: block;" />

        <jsp:include page="links.jsp" >
        <jsp:param name="tabLev1" value=""/>
        <jsp:param name="tabLev2" value=""/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>

        <div class="contentSpacer">
            <h2>Photos from the onsite event</h2>

            <form name="blah" action="/tc">
                <input type="hidden" name="module" value="Static"/>
                <input type="hidden" name="d1" value="tournaments"/>    
                <input type="hidden" name="d2" value="tchs07"/>
                <input type="hidden" name="d3" value="photos"/>

            <div id="slideShow" align="center">
            
                <a name="spot"></a>
                <a href="#spot" onClick="changeImage(getPrevIdx());">previous</a>
                [ <strong><span id="currImage"></span></strong>
                of <strong><script type="text/javascript">document.write(images.length);</script></strong> ]
                
                <a href="#spot" onClick="changeImage(getNextIdx());">next</a>
                <br>Go to <input type="text" value="1" name="<%=CURR_IMAGE_KEY%>" size="3"/>
                
                <div id="slideImage" style="margin: 6px 0px;">
                    <img src="#" id="slideImg" alt=""/>
                </div>

            </div>
            </form>
            <br clear="all" />
        </div>
        <div class="footer">
            Copyright &#169; 2000-2006, TopCoder, Inc. All rights reserved.
        </div>
        <img src="/i/tournament/tchs07/contentS.png" alt="contentS" style="display: block;"/>
    </div>
</div>

</body> 
</html>

