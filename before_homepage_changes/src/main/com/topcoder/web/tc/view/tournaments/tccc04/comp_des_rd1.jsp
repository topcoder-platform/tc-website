<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Design</title>

<jsp:include page="../../script.jsp" />

<link type="text/css" rel="stylesheet" href="/css/TCCC04style.css"/>
    
</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%">

<jsp:include page="tccc04Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="tccc04links.jsp" >
   <jsp:param name="tabLev1" value="component"/>
   <jsp:param name="tabLev2" value="design"/>
   <jsp:param name="tabLev3" value="round1"/>
</jsp:include> 

            <h2>Design Round 1</h2>

<!-- Design Winners Begins -->

            <table border="0" cellspacing="0" cellpadding="3" width="450" align="center" class="formFrame">
                <tr valign="middle">
                    <td class="advTitle" colspan="3">Design Participants</td>
                </tr>
                <tr valign="middle">
                    <td class="advHeader" width="20%" align="left">Handle</td>
                    <td class="advHeader" width="20%" align="left">Coach</td>
                    <td class="advHeader" width="60%" align="right">Score</td>
                </tr>

                <tr valign="middle">
                    <td class="advCell" align="left"><a href="/stat?c=member_profile&amp;cr=302018">Tomson</a></td>
                    <td class="advCell" align="left"><a href="/stat?c=member_profile&amp;cr=119676">Pops</a></td>
                    <td class="advCell" align="right">84.74</td>
                </tr>
                <tr valign="middle">
                    <td class="advCell" align="left"><a href="/stat?c=member_profile&amp;cr=278342">adic</a></td>
                    <td class="advCell" align="left"></td>
                    <td class="advCell" align="right">83.46</td>
                </tr>
                <tr valign="middle">
                    <td class="advCell" align="left"><a href="/stat?c=member_profile&amp;cr=251989">AdamSelene</a></td>
                    <td class="advCell" align="left"></td>
                    <td class="advCell" align="right">80.92</td>
                </tr>
                <tr valign="middle">
                    <td class="advCell" align="left"><a href="/stat?c=member_profile&amp;cr=289824">MPhk</a></td>
                    <td class="advCell" align="left"></td>
                    <td class="advCell" align="right">80.86</td>
                </tr>
                <tr valign="middle">
                    <td class="advCell" align="left"><a href="/stat?c=member_profile&amp;cr=277356">aksonov</a></td>
                    <td class="advCell" align="left"><a href="/stat?c=member_profile&amp;cr=296145">srowen</a></td>
                    <td class="advCell" align="right">78.33</td>
                </tr>
                <tr valign="middle">
                    <td class="advCell" align="left"><a href="/stat?c=member_profile&amp;cr=251832">dark_lord</a></td>
                    <td class="advCell" align="left"><a href="/stat?c=member_profile&amp;cr=119676">Pops</a></td>
                    <td class="advCell" align="right">74.31</td>
                </tr>
                <tr valign="middle">
                    <td class="advCell" align="left"><a href="/stat?c=member_profile&amp;cr=289251">ragnabot</a></td>
                    <td class="advCell" align="left"></td>
                    <td class="advCell" align="right">66.69</td>
                </tr>
                <tr valign="middle">
                    <td class="advCell" align="left"><a href="/stat?c=member_profile&amp;cr=309786">Yi_Zhang</a></td>
                    <td class="advCell" align="left"></td>
                    <td class="advCell" align="right">64.18</td>
                </tr>
                <tr valign="middle">
                    <td class="advCell" align="left"><a href="/stat?c=member_profile&amp;cr=286907">WishingBone</a></td>
                    <td class="advCell" align="left"></td>
                    <td class="advCell" align="right">63.37</td>
                </tr>
                <tr valign="middle">
                    <td class="advCell" align="left"><a href="/stat?c=member_profile&amp;cr=7463987">ShindouHikaru</a></td>
                    <td class="advCell" align="left"></td>
                    <td class="advCell" align="right">59.40</td>
                </tr>
                <tr valign="middle">
                    <td class="advCell" align="left"><a href="/stat?c=member_profile&amp;cr=7436876">mastergaurav</a></td>
                    <td class="advCell" align="left"></td>
                    <td class="advCell" align="right">56.06</td>
                </tr>
                <tr valign="middle">
                    <td class="advCell" align="left"><a href="/stat?c=member_profile&amp;cr=8347440">gagik</a></td>
                    <td class="advCell" align="left"></td>
                    <td class="advCell" align="right">51.80</td>
                </tr>
                <tr valign="middle">
                    <td class="advCell" align="left"><a href="/stat?c=member_profile&amp;cr=260578">danno</a></td>
                    <td class="advCell" align="left"></td>
                    <td class="advCell" align="right">50.31</td>
                </tr>

