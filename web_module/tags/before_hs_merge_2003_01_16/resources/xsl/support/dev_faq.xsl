<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl" />
  <xsl:import href="../script.xsl" />
  <xsl:import href="../includes/body_top.xsl" />  
  <xsl:import href="../foot.xsl" />
  <xsl:import href="../includes/modules/practice_room.xsl" />
  <xsl:import href="../includes/modules/calendar.xsl" />
  <xsl:import href="../includes/support/public_support_left.xsl" /> 
  <xsl:import href="../includes/dev/public_dev_right.xsl" />     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" />
  <xsl:template match="/">
<html>
<head>

	<xsl:call-template name="Preload" />      

<title>TopCoder :: Support/FAQs</title>

	<xsl:call-template name="CSS" />      
 
<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

</head>

<body bgcolor="#FFFFFF" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">

<xsl:call-template name="Top" />

<table width="100%" height="69%" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
	<tr valign="top">
<!-- Left Column Begins -->
		<td width="170" bgcolor="#CCCCCC" valign="top">
			<xsl:call-template name="public_support_left" />
	  	</td>
	<!-- Left Column Ends -->

<!-- Gutter Begins -->
		<td width="4" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="4" height="5" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->	
		<td class="bodyText" width="100%" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="240" height="1" vspace="5" alt="" border="0" /><br />
			<xsl:call-template name="BodyTop">
			<xsl:with-param name="image1">white</xsl:with-param>
			<xsl:with-param name="image">support</xsl:with-param>
			<xsl:with-param name="title">&#160;Development FAQ</xsl:with-param>
			</xsl:call-template>
			
			<table border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" width="100%">
				<tr valign="top">
					<td width="6"><img src="/i/clear.gif" alt="" width="6" height="1" border="0" /></td>
					<td class="bodyText" bgcolor="#FFFFFF" width="100%"><img src="/i/clear.gif" alt="" width="240" height="8" border="0" />
                    		<table width="100%" cellspacing="5" cellpadding="0" border="0">
							<tr valign="top">
								<td class="bodyText" width="100%">
									<p><a href="#1" class="bodyText">How are point values for code submissions determined?</a></p>
                        		
                        				<p><a href="#2" class="bodyText">How do I advance?</a></p>
							
									<p><a href="#3" class="bodyText">It seems like I have the same points as someone else in my room. Who advances?</a></p>

									<p><a href="#4" class="bodyText">How does rating work?</a></p>

									<p><a href="#5" class="bodyText">Why is the point system so complicated?  Are you saying that at the time I submit a solution, I have no idea how many points I will receive for my submission?</a></p>

                        				<p><a href="#7" class="bodyText">How are room assignments done? Will people with similar ratings be assigned to the same room?</a></p>

									<p><strong>More Questions? </strong><a href="/?t=contacts&amp;c=index" class="bodyText"><strong>Contact Us</strong></a></p>
								</td>
							</tr>
                        		
                        		<tr valign="top"><td height="10"><img alt="" src="/images/spacer.gif" width="1" height="10" border="0" /></td></tr>

							<tr valign="top">
								<td class="bodyText" width="100%">
									<p><a name="1" class="bodyText"><strong>How are point values for code submissions determined?</strong></a><br />
									Points are determined based on two factors: the difficulty of the problem and time it took to code once it was opened. 
									The longer it takes to code, the fewer points will be awarded upon submission, and vice versa.<br />
									<a href="#top" class="bodyText">[back to top]</a></p>
									
									<p><a name="2" class="bodyText"><strong>How do I advance?</strong></a><br />
									There is no advancement for the Single Round Matches.  For tournaments, at the end of each round, a certain number 
									of coders from each arena (room) will advance to the next round. The number of coders who advance will depend on 
									the structure of the specific tournament. A specific tournament's advancement structure can be viewed under the 
									details of a specific tournament. In all cases, in order to be considered for advancement, a coder must have either 
									submitted a problem or a submitted a challenge. Otherwise, we would have nothing to go on!<br />
									<a href="#top" class="bodyText">[back to top]</a></p>
									
									<p><a name="3" class="bodyText"><strong>It seems like I have the same points as someone else in my room. Who advances?</strong></a><br />
									In the event that there is a tie, the rules vary for each event.  Check the tie breaker rules for a specific 
									event under the Tournaments section of the web site.<br />
									<a href="#top" class="bodyText">[back to top]</a></p>
									
									<p><a name="4" class="bodyText"><strong>How does rating work?</strong></a><br />
									Rating events occur at the completion of every round, following the system tests. 
     								Single round matches and tournament rounds are considered rated events, and therefore rating will be adjusted 
      								after each.  Finishing first and advancing does not necessarily guarantee your rating will go up. It is 
      								based on your performance compared everyone else participating in that round, taking into account relative 
      								ratings. <a href="/index?t=support&amp;c=ratings" class="bodyText">Click here to see a detailed description of the rating process.</a><br />
									<a href="#top" class="bodyText">[back to top]</a></p>
									
									<p><a name="5" class="bodyText"><strong>Why is the point system so complicated?  Are you saying that at the time I submit a solution, I have no idea how many points I will receive for my submission?</strong></a><br />
									That's exactly what we're saying. The reason the point system needs to be so complex is so that ties are avoided. 
									Time is the only factor we could use to differentiate two coders who otherwise did the same work.<br />
                                    		<a href="#top" class="bodyText">[back to top]</a></p>
                                    
                                        	<p><a name="7" class="bodyText"><strong>How are room assignments done? Will people with similar ratings be assigned to the same room?</strong></a><br />
									Actually, it's the other way around. There are two divisions of rooms: those with ratings 1500 and above, and 
									those will ratings below 1500. All rooms in a division will have roughly the same average room rating. <br />
									<a href="#top" class="bodyText">[back to top]</a></p>
								</td>
							</tr>
							
							<tr><td width="5"><img src="/i/clear.gif" alt="" width="5" height="5" border="0" /></td></tr>
						</table>
					</td>
					<td valign="top" width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
				</tr>
				
				<tr valign="top">
					<td colspan="3" bgcolor="#FFFFFF" width="100%"><img src="/i/clear.gif" alt="" width="1" height="10" border="0" /></td>
				</tr>
			</table>   	
				
			<table border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" width="100%">
				<tr valign="top">
					<td bgcolor="#CCCCCC" width="11" align="right"><img src="/i/clear.gif" alt="" width="11" height="8" border="0" /></td>
					<td width="75"><img src="/i/table_mid_left2.gif" alt="" width="14" height="8" border="0" /></td>
					<td bgcolor="#FFFFFF" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
					<td bgcolor="#CCCCCC" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>	
				
				<tr valign="top">
					<td bgcolor="#CCCCCC" width="11" align="right"><img src="/i/clear.gif" alt="" width="11" height="8" border="0" /></td>
					<td bgcolor="#CCCCCC" width="14"><img src="/i/table_btm_left2.gif" alt="" width="14" height="8" border="0" /></td>
					<td bgcolor="#CCCCCC" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
					<td bgcolor="#CCCCCC" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>
			</table>
		</td>
<!-- Center Column Ends -->

<!-- Gutter begins-->
		<td width="1" bgcolor="#CCCCCC"><img src="/i/clear.gif" width="1" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
		<td width="244" bgcolor="#CCCCCC"><img src="/i/clear.gif" width="244" height="1" alt="" border="0" /><br />
	        <xsl:call-template name="public_dev_right" />       
        </td>
<!-- Right Column Ends -->

	</tr>
</table>

<!--Footer begins-->
	<xsl:call-template name="Foot" />
<!--Footer ends-->

</body>
</html>

	</xsl:template>
</xsl:stylesheet>

