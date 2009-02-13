<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Tournaments</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<script language="JavaScript">
  function changeImage(image, newImage) {
    document[image].src=newImage;
    return;
  }
</script>
</head>

<body>

<jsp:include page="/top.jsp" >
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

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div align="center" style="margin: 0px 10px 0px 10px;">


            <jsp:include page="links.jsp" />
            <jsp:include page="links_summary.jsp" />

            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr><td height="1"><img src="/i/clear.gif" alt="" width="10" height="3" border="0"/></td></tr>
                <tr><td class="tourney_subnav"><strong>Directions</strong></td></tr>
                <tr valign="top">
                    <td width="99%" class="bodyText">
                        
                          <p><b>Directions from Logan Airport (From 1A South)</b><br />
                  Follow signs to Ted Williams Tunnel. The tunnel will connect to 90 West (Mass Pike). 
                  From 90 West, take exit 18. Follow the signs to Cambridge. Go over bridge and onto 
                  River Street. At fourth set of lights, turn right onto Massachusetts Ave. Proceed 
                  through three sets of lights. Turn right after the Fire Station onto Sidney St. 
                  Hotel is one block on left.</p>
                  
                  <p><b>From Western Ma. via the Mass. Pike (I-90)</b><br />
                  Follow Mass. Pike (I-90) east to the Cambridge exit 18 Follow the signs into 
                  Cambridge over the bridge and onto River St. Continue on River St. to the 
                  forth set of traffic lights. Turn right onto Massachusetts Ave. After the third 
                  set of traffic lights, turn right onto Sidney St. Go one block and turn left on 
                  Green St. The Hotel entrance is immediately on your right.</p>
                  
                  <p><b>From Points South via I-93</b><br />
                  From I-93 North, take exit 20. Follow the signs to Massachusetts Ave and turn right 
                  onto Mass Ave. Follow Mass Ave through Boston, over the Harvard Bridge, and into 
                  Cambridge. Stay on Mass Ave. about eight blocks and turn left on Sidney St. Go one 
                  block and turn left on Green St. The Hotel entrance is immediately on your right.</p>
                  
                  <p><b>From Points North via I-93</b><br />
                  I-93 south, take exit 26 &quot;Storrow Drive&quot;. Follow "Storrow Drive West" and take the 
                  &quot;Massachusetts Ave.&quot; exit. Turn right onto Mass Ave. and follow over bridge and into 
                  Cambridge. Stay on Mass Ave. about eight blocks and turn left on Sidney St. Go one block 
                  and turn left on Green St. The Hotel entrance is immediately on your right.</p>
                  
                  <p><b>From Subway/MBTA</b><br />
                  From Boston:<br />
                  Take the red line to Central Square Station. Exit to street level, then cross Mass. 
                  Ave. Go left three blocks and take first right after the fire station onto Sidney Street. 
                  Walk down one block and entrance to hotel is on left on Green Street.<br />
                  From Harvard Square - Alewife:<br />
                  Same as above except stay on same side of the street upon exiting.</p>
                  <p>
                  Hotel@MIT<br />
                  20 Sidney Street<br />
                  Cambridge, MA 02139<br />
                  Telephone: 617.577.0200<br />
                  Fax: 617.494.8366</p>
                       
                       
                    </td>
                </tr>
            </table>

   <br><br>
   </div>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
