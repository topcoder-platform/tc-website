<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tccc03_links.xsl"/>
  <xsl:import href="../includes/modules/tccc03summary_links.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
<html>
<head>

<xsl:call-template name="Preload"/>

<title>TopCoder | Tournaments</title>

<!-- Include external CSS files -->
<xsl:call-template name="CSS"/>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

<script language="JavaScript">
  function changeImage(image, newImage) {
    document[image].src=newImage;
    return;
  }
</script>
     
</head>

<body>

<!-- Top begins -->
<xsl:call-template name="Top"/>
<!-- Top ends -->

<a name="top_page"></a>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
              <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">steelgray</xsl:with-param>
                <xsl:with-param name="image">tournaments_gray</xsl:with-param>
                <xsl:with-param name="title">Room 1: Summary &amp; Photos</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="tccc03_links">
                <xsl:with-param name="selectedTab">summary</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="summary_links"/>
    
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
                      
            

            <p><br/></p>
        
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170" valign="top"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="public_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>
<!-- Body Ends -->

<!-- Foot begins -->
<xsl:call-template name="Foot"/>
<!-- Foot ends -->

</body>
</html>

  </xsl:template>
</xsl:stylesheet>


