<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/module_login.xsl"/>  
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>      

<title>Amazon jobs at TopCoder Employment Services</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

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
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" alt="" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">jobs</xsl:with-param>
                <xsl:with-param name="title">&#160;TopCoder Employment Services</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="10" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0" /><br />

<!--body contextual links-->
                        <table width="100%" cellpadding="3" cellspacing="0" border="0">
                            <tr><td valign="middle" bgcolor="#43515E" class="statText"><b>&#160;Amazon.com Jobs</b></td></tr>
                            <tr><td valign="middle" class="bodyText"><A href="/?&amp;t=tces&amp;c=amazon_openings&amp;a=secure" class="bodyText">Jobs</A></td></tr>
                        </table>

<!-- Client Message Begins -->
                        <p><a href="/?&amp;t=tces&amp;c=amazon" class="bodyText"><img src="/i/es/amazon/amazon_logo.gif" width="139" height="34" alt="Amazon.com" border="0" /></a></p>

                        <p>What makes Amazon.com different?</p>

                        <p>Why do we like it here so much?  The top six reasons all have to do with opportunity. At Amazon.com you get to... </p>
                        
                        <ul>
                            <li>Work with and learn from an unusually high proportion of smart, focused people who are passionate about their work.</li>
                            <li>Work on challenging, interesting projects that have a huge impact on our success.</li>
                            <li>Work in a casual but accountable environment in which hard work, initiative, and smart decisions are rewarded.</li>
                            <li>Play an important part in continuing our leadership in e-commerce by bringing new ideas to the table and launching new businesses.</li>
                            <li>Be rewarded with great career opportunities and the chance to participate financially in the company's long-term success.</li>
                            <li>Have fun!</li>
                        </ul>

                        <p>Amazon.com seeks to be the world's most customer-centric company, a place where people can find and discover 
                        anything they might want to buy online.</p>

                        <p>This mission requires us to think like owners. It requires us to constantly innovate while continuing to provide 
                        our customers with an unparalleled online shopping experience.</p>

                        <p>We operate in huge markets. Consumers spend billions of dollars each year on books, music, DVDs, software, and 
                        electronics, and more and more of them are choosing Amazon.com. We've been able to succeed in these categories by 
                        building superior technology and world-class fulfillment capabilities. But we want to deliver even more for our customers.</p>

                        <p>That's why we're always looking for more great people. More smart, big-picture thinkers to help us innovate, to 
                        take us into new markets and new product and service categories, and to help shape an ever-changing industry. The 
                        opportunity to join us and make an impact on our business and the millions of customers we serve has never been better.</p>

                        <p><A href="/?&amp;t=tces&amp;c=amazon_openings&amp;a=secure" class="bodyText">Click here</A> to see the exciting 
                        positions waiting for you at Amazon.com.</p>
<!-- Client Message Ends -->

                        <p><br /></p>
                        
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" alt="" border="0" /><br />
            <xsl:call-template name="public_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10" bgcolor="#FFFFFF"><img src="/i/clear.gif" width="10" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->
    </tr>
</table>


<xsl:call-template name="Foot"/>

</body>

</html>

  </xsl:template>
</xsl:stylesheet>

