<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Computer Programming Tournament - Advancers</title>

<jsp:include page="../../script.jsp" />

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

<jsp:include page="tco03Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="tco03Links.jsp" >
   <jsp:param name="selectedContest" value="component"/>
   <jsp:param name="selectedTab" value="component_advancers"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="tco03Sublinks.jsp" >
   <jsp:param name="selectedList" value="component_advancers"/>
   <jsp:param name="selectedTab" value="design"/>
</jsp:include>

            <h2>Advancers</h2>
            <div align="right" class="bodyText">Round 1&#160;&#160;|&#160;&#160;<A href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_comp_des_rd2">Round 2</A></div>
            <br/>

<!-- Design Winners Begins -->
            <table border="0" cellspacing="0" cellpadding="3" width="500" align="center">
                <tr valign="middle">
                    <td class="statTextLarge" bgcolor="#999999"><font size="3">Design Advancers</font></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" width="500" align="center" class="formFrame">
                <tr valign="middle">
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="10%" align="center">Seed</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="20%" align="left">Handle</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="15%" align="right">Average Score*</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="30%" align="right">Round Scores</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="15%" align="right">Tournament Earnings</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd" align="center">1(T)</td>
                    <td class="formHandleOdd" align="left"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=119676">Pops</a></td>
                    <td class="formHandleOdd" align="right">bye</td>
                    <td class="formHandleOdd" align="right"><a class="StatText" href="http://www.topcoder.com/?&amp;t=development&amp;c=bonus_contest_0303">Contest 1</a></td>
                    <td class="formHandleOdd" align="right">$0.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven" align="center">1(T)</td>
                    <td class="formHandleEven" align="left"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=268546">TangentZ</a></td>
                    <td class="formHandleEven" align="right">bye</td>
                    <td class="formHandleEven" align="right"><a class="StatText" href="http://www.topcoder.com/?t=development&amp;c=des_bonus_contest_2">Contest 2</a></td>
                    <td class="formHandleEven" align="right">$0.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd" align="center">3</td>
                    <td class="formHandleOdd" align="left"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=302018">Tomson</a></td>
                    <td class="formHandleOdd" align="right">91.21</td>
                    <td class="formHandleOdd" align="right">86.78, 94.64</td>
                    <td class="formHandleOdd" align="right">$315.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven" align="center">4</td>
                    <td class="formHandleEven" align="left"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=299180">isv</a></td>
                    <td class="formHandleEven" align="right">86.40</td>
                    <td class="formHandleEven" align="right">81.84, 90.86</td>
                    <td class="formHandleEven" align="right">$210.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd" align="center">5</td>
                    <td class="formHandleOdd" align="left"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=277356">aksonov</a></td>
                    <td class="formHandleOdd" align="right">86.05</td>
                    <td class="formHandleOdd" align="right">79.54,  92.56</td>
                    <td class="formHandleOdd" align="right">$236.25</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven" align="center">6</td>
                    <td class="formHandleEven" align="left"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=152342">kyky</a></td>
                    <td class="formHandleEven" align="right">80.08</td>
                    <td class="formHandleEven" align="right">80.03, 80.13</td>
                    <td class="formHandleEven" align="right">$158.00</td>
                </tr>

                <tr valign="middle"><td background="/i/graybv_bg.gif" class="statTextLarge" width="20%" align="left" colspan="5">*the average of the two highest scores, including at least one level II score</td></tr>

            </table>

           <br/><br/>

            <table border="0" cellspacing="0" cellpadding="3" width="500" align="center">
                <tr valign="middle">
                    <td class="statTextLarge" bgcolor="#999999"><font size="3">Design Wild Card Pool</font></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" width="500" align="center" class="formFrame">
                <tr valign="middle">
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="10%" align="center">Rank</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="20%" align="left">Handle</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="15%" align="right">Average Score*</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="30%" align="right">Round Scores</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="15%" align="right">Tournament Earnings</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd" align="left"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=296145">srowen</a></td>
                    <td class="formHandleOdd" align="right">90.38</td>
                    <td class="formHandleOdd" align="right">90.38</td>
                    <td class="formHandleOdd" align="right">$105.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven" align="center">2</td>
                    <td class="formHandleEven" align="left"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=304976">giginim</a></td>
                    <td class="formHandleEven" align="right">89.18</td>
                    <td class="formHandleEven" align="right">89.18</td>
                    <td class="formHandleEven" align="right">$52.50</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd" align="center">3</td>
                    <td class="formHandleOdd" align="left"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7405912">StrongHold</a></td>
                    <td class="formHandleOdd" align="right">80.58</td>
                    <td class="formHandleOdd" align="right">80.58</td>
                    <td class="formHandleOdd" align="right">$105.00</td>
                </tr>

                <tr valign="middle"><td background="/i/graybv_bg.gif" class="statTextLarge" width="20%" align="left" colspan="5">*the average of the two highest scores, including at least one level II score</td></tr>

            </table>

           <br/><br/>

            <table border="0" cellspacing="0" cellpadding="3" width="500" align="center">
                <tr valign="middle">
                    <td class="statTextLarge" bgcolor="#999999"><font size="3">Project Scores</font></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" width="500" align="center" class="formFrame">
                <tr valign="middle">
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="35%">Project Name</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="15" align="center">Total<br/>Submissions</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="15%" align="center">Place</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="20%">Winner(s)</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="15%" align="right">Board&#160;Score</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7411659" class="statText" target="_blank">Business Date Utility</a></td>
                    <td class="formHandleOdd" align="center">3</td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=277356">aksonov</a></td>
                    <td class="formHandleOdd" align="right">92.56</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="center">2</td>
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=296145">srowen</a></td>
                    <td class="formHandleEven" align="right">90.38</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"></td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd" align="center">3</td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=152342">kyky</a></td>
                    <td class="formHandleOdd" align="right">80.03</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7409563" class="statText" target="_blank">Dependency Map</a></td>
                    <td class="formHandleEven" align="center">1</td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=152342">kyky</a></td>
                    <td class="formHandleEven" align="right">80.13</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7410827" class="statText" target="_blank">Image Overlay</a></td>
                    <td class="formHandleOdd" align="center">3</td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=302018">Tomson</a></td>
                    <td class="formHandleOdd" align="right">94.64</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="center">2</td>
                    <td class="formHandleEven"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=304976">giginim</a></td>
                    <td class="formHandleEven" align="right">89.18</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"></td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd" align="center">3</td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=277356">aksonov</a></td>
                    <td class="formHandleOdd" align="right">79.54</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7408776" class="statText" target="_blank">Load Estimator</a></td>
                    <td class="formHandleEven" align="center">1</td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=299180">isv</a></td>
                    <td class="formHandleEven" align="right">90.86</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7410707" class="statText" target="_blank">Shopping Cart</a></td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=299180">isv</a></td>
                    <td class="formHandleOdd" align="right">81.84</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7408797" class="statText" target="_blank">SVG Generator</a></td>
                    <td class="formHandleEven" align="center">1</td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=302018">Tomson</a></td>
                    <td class="formHandleEven" align="right">86.79</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7411234" class="statText" target="_blank">Tree View Tag</a></td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7405912">Stronghold</a></td>
                    <td class="formHandleOdd" align="right">80.58</td>
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
