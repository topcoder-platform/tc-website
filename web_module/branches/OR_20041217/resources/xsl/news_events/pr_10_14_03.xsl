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

<title>Talbots Licenses .NET Component Catalog From TopCoder Software</title>

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
                <xsl:with-param name="title">&#160;Press Release</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                        <div align="center">
                        <p><span class="bodyTitle">Talbots Licenses .NET Component Catalog From TopCoder Software</span><br />
                        <span class="bodySubTitle"><em>Leading Specialty Retailer Takes Advantage of Competitive Software Development Methodology</em></span></p>
                        </div>
                        
                        <p><strong>GLASTONBURY, Conn., October 14, 2003&#151;</strong>
                        TopCoder, Inc., the leader in on-line programming competition, skills assessment and competitive software development today announced 
                        that Talbots, a large clothing and specialty retailer, has subscribed to the TopCoder Software .NET Component Catalog (<A href="http://www.topcodersoftware.com">www.topcodersoftware.com</A>).  
                        Licensing TopCoder Software's .NET components will complement Talbots' internal development efforts allowing them to build applications more 
                        efficiently.</p>

                        <p>TopCoder Software's .NET and Java Component Catalogs include more than 90 re-usable software components.  Through TopCoder Software's 
                        competition-based methodology, each component has gone through an intensive design, development, and testing process before being published 
                        in the catalogs.</p>

                        <p>"TopCoder is pleased to provide Talbots with leading .NET components.  We continue to leverage our highly skilled member base as a distributed 
                        development resource to create software and provide programming services for our customers," said David Tanacea, president of TopCoder Software.  
                        "The reason the catalog is so powerful is that we are the manufacturer.  Our competition based development approach allows us to develop high quality 
                        software components at a very low cost."</p>

                        <p><span class="bodySubTitle">About Talbots</span><br />
                        Talbots was founded in 1947 in a 17th-century colonial frame house in Hingham, Massachusetts, a suburb of Boston.  The following year, the 
                        Company launched its direct mail business by distributing 3,000 black-and-white flyers to names obtained from The New Yorker magazine.</p>

                        <p>Today, Talbots is a leading national specialty retailer, cataloger and e-tailer of classic apparel, shoes and accessories.  At the end of fiscal year 
                        2002, Talbots operated 886 stores throughout the U.S., Canada and the United Kingdom and its catalog operation circulated approximately 50 million 
                        catalogs worldwide.  Talbots online shopping site is located at <A href="http://www.talbots.com">www.talbots.com</A>.  Each of its three sales channels offers the classic, high quality 
                        merchandise that has been Talbots' trademark for more than 50 years.</p>

                        <p><span class="bodySubTitle">About TopCoder Software</span><br />
                        TopCoder Software harnesses the talent of the internationally ranked TopCoder member base to design, develop and implement cost-effective, high 
                        quality software.  Through a unique competition-based development methodology, TopCoder Software leverages its catalogs of re-usable components 
                        to develop and deliver commercial applications and services.  For more information regarding TopCoder Software, please visit 
                        <A href="http://www.topcodersoftware.com">www.topcodersoftware.com</A>.</p>
 
                        <p>TopCoder is a trademark of TopCoder, Inc. in the United States and other countries.</p>

                        <p>###</p>
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
