<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../../top.xsl"/>
  <xsl:import href="../../script.xsl"/>
  <xsl:import href="../../includes/body_top.xsl"/>  
  <xsl:import href="../../foot.xsl"/>
  <xsl:import href="../../includes/modules/practice_room.xsl"/>
  <xsl:import href="../../includes/modules/module_login.xsl"/>  
  <xsl:import href="../../includes/modules/calendar.xsl"/>
  <xsl:import href="../../includes/global_left.xsl"/> 
  <xsl:import href="../../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>      

<title>TopCoder | Employment Services</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">jobs</xsl:with-param>
                <xsl:with-param name="title">&#160;TopCoder Employment Services</xsl:with-param>
            </xsl:call-template>

            <table border="0" cellspacing="10" cellpadding="0" width="100%">
            <tr>
                <td class="bodyText" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/>

<!--body contextual links-->
                        <table width="100%" cellpadding="3" cellspacing="0" border="0">
                            <tr><td valign="middle" bgcolor="#43515E" class="statText"><b>&#160;Yahoo! Jobs</b></td></tr>
                            <tr><td valign="middle" class="bodyText"><A href="/?&amp;t=tces&amp;c=yahoo_openings&amp;a=secure" class="bodyText">Jobs</A></td></tr>
                        </table>

<!-- Client Job List begins -->
                        <p><A href="/?&amp;t=tces&amp;c=yahoo" class="bodyText"><img src="/i/es/yahoo/yahoo_logo.gif" width="137" height="35" alt="Yahoo!" border="0" /></A></p>

                        <h3>Technical Yahoo! Software Engineer (Web Search Crawling)</h3>
                        
                       <p>In the Yahoo! Web Search Crawl team we build scalable systems to discover, retrieve, archive, and analyze billions of documents 
                       accessible on the Web. This comprehensive index of document content and metadata contains the information that is the basis for 
                       our search engine.</p>
                       
                       <p>As a member of our team you will build software to intelligently recognize and navigate increasingly dynamic and personalized 
                       Web content. This content often resides on websites such as online stores, discussion forums, and blogs. Client software must 
                       be able to create logins, store and return HTTP cookies, support secure network connections, and run client-side scripting to 
                       access and discover content on systems such as these. Your challenge will be to create scalable, adaptable, and robust software 
                       to extract the necessary data, recognize server configurations, and to perform the correct set of actions to explore and archive 
                       millions of websites and billions of unique pages.</p>
                       
						<p>You will utilize knowledge of C/C++, network protocols, and system programming to make an immediate contribution to the 
						Yahoo Web crawl team. You will design, develop, and enhance scalable systems and modular software; measure, optimize, and 
						tune system performance; ensure that the software will run reliably and be fault-tolerant in a 24/7 production environment.</p>
						
						<p>Yahoo! Web Search, is passionate about building the best search engine on the planet! As Inktomi, Altavista and All the 
						Web we have powered the largest portals on the Web since 1996. Search is one of the most vital and dynamic technologies 
						behind the Internet! It is full of new challenges and opportunities for innovation. We're looking for world-class, 
						fun-loving engineers to join our team!</p>
						
						
						<p>Experience should include:</p>
						
						<ul>
						<li>C/C++</li></br>
						<li>TCP/IP network programming</li></br>
						<li>Web protocols such HTTP, DNS, and SSL</li></br>
						<li>Data analysis and pattern recognition algorithms</li></br>
						<li>Multi-threaded and asynchronous programming</li></br>
						<li>Unix tools and scripting languages</li>
						</ul>

                        
                       
                        <p><strong>Job Location</strong><br/>
                        Sunnyvale, CA</p>
                        
                        <p align="center"><a href="#" class="bodyText">Apply now!</a> | <a href="/?&amp;t=tces&amp;c=yahoo_openings&amp;a=secure" class="bodyText">Back to Jobs</a></p>

<!-- Client Job List ends -->

                        <p><br/></p>
                        
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="public_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10" bgcolor="#FFFFFF"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>


<xsl:call-template name="Foot"/>

</body>

</html>

  </xsl:template>
</xsl:stylesheet>

