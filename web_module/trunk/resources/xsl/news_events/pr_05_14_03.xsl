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

<title>TopCoder and CAS Announce 2003 TopCoder High School Challenge</title>

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
                    <td class="bodyText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                        <div align="center">
                        <h3>TopCoder and the Connecticut Association of Schools Announce the 2003 TopCoder High School Challenge</h3>
                        <p>Java(tm), C&#43;&#43; and C&#35; Computer Programming Tournament Will Crown the Best High School 
                        Programming Team in Connecticut</p>
                        </div>

                        <p><strong>GLASTONBURY, CT&#151;May 14, 2003&#151;</strong>TopCoder, Inc., the leader in promotion of 
                        programming talent through on-line competition, today announced the final round of the 
                        <a class="bodyText" href="http://highschool.topcoder.com/">2003 TopCoder High School Challenge.</a>  It will be 
                        held on Tuesday, May 20th at the University of Connecticut's Storrs campus in the Homer Babbidge Library. This computer 
                        programming tournament is made possible due to the collaborative efforts of TopCoder, Inc. and the Connecticut 
                        Association of Schools (CAS).</p>

                        <p>"UConn is proud to support the 2003 TopCoder High School Challenge.  This initiative captures the interest of bright 
                        high school students here in Connecticut, and promotes their interest in technology.  We look forward to seeing them here 
                        next week," said Peter Murray, UConn's Director of Library Information Services.</p>

                        <p>The 2003 TopCoder High School Challenge began in March with an eight-week schedule of qualifying rounds.  These 
                        competitions welcomed dozens of Connecticut's best young programmers to compete online, in real time, each week.  
                        Ten Connecticut high school teams have qualified to compete in the tournament finals.  To be eligible for the finals, at 
                        least three programmers from each school must have competed in four of the eight qualifying rounds.  During these 
                        qualifying rounds, the average of the top three scores from each school was used to determine which school would win 
                        for the week.</p>

                        <p>"The endorsement from CAS has allowed us to offer this real-world, high-tech competition to Connecticut High 
                        School students.  The 2003 TopCoder High School Challenge brings to these incredibly talented high school students 
                        the same platform that TopCoder offers to college students and professionals each week," said Rob Hughes, president of 
                        TopCoder.  "The high school tournament's eight week season has been exciting so far, but the thrill of competition will 
                        intensify when the coders are together competing head-to-head at UConn."</p>

                        <p>"CAS is delighted to be able to offer a credible and exciting academic competition to Connecticut high school students.  
                        With this event, we're seeing the same positive benefits derived from competition among students representing their 
                        schools that we've seen in athletics," said Mike Savage, executive director of CAS.  "It's great that we're able to partner 
                        with TopCoder to put technology and real world problems in the hands of high school students.  We are looking forward to 
                        seeing a great competition at UConn."</p>

                        <p><br /></p>

                        <p><strong>About TopCoder, Inc.</strong><br />
                        TopCoder, Inc. organizes and hosts online and onsite programming competitions for a global community of members.  
                        TopCoder members extend across all professional and collegiate levels.  The attraction of competition and the associated 
                        rewards create a powerful community of programmers.  Corporate partners access this member base for employment, 
                        software development and sponsorship.  For registration details or information regarding TopCoder Software, TopCoder 
                        Employment Services or sponsorship of TopCoder Events, please visit <a class="bodyText" href="http://www.topcoder.com">www.topcoder.com.</a></p>

                        <p><strong>About the Connecticut Association of Schools</strong><br />
                        The Connecticut Association of Schools is chartered by the State of Connecticut as a non-profit, tax-exempt educational 
                        organization serving schools, their students and staff, in all areas of operation.  CAS has emerged as an informed leader 
                        within Connecticut's education system, providing services to well over 1,100 member schools in areas ranging from 
                        academics to athletics.  CAS' mission is to serve as advocates for children while striving to strengthen the professional 
                        skills and talents of the school leaders of Connecticut.</p>
                        
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