<%--
					<tr valign="middle"><td background="/i/graybv_bg.gif" class="statTextLarge" width="20%" align="left" colspan="4">*the average of the two highest scores, including at least one level II score</td></tr>
--%>
            </table>

           <br/><br/>

            <table border="0" cellspacing="0" cellpadding="3" width="450" align="center" class="formFrame">
                <tr valign="middle">
                    <td class="projectTitles"colspan="6">Project Submissions</td>
                </tr>
                <tr valign="middle">
                    <td class="advHeader" width="35%">Project Name</td>
                    <td class="advHeader" width="15" align="center">Total<br/>Submissions</td>
                    <td class="advHeader" width="15%" align="center">Place</td>
                    <td class="advHeader" width="20%">Submitter(s)</td>
                    <td class="advHeader" width="15%" align="center">Board<br/>Score</td>
                    <td class="advHeader" width="10%" align="right">Multiplier</td>
                </tr>

                <tr valign="middle">
                    <td class="advCell"><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=6707859" target="_blank">Base64 Codec</a></td>
                    <td class="advCell" align="center">7</td>
                    <td class="advCell" align="center">1</td>
                    <td class="advCell"><a href="/stat?c=member_profile&amp;cr=278342">adic</a></td>
                    <td class="advCell" align="center">83.46</td>
                    <td class="advCell" align="center">&#160;</td>
                </tr>
                <tr valign="middle">
                    <td class="advCell">&#160;</td>
                    <td class="advCell">&#160;</td>
                    <td class="advCell" align="center">2</td>
                    <td class="advCell"><a href="/stat?c=member_profile&amp;cr=277356">aksonov</a></td>
                    <td class="advCell" align="center">75.90</td>
                    <td class="advCell" align="center">&#160;</td>
                </tr>
                <tr valign="middle">
                    <td class="advCell">&#160;</td>
                    <td class="advCell">&#160;</td>
                    <td class="advCell" align="center">3</td>
                    <td class="advCell"><a href="/stat?c=member_profile&amp;cr=289251">ragnabot</a></td>
                    <td class="advCell" align="center">66.69</td>
                    <td class="advCell" align="center">&#160;</td>
                </tr>
                <tr valign="middle">
                    <td class="advCell">&#160;</td>
                    <td class="advCell">&#160;</td>
                    <td class="advCell" align="center">4</td>
                    <td class="advCell"><a href="/stat?c=member_profile&amp;cr=251989">AdamSelene</a></td>
                    <td class="advCell" align="center">66.52</td>
                    <td class="advCell" align="center">&#160;</td>
                </tr>
                <tr valign="middle">
                    <td class="advCell">&#160;</td>
                    <td class="advCell">&#160;</td>
                    <td class="advCell" align="center">5</td>
                    <td class="advCell"><a href="/stat?c=member_profile&amp;cr=7463987">ShindouHikaru</a></td>
                    <td class="advCell" align="center">59.40</td>
                    <td class="advCell" align="center">&#160;</td>
                </tr>
                <tr valign="middle">
                    <td class="advCell">&#160;</td>
                    <td class="advCell">&#160;</td>
                    <td class="advCell" align="center">6</td>
                    <td class="advCell"><a href="/stat?c=member_profile&amp;cr=7436876">mastergaurav</a></td>
                    <td class="advCell" align="center">56.06</td>
                    <td class="advCell" align="center">&#160;</td>
                </tr>
                <tr valign="middle">
                    <td class="advCell">&#160;</td>
                    <td class="advCell">&#160;</td>
                    <td class="advCell" align="center">7</td>
                    <td class="advCell"><a href="/stat?c=member_profile&amp;cr=260578">danno</a></td>
                    <td class="advCell" align="center">50.31</td>
                    <td class="advCell" align="center"><img src="/i/development/multiplierLGray.gif" border="0"/></td>
                </tr>
                <tr valign="middle">
                    <td class="advCell"><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=5700518" target="_blank">Matrix Math Library</a></td>
                    <td class="advCell" align="center">4</td>
                    <td class="advCell" align="center">1</td>
                    <td class="advCell"><a href="/stat?c=member_profile&amp;cr=251832">dark_lord</a></td>
                    <td class="advCell" align="center">74.31</td>
                    <td class="advCell" align="center">&#160;</td>
                </tr>
                <tr valign="middle">
                    <td class="advCell">&#160;</td>
                    <td class="advCell">&#160;</td>
                    <td class="advCell" align="center">2</td>
                    <td class="advCell"><a href="/stat?c=member_profile&amp;cr=309786">Yi_Zhang</a></td>
                    <td class="advCell" align="center">64.18</td>
                    <td class="advCell" align="center">&#160;</td>
                </tr>
                <tr valign="middle">
                    <td class="advCell">&#160;</td>
                    <td class="advCell">&#160;</td>
                    <td class="advCell" align="center">3</td>
                    <td class="advCell"><a href="/stat?c=member_profile&amp;cr=286907">WishingBone</a></td>
                    <td class="advCell" align="center">63.37</td>
                    <td class="advCell" align="center"><img src="/i/development/multiplierLGray.gif" border="0"/></td>
                </tr>
                <tr valign="middle">
                    <td class="advCell">&#160;</td>
                    <td class="advCell">&#160;</td>
                    <td class="advCell" align="center">4</td>
                    <td class="advCell"><a href="/stat?c=member_profile&amp;cr=8347440">gagik</a></td>
                    <td class="advCell" align="center">51.80</td>
                    <td class="advCell" align="center">&#160;</td>
                </tr>
                <tr valign="middle">
                    <td class="advCell"><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=8403457" target="_blank">Sort Utility</a></td>
                    <td class="advCell" align="center">1</td>
                    <td class="advCell" align="center">1</td>
                    <td class="advCell"><a href="/stat?c=member_profile&amp;cr=251989">AdamSelene</a></td>
                    <td class="advCell" align="center">80.92</td>
                    <td class="advCell" align="center"><img src="/i/development/multiplierLGray.gif" border="0"/></td>
                </tr>
                <tr valign="middle">
                    <td class="advCell"><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=6601794" target="_blank">String Distance</a></td>
                    <td class="advCell" align="center">3</td>
                    <td class="advCell" align="center">1</td>
                    <td class="advCell"><a href="/stat?c=member_profile&amp;cr=302018">Tomson</a></td>
                    <td class="advCell" align="center">84.74</td>
                    <td class="advCell" align="center">&#160;</td>
                </tr>
                <tr valign="middle">
                    <td class="advCell">&#160;</td>
                    <td class="advCell">&#160;</td>
                    <td class="advCell" align="center">2</td>
                    <td class="advCell"><a href="/stat?c=member_profile&amp;cr=289824">MPhk</a></td>
                    <td class="advCell" align="center">80.86</td>
                    <td class="advCell" align="center">&#160;</td>
                </tr>
                <tr valign="middle">
                    <td class="advCell">&#160;</td>
                    <td class="advCell">&#160;</td>
                    <td class="advCell" align="center">3</td>
                    <td class="advCell"><a href="/stat?c=member_profile&amp;cr=277356">aksonov</a></td>
                    <td class="advCell" align="center">78.33</td>
                    <td class="advCell" align="center"><img src="/i/development/multiplierLGray.gif" border="0"/></td>
                </tr>

            </table>
         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
