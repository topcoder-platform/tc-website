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

<title>TopCoder to Administer Contest at the 2003 JavaOne(SM) Conference</title>

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
                        <h3>TopCoder to Administer Contest at the 2003 JavaOne<span class="super">SM</span> Conference</h3>
                        JavaOne<span class="super">SM</span> Coding Challenge will be Powered by TopCoder<span class="super">TM</span>
                        </div>

                        <p><strong>GLASTONBURY, CT&#151;May 21, 2003&#151;</strong>TopCoder, Inc., the leader in promotion of 
                        programming talent through online competition, today announced that Sun Microsystems, Inc. (NASDAQ: SUNW) has 
                        selected the company to administer its JavaOne<span class="super">SM</span> Coding Challenge.  TopCoder's sophisticated competition engine has 
                        been customized for Sun, allowing them to host the JavaOne Coding Challenge at their flagship developer conference.  
                        The Challenge is open to all registered onsite attendees of the Conference, being held June 10-13, at the Moscone Center 
                        in San Francisco, CA.</p>

                        <p>"TopCoder is pleased to have been selected to administer this contest," said Jack Hughes, Founder and Chairman of 
                        TopCoder. "The JavaOne conference is the epicenter for all things Java<span class="super">TM</span> technology-related and we are happy to be 
                        able to enhance the experience for programmers who attend the Conference.  Sun's commitment to Java technology is 
                        evident in its continued improvements to the JavaOne conference and its support of TopCoder and its developer base."</p>

                        <p>The JavaOne Coding Challenge offers attendees an opportunity to apply technical knowledge learned during Conference 
                        technical sessions to real-world problems.  The Coding Challenge will center on the Conference themes of Mobility, 
                        Enterprise Applications and Java Web Services.</p>

                        <p>"Sun is dedicated to making the JavaOne conference the essential source for Java technology education and innovation," 
                        said Mike Bellissimo, senior director, Sun Software Developer Marketing and Management.  "We are excited that TopCoder 
                        will offer onsite attendees a practical application testing their knowledge of Java technology learned during the JavaOne 
                        conference."</p>

                        <p>The 2003 JavaOne conference will be held June 10-13 at the Moscone Convention Center in San Francisco, CA.  
                        More details on the Conference can be found at <A href="http://www.java.sun.com/javaone/sf" target="_blank">http://www.java.sun.com/javaone/sf.</A></p>

                        <p><br /></p>

                        <p><strong>About TopCoder, Inc.</strong><br />
                        TopCoder, Inc. organizes and hosts online and onsite programming competitions for a global community of members.  
                        TopCoder members extend across all professional and collegiate levels.  The attraction of competition and the associated 
                        rewards create a powerful community of programmers.  Corporate partners access this member base for employment, 
                        software development and sponsorship.  For registration details or information regarding TopCoder Software, TopCoder 
                        Employment Services or sponsorship of TopCoder Events, please visit <a class="bodyText" href="http://www.topcoder.com">www.topcoder.com.</a></p>

                        <p>Sun, Sun Microsystems, Java and JavaOne are trademarks or registered trademarks of Sun Microsystems, Inc. in the 
                        United States and other countries.</p>

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
