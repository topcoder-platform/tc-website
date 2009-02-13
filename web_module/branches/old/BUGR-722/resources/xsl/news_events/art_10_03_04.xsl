<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>
  <xsl:import href="../includes/pr_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>      

<title>Press Room</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<!-- Header begins -->
<xsl:call-template name="Top"/>
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="180" valign="top">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->	
        <td class="bodyText" width="99%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">press_room</xsl:with-param>
                <xsl:with-param name="title">&#160;</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                        <div align="center">
                        <p><span class="bodyTitle">Triple Threat</span></p>
                        </div>

						<p>
<span class="bodySubtitle">TopCoder offers competition, components and contracts.</span><br/>
Bursting geographic boundaries, Glastonbury, Conn.-based TopCoder pits the best programmers in the world against each other. "Anyone who wants to compete already has a leg up in this world," CTO Michael Lydon says, "be it in sports or, in this case, programming."
<br/><br/>
Indeed, TopCoder is itself a triple threat: It ranks programmers through competitions, has a catalog of commercial software components built by its members, and offers services using a patented process of distributing specifications in the form of problems up for bid.
<br/><br/>
<span class="bodySubtitle">Building a Framework</span><br/>
The company evolved its competitive model with care. In 2001, Chairman and CEO Jack Hughes launched the concept of programming tournaments to assess developers' skills. TopCoder has since extended this platform to yield commercial-grade software components and applications.
<br/><br/>
What's unique about the TopCoder software development methodology? For one, its lean personnel: The organization has only 25 employees; five are product/project managers, but all are software architects. In a typical project, TopCoder project managers do requirements gathering and specification; propose the architecture; and generate a working prototype, a development diagram and the project plan.
<br/><br/>
<span class="bodySubtitle">"Best Shore" Methodology</span><br/>
Sounds like business as usual, but here's where the path diverges: In the design and development phase, TopCoder's "best shore" approach comprises a bidding process in which the best implementation wins. Further, transitioning from specification to design requires breaking the application into components, leading to more generic, reusable designs.
<br/><br/>
The application project, posted on the TopCoder website, provides an overview of the application, eligibility, payment and deliverables. Software designers have four days to ask questions and state their interest. TopCoder selects at least two, sometimes under a non-disclosure agreement. The designers typically have one week to submit their designs to a review board of three paid TopCoder members. All submissions are then rated, from how well the designer interpreted the requirements to the proper use of patterns. The highest-rated design makes it to the development phase.
<br/><br/>
Development is similarly competitive: Developers state their interest in a posted project description, and TopCoder selects at least two to participate. Upon submission, the code undergoes extensive testing. Only one winner is selected. At the back end, it all comes together in the integration and testing phase. After an internal QA certification phase, the application's deployed and tested in the client's environment.
<br/><br/>
<span class="bodySubtitle">For Cash, Royalties and Recognition</span><br/>
Available component design and development contests are listed on the TopCoder website, with prizes ranging from $100-$1,000. Developers also earn royalties based on the quarterly revenue from the TopCoder Component Catalog.
<br/><br/>
Could wanna-bes encroach on TopCoder? Lydon isn't worried. It's too costly, he says, for most to emulate TopCoder's community, catalog and disciplined approach. 
						</p>

                        <p><br /></p>
                        

                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170" valign="top"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="pr_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
<xsl:call-template name="Foot"/>
<!-- Footer ends -->

</body>

</html>

  </xsl:template>
</xsl:stylesheet>
