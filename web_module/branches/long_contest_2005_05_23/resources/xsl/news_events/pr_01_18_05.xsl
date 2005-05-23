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

<title>TopCoder&#174; Announces Motorola as Premier Sponsor of TCCC05</title>

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
                        <p><span class="bodyTitle">TopCoder&#174; Announces Motorola as Premier Sponsor of 2005 TopCoder Collegiate Challenge</span><br />
                        <span class="bodySubTitle"><em>Global Leader in Wireless, Broadband and Automotive Communications Technologies Sponsors World Championship of Programming Scheduled for March 11th in Santa Clara, CA</em></span></p>
                        </div>
                        
                        <p><strong>GLASTONBURY, CT, January 18, 2005&#151;</strong>
                        TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced Motorola, Inc., (NYSE: MOT), a global leader in wireless, broadband and automotive communications technologies, as a premier sponsor for its 2005 TopCoder Collegiate Challenge (TCCC 05).  The TCCC 05 will bring many of the world's finest student programmers together in competition over the course of ten weeks for international ranking, notoriety and a share of the $150,000 prize purse for Algorithm, Component Design and Development categories. Details and rules are provided at: <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=about">http://www.topcoder.com/tccc05</A>.
                        <br /><br />
                        "Motorola is proud to be a sponsor of the worldwide TopCoder tournament, one of the most demanding and entertaining technical competitions for inventive and innovative software programmers in the world," said Anson Chen corporate vice president of Motorola's Global Software Group (GSG). "We value TopCoder's leadership in developing the software talent we need to grow our 19 software centers worldwide."
                        <br /><br />
                        Over 1,300 students from around the world will begin competing in qualifying rounds of the TCCC 05. Through a series of online rounds, this field will be narrowed to 32 final competitors comprised of 24 Algorithm and 8 Component competitors. These finalists will compete in face-to-face competition at the Santa Clara Marriot in California on March 10th and 11th to determine the winners of all competitions. The TCCC 05 marks the first time Motorola has participated in a major TopCoder tournament. 
                        <br /><br />
                        "The demands of the TopCoder Collegiate Challenge require the same spirit of competition and applied energy that is the hallmark of true industry leaders," said Rob Hughes, president of TopCoder. "With such a longstanding history of excellence in edge technologies for communications, Motorola is a welcome sponsor to our program of events."
                        <br /><br />
                        <span class="bodySubtitle">About Motorola</span><br />
                        Motorola is a Fortune 100 global communications leader that provides seamless mobility products and solutions across broadband, embedded systems and wireless networks.  In your home, auto, workplace and all spaces in between, seamless mobility means you can reach the people, things and information you need, anywhere, anytime.  Seamless mobility harnesses the power of technology convergence and enables smarter, faster, cost-effective and flexible communication.  Motorola had sales of US$27.1 billion in 2003.  For more information: <A href="http://www.motorola.com">www.motorola.com</A>.
                        <br /><br />
                        <span class="bodySubtitle">About TopCoder, Inc.</span><br />
                        TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.
                        <br /><br />
                        TopCoder is a trademark of TopCoder, Inc. in the United States and other countries.
      						</p>
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
