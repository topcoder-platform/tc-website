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

<title>Job Listings for companies who are looking to hire top software engineers and developers at TopCoder Employment Services</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>
<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr valign="top">

<!-- Left Column Begins -->
        <td width="180" valign="top">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="5" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
        <td class="bodyText" width="100%">
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText" width="100%"> 
                    
                        <div align="center"><img src="/i/es/header_looking_for.gif" alt="" width="510" height="68" border="0"/></div>
                       
                        <p><A href="stat?c=member_profile&#38;cr=151144"><img src="/i/es/quote_member.gif" alt="Member quote" width="230" height="194" border="0" align="right" /></A>
                        <img src="/i/clear.gif" width="4" height="16" border="0"/><br/>
                        Our clients are interested in hiring and retaining the industry's top talent. They all believe that their most valuable asset is their 
                        employees. And, like us, they understand the value of making hiring decisions based on an objective measure of coding skill.</p>

                        <p>Only rated members can apply for jobs posted by TCES. This allows companies to differentiate coders 
                        who otherwise look the same on paper. Non-rated members wishing to obtain a rating should review the competition calendar 
                        for the <a class="bodyText"><xsl:attribute name="HREF">/?&amp;t=schedule&amp;c=srm&amp;RoundId=<xsl:value-of select="/TC/TCES/NextSRM/Info/round_id"/></xsl:attribute>next Single Round Match</a> 
                        or <a href="/?&amp;t=schedule&amp;c=index" class="bodyText">click here</a> for a complete list of upcoming Single 
                        Round Matches.<br/><br/></p>
                    </td>
                </tr>
                            
                <tr valign="top">
                    <td class="bodyText" width="100%">
                        <table border="0" cellspacing="0" cellpadding="3" width="100%">
                            <tr valign="middle"><td bgcolor="#999999" class="statText"><font size="3"><strong>Employers</strong></font></td></tr>
                        </table>

                        <table border="0" cellspacing="10" cellpadding="0" width="100%">
                        

<!-- Yahoo begins-->
                            <tr valign="top">
                                <td class="bodyText" align="center"><a href="/?&amp;t=tces&amp;c=yahoo"><img src="/i/es/yahoo/yahoo_logo.gif" width="137" height="35" alt="Yahoo!" border="0" /></a></td>
                                <td width="99%" class="bodyText">You know Yahoo! as an Internet media company, and the hottest guide to everything on the 
                                World Wide Web, but what can you do at a company like this? How can you contribute to the "behind the scenes" action? 
                                Yahoo! has openings for <a href="/?&amp;t=tces&amp;c=yahoo" class="bodyText">Software Engineers.</a><br /><br /></td>
                            </tr>
<!-- Yahoo ends -->                            

							<tr><td colspan="2" bgcolor="#43515E"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td></tr>


<!-- PayPal begins-->
                            <tr valign="top">
                                <td class="bodyText" align="center"><a href="/?&amp;t=tces&amp;c=paypal"><img src="/i/es/paypal/paypal_logo.gif" width="150" height="50" alt="PayPal" border="0" /></a></td>
                                <td width="99%" class="bodyText">PayPal is looking for talented professionals who thrive in a fast paced, exciting environment, and want to constantly 
                                improve a service used by millions each month. PayPal careers offer competitive salary and benefits, an exciting and high-profile product, outstanding 
                                career and growth opportunities and an energetic, team-oriented atmosphere. <a href="/?&amp;t=tces&amp;c=paypal" class="bodyText">Join</a> the online payments revolution!<br /><br /></td>
                            </tr>
<!-- PayPal ends -->
                        
                            <tr><td colspan="2" bgcolor="#43515E"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td></tr>
                        


<!-- Nvidia begins-->
                            <tr valign="top">
                                <td class="bodyText" align="center"><a href="/?&amp;t=tces&amp;c=nvidia"><img src="/i/es/nvidia/nvidia_logo.gif" width="120" height="83" border="0"/></a></td>
                                <td width="99%" class="bodyText">NVIDIA&#174; Corporation (Nasdaq: NVDA) is the worldwide leader in 
                                    graphics processors and media and communications devices.  At NVIDIA we work hard. We thrive on innovation. We 
                                    define the cutting-edge. We deliver to the nth degree. <a href="/?&amp;t=tces&amp;c=nvidia" class="bodyText">Click here</a> 
                                    to check out our open positions.<br /><br /></td>
                            </tr>
<!-- Nvidia ends -->
                        
<!-- Google begins -->
                            <tr valign="top">
                                <td class="bodyText" align="center"><a href="/?&amp;t=tces&amp;c=google"><img src="/i/es/google_sm.gif" width="143" height="59" border="0"/></a></td>
                                <td width="99%" class="bodyText">Google is looking for exceptional people who like to develop innovative new products, especially software 
                                    engineers and tech-savvy product managers. Are you exceptional at what you do? 
                                    <a href="/?&amp;t=tces&amp;c=google" class="bodyText">Click here</a> to view current 
                                    positions available at Google.<br /><br /></td>
                            </tr>
<!-- Google ends -->
                            <tr><td colspan="2" bgcolor="#43515E"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td></tr>

                            






                        </table>

                        <p><br /></p>
                        
                        <p class="smallText">Members please note:<br />
                            By indicating interest in a job, you authorize TopCoder to release your member profile information, 
                            competition statistics, code samples, resume, rating and ranking to the potential employer.  You will 
                            have the ability to update and change your profile information at any time and we encourage you to keep 
                            it updated.  Only TopCoder sponsors and subscribing employers will have access to view your profile 
                            information, competition statistics, code samples, resume, rating and ranking.  The personal information 
                            you provide must be accurate and complete and all registration details (where applicable) must contain 
                            your real name, address and other requested details. You are solely responsible for your personal 
                            information and we may take any action with respect to your personal information we deem necessary or 
                            appropriate if we believe it may cause us to suffer any loss, liability or commercial damage.</p>

                        <p><br /></p>
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="15"><img src="/i/clear.gif" width="15" height="5" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="public_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>

  </xsl:template>
</xsl:stylesheet>
