<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl" />
    <xsl:import href="../script.xsl" />
    <xsl:import href="../includes/body_top.xsl" />  
    <xsl:import href="../foot.xsl" />
    <xsl:import href="../includes/modules/stats_intro.xsl" />  
  <xsl:import href="../includes/global_left.xsl"/>  
    <xsl:import href="../includes/dev/public_dev_right.xsl" />     
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" />
    <xsl:template match="/">

<html>
<head>

    <xsl:call-template name="Preload" />      

 <title>This Week's TopCoder Software Development Project Winners</title>

    <xsl:call-template name="CSS" />      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

</head>

<body>
    <xsl:call-template name="Top" />

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left">
                <xsl:with-param name="level1">development</xsl:with-param>
                <xsl:with-param name="level2">components</xsl:with-param>
                <xsl:with-param name="level3">components</xsl:with-param>
            </xsl:call-template>
          </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="5" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
            <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
            <xsl:with-param name="image1">white</xsl:with-param>
            <xsl:with-param name="image">development</xsl:with-param>
            <xsl:with-param name="title">&#160;Components</xsl:with-param>
            </xsl:call-template>

            <img src="/i/clear.gif" alt="" width="240" height="10" border="0" />
            <table width="100%" border="0">
               <tr>
                  <td width="100%" align="center"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_comp_finals"><img src="/i/tournament/tco03/winners_page_ad.gif" alt="" width="530" height="148" border="0" align="center"/></a></td>
               </tr>
            </table>
            
<!--
            <div align="center">
            
            <img src="/i/development/title_thisweekswinners.gif" alt="This Week's Component Project Winners" width="510" height="55" border="0" />
            
            </div>

            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr valign="middle">
                    <td class="statTextLarge" bgcolor="#999999"><font size="3">Featured Winner</font></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr><td class="formHandleEven" colspan="4"><strong>Coder: </strong><A class="coderTextYellow" href="/stat?c=member_profile&amp;cr=302018"><font size="3"><strong>Tomson</strong></font></A></td></tr>

                <tr valign="top"><td class="bodyText" colspan="4"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td></tr>

                <tr valign="top">
                    <td class="bodyText" rowspan="7" width="1"><img src="/i/clear.gif" alt="" width="5" height="61" border="0" vspace="5" /></td>
                    <td class="bodyText" width="50%">Developer Level:</td>
                    <td class="bodyText" align="right" width="40%"><strong>I</strong></td>
                    <td class="bodyText" width="1"></td>
                </tr>

                <tr valign="top">
                    <td class="bodyText">Rating:</td>
                    <td class="bodyText" align="right"><A href="/stat?c=ratings_history&amp;cr=302018"><strong>1638</strong></A></td>
                    <td class="bodyText"></td>
                </tr>

                <tr valign="top">
                    <td class="bodyText">Total Earnings for All Component Projects*:</td>
                    <td class="bodyText" align="right"><strong>$726.50</strong></td>
                    <td class="bodyText"></td>
                </tr>

                 <tr valign="top">
                    <td class="bodyText">Project Name:</td>
                    <td class="bodyText" align="right"><A href="http://software.topcoder.com/catalog/c_component.jsp?comp=7324513"><strong>CSS Style Object</strong></A></td>
                    <td class="bodyText"></td>
                </tr>

                <tr valign="top">
                    <td class="bodyText">Total Submissions for this Project:</td>
                    <td class="bodyText" align="right"><strong>1</strong></td>
                    <td class="bodyText"></td>
                </tr>

               <tr valign="top">
                    <td class="bodyText">Review Board Score for this Project:</td>
                    <td class="bodyText" align="right"><strong>86.7</strong></td>
                    <td class="bodyText"></td>
                </tr>

                <tr valign="top">
                    <td class="bodyText" colspan="3">
                        <p><strong>Review Board Comment:</strong><br />
                        "Overall it's a quality and clear design."&#151;<A href="/stat?c=member_profile&amp;cr=278595">seaniswise</A></p></td>
                </tr>
                
                <tr valign="top"><td class="bodyText" colspan="4"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td></tr>
            </table>
    
            <br/>

            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr valign="middle">
                    <td class="statTextLarge" bgcolor="#999999"><font size="3">Design Winners</font></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" width="100%" class="formFrame">
                <tr valign="middle">
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="27%">Project Name</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="17%" align="center">Total<br/>Submissions</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="5%" align="right">Place</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="17%">Winner(s)</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="17%" align="center">Board&#160;Score</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="17%" align="right">Total&#160;&#160;<br/>Earnings*</td>
                </tr>
                
                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7351856" class="statText">.NET Simple Cache</a></td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=304976"><strong>giginim</strong></a></td>
                    <td class="formHandleOdd" align="center">75.3</td>
                    <td class="formHandleOdd" align="right">$455.00&#160;&#160;</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7324513" class="statText">CSS Style Object</a></td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=302018"><strong>Tomson</strong></a></td>
                    <td class="formHandleOdd" align="center">86.7</td>
                    <td class="formHandleOdd" align="right">$726.50&#160;&#160;</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=5904558" class="statText">Generic Service</a></td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=277356"><strong>aksonov</strong></a></td>
                    <td class="formHandleOdd" align="center">90.73</td>
                    <td class="formHandleOdd" align="right">$1,944.80&#160;&#160;</td>
                </tr>

            </table>
            
            <br/>

            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr valign="middle">
                    <td class="statTextLarge" bgcolor="#999999"><font size="3">Development Winners</font></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" width="100%" class="formFrame">
                <tr valign="middle">
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="27%">Project Name</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="17%" align="center">Total<br/>Submissions</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="5%" align="right">Place</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="17%">Winner(s)</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="17%" align="center">Board&#160;Score</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="17%" align="right">Total&#160;&#160;<br/>Earnings*</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7213295" class="statText">File Replace</a></td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=309786"><strong>Yi_Zhang</strong></a></td>
                    <td class="formHandleOdd" align="center">81.96</td>
                    <td class="formHandleOdd" align="right">$0.00&#160;&#160;</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=3201991" class="statText">Socket Server Manager</a></td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=299904"><strong>mishagam</strong></a></td>
                    <td class="formHandleOdd" align="center">94.83</td>
                    <td class="formHandleOdd" align="right">$0.00&#160;&#160;</td>
                </tr>


            </table>
-->
        <p><br/></p>

        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="5" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="244">
            <xsl:call-template name="public_dev_right" />        
        </td>
<!-- Right Column Ends -->
    
    </tr>
</table>

<!-- Footer Begins -->
        <xsl:call-template name="Foot" /> 
<!-- Footer Endss -->

</body>
</html>
    </xsl:template>
</xsl:stylesheet>

