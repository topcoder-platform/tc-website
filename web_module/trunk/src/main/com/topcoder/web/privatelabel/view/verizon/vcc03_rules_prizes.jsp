<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Private Label Registration</title>

<SCRIPT type="text/javascript">
if ( window.navigator.userAgent.indexOf("Linux")>-1 ) {
  // Linux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/corpStyle_linux.css"/>');
} else {
  // NonLinux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/corpStyle.css"/>');
}
</SCRIPT>

<jsp:include page="../script.jsp" />

</head>

<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1"></td>
<!-- Gutter Ends -->

<!-- Left Column Begins-->
         <td>
         <p><img src="/i/clear.gif" width="180" height="60" border="0"/><br />
         <a href="/" ><img src="/i/tournament/vcc03/vcc03_left.gif" width="180" height="74" border="0"/></a><br />
         <img src="/i/clear.gif" width="180" height="60" border="0"/><br />
         <img src="/i/tournament/vcc03/vcc03_right.gif" width="180" height="400" border="0"/><br  />
         <img src="/i/clear.gif" width="180" height="40" border="0"/>
         </p>
         </td>         
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
        <td class="bodyText" width="100%">
<!-- TCO Header -->
   <p><br /></p>
   <div align="center"><img src="/i/tournament/vcc03/vcc03.gif" alt="Verizon Coding Challenge" width="500" height="120" border="0" vspace="0" /></div>
   <p><br /></p>

<!-- Tab bar links-->
            <xsl:call-template name="vcc03_links">
                <xsl:with-param name="selectedTab">rules</xsl:with-param>
            </xsl:call-template>

<!-- Tab bar sub links-->
            <xsl:call-template name="vcc03_sublinks">
                <xsl:with-param name="selectedList">rules</xsl:with-param>
                <xsl:with-param name="selectedTab">prizes</xsl:with-param>
            </xsl:call-template>
    
            <blockquote>
            <h2>About the Prizes</h2>
            
            <p>All participants who compete in Round #1 will receive a Verizon Coding Challenge t-shirt.  In addition, the top four scorers in the 
            Championship Round will receive cash prizes.  Any and all applicable taxes on prizes are the sole responsibility of the prizewinner.  
            Prizes will be distributed as follows:</p>
            
            <table width="450" border="0" cellpadding="5" cellspacing="2" class="sidebarBox" align="center">
                <tr>
                    <td width="50%" class="sidebarTitle">Competitor(s)</td>
                    <td width="50%" class="sidebarTitle" align="right">Prize</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText"><strong>1<span class="super">st</span> place finisher* in the Championship Round</strong></td>
                    <td width="50%" class="sidebarText" align="right"><strong>$1,000 USD</strong></td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">2<span class="super">nd</span> place finisher* in the Championship Round</td>
                    <td width="50%" class="sidebarText" align="right">$500 USD</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">3<span class="super">rd</span> place finisher* in the Championship Round</td>
                    <td width="50%" class="sidebarText" align="right">$300 USD</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">4<span class="super">th</span> place finisher* in the Championship Round</td>
                    <td width="50%" class="sidebarText" align="right">$100 USD</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">Up to 500 competitors who compete in Online Round #1</td>
                    <td width="50%" class="sidebarText" align="right">Verizon Coding Challenge t-shirt</td>
                </tr>


                <tr>
                    <td colspan="2" class="sidebarText">* Prize will be awarded at the conclusion of the Championship Round. 
                        Winner must be present at the onsite rounds to receive prize.</td>
                </tr>
            </table>
            </blockquote>

            <p><br/></p>
            
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
<!-- Right Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<!-- Footer Begins -->
<jsp:include page="verizon_foot.jsp" />
<!-- Footer Ends -->

</body>
</html>