<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<script>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=no,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

<xsl:call-template name="Preload"/>      

<title>Intel is the title sponsor of the 2003 TopCoder Open</title>

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
        <td width="180">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->	
        <td class="promoText" align="center" width="99%">
            <table border="0" cellspacing="10" cellpadding="0" width="510">
               
                <tr valign="top">
                    <td align="center" width="510">
                        <table border="0" cellpadding="0" cellspacing="0">
                            
                            <tr>
                               <td colspan="2" align="center"><img src="/i/sponsor/intel_ids/IDS_TC-header.gif" width="510" height="115" /></td>
                              </tr>
                            
                            
                            
                            
                            
                            <tr>
                            	<td valign="top" width="275" >
                            		<table>
                            			<tr align="left" >
                            				
                            				
                            				<td class="bodyText" >
                            					<p><br/></p>
                            					<p>With technology complexity increasing at a blistering pace, <a href="https://cedar.intel.com/cgi-bin/ids.dll/registration/regIndex.jsp?action=signup"><strong>Intel&#174; 
                            					Developer Services</strong> </a> offers the resources and opportunities you need to keep stride with industry innovations,
                             					take advantage of emerging technologies and accelerate the successful development and delivery of your solutions.</p>
                             				
                             				<p>How? With offerings such as legacy and emerging code, demos, software documentation, online training, developer forums and 
                            				technical white papers, membership with <a href="https://cedar.intel.com/cgi-bin/ids.dll/registration/regIndex.jsp?action=signup"><strong>Intel Developer 
                            				Services</strong> </a> gives you FREE access to tools and resources that can maximize your code's performance, give you 
                            				time-to-market advantage and make your software sing. Fast.</p></td>
                            		</tr> 
                            		</table>
                            	</td>
                            	
                            	<td>
                            		<table>
                            			<tr width="255" >
                            				<td align="center" ><img src="/i/sponsor/intel_ids/Centrino_Image_embossed.jpg" width="120" height="117" /></td>
                            			</tr>
                            			
                            			<tr>
                            				
                            				<td align ="left">
                            						<table>
                            								<tr>
                            									<td><img src="/i/spacer.gif" height="13" width="13"/></td>
                            									<td class="bodyText" > <p>Register for Intel Developer Services and compete in the TopCoder Open to be entered for a chance to win an Intel Centrino 
                            									mobile-technology- based notebook! <A href="Javascript:openWin('?t=tournaments&#38;c=tco03_intel_specs','comp',510,700);"><strong>View Specs</strong></A>.
                            										<br/><br/><strong><a href="https://cedar.intel.com/cgi-bin/ids.dll/registration/regIndex.jsp?action=signup">Register Now!</a> Use promotion code TCO2003. </strong></p></td>
                            								</tr>
                            								
                            									</table>
                            						
                            						</td>
                            		</tr> 
                            	</table>
                            </td>
                         </tr>
                            
                           
             <tr>
             	<td colspan="2">
             			<p><br/></p>
             	</td>
             </tr>
                        
                        <tr>
                        	<td colspan="2">
                    <p class="promoCallout">
                    
                    <A href="Javascript:openWin('?t=tournaments&#38;c=tco03_intel_sample','comp',510,630);"><strong>Check out a sample</strong></A> of what Intel Developer 
                    Services offers you.  Then join <a href="https://cedar.intel.com/cgi-bin/ids.dll/registration/regIndex.jsp?action=signup"><strong>Intel Developer Services</strong> </a> today and get FREE technical resources designed to help you capitalize on today's technology trends, optimize solutions and fulfill your customers' growing demands. <br/>
                    <br/>Remember to use promotion code TCO2003 and compete in the TCO to be entered for a chance to win an Intel Centrino mobile-technology based notebook! </p>
                        
                        <p><br /></p>

                   
                        	</td>
                        </tr>
                  
                        </table>
                    </td>
                </tr>
                
              
            </table>
        </td>
<!-- Center Column Ends -->

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

<!-- Footer begins -->
<xsl:call-template name="Foot"/>
<!-- Footer ends -->

</body>

</html>

  </xsl:template>
</xsl:stylesheet>
