<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Computer Programming Tournament - Advancers</title>

<jsp:include page="../../script.jsp" />

</head>

<body onLoad="timer(1);">

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
            <div align="right" class="bodyText"><A href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_comp_des_rd1">Round 1</A>&#160;&#160;|&#160;&#160;Round 2</div>
            <br/>

                  <p>
                  The Design competition was a nail-biter.  Pops took the lead early with two superb submissions that gave him a round score of 93.92 which was hard to beat.  However, aksonov scratched and clawed his way through appeals and brought his overall up to 94.82, making him the round leader.  Due to contest rules we will not see Pops and aksonov go head to head since aksonov will be competing in the development contest where he had an even higher average score!  Congratulations to Tomson, who will be taking on Pops in the finals instead.
                  </p>
            
            <br/><br/>

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
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd" align="left"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=277356">aksonov**</a></td>
                    <td class="formHandleOdd" align="right">94.82</td>
                    <td class="formHandleOdd" align="right">94.90, 94.74</td>
                    <td class="formHandleOdd" align="right">$572.35</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven" align="center">1</td>
                    <td class="formHandleEven" align="left"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=119676">Pops</a></td>
                    <td class="formHandleEven" align="right">93.92</td>
                    <td class="formHandleEven" align="right">98.17,89.67</td>
                    <td class="formHandleEven" align="right">$378.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd" align="left"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=302018">Tomson***</a></td>
                    <td class="formHandleOdd" align="right">90.62</td>
                    <td class="formHandleOdd" align="right">91.90,89.34</td>
                    <td class="formHandleOdd" align="right">$483.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="left"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=299180">isv***</a></td>
                    <td class="formHandleEven" align="right">87.92</td>
                    <td class="formHandleEven" align="right">87.65,88.18</td>
                    <td class="formHandleEven" align="right">$462.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd" align="center">2</td>
                    <td class="formHandleOdd" align="left"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=152342">kyky***</a></td>
                    <td class="formHandleOdd" align="right">81.42</td>
                    <td class="formHandleOdd" align="right">81.42</td>
                    <td class="formHandleOdd" align="right">$189.50</td>
                </tr>

                <tr valign="middle"><td class="formHandleEven" width="20%" align="left" colspan="5">*the average of the two highest scores, including at least one level II score<br/>**aksonov finished 1st in both design and development, as stated in the rules he advances in Development due to a higher average score<br/>***Tomson and isv are unable to attend the onsite round due to travel restrictions. The next highest scorer in the tournament, kyky, has replaced them.</td></tr>

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
                    <td class="formHandleEven" align="center">1</td>
                    <td class="formHandleEven" align="left"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7405912">StrongHold</a></td>
                    <td class="formHandleEven" align="right">72.21</td>
                    <td class="formHandleEven" align="right">72.21</td>
                    <td class="formHandleEven" align="right">$105.00</td>
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
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7411534" class="statText" target="_blank">Performance Oriented Thread Pool</a></td>
                    <td class="formHandleOdd" align="center">2</td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=119676">Pops</a></td>
                    <td class="formHandleOdd" align="right">98.17</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="center">2</td>
                    <td class="formHandleEven"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=299180">isv</a></td>
                    <td class="formHandleEven" align="right">88.18</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7409489" class="statText" target="_blank">Report Control</a></td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=119676">Pops</a></td>
                    <td class="formHandleOdd" align="right">89.67</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7476786" class="statText" target="_blank">String Distance</a></td>
                    <td class="formHandleEven" align="center">2</td>
                    <td class="formHandleEven" align="center">1</td>
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=277356">aksonov</a></td>
                    <td class="formHandleEven" align="right">94.74</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"></td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd" align="center">2</td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=302018">Tomson</a></td>
                    <td class="formHandleOdd" align="right">89.34</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7410031" class="statText" target="_blank">Tail</a></td>
                    <td class="formHandleEven" align="center">3</td>
                    <td class="formHandleEven" align="center">1</td>
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=277356">aksonov</a></td>
                    <td class="formHandleEven" align="right">94.90</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"></td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd" align="center">2</td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=302018">Tomson</a></td>
                    <td class="formHandleOdd" align="right">91.90</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="center">3</td>
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=152342">kyky</a></td>
                    <td class="formHandleEven" align="right">81.42</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7325502" class="statText" target="_blank">XML Navigator</a></td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7405912">StrongHold</a></td>
                    <td class="formHandleOdd" align="right">72.21</td>
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
