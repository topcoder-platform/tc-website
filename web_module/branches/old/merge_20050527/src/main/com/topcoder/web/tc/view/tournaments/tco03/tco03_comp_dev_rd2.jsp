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
   <jsp:param name="selectedTab" value="development"/> 
</jsp:include>

            <h2>Advancers</h2>
            <div align="right" class="bodyText"><A href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_comp_dev_rd1">Round 1</A>&#160;&#160;|&#160;&#160;Round 2</div>
            <br/>

                  <p>Round 2 was quite suspenseful.  Almost all development competitors submitted for the same two components, DNS Query and Generic Event Manager.  The race was on and it was neck and neck the whole way.  Aksonov and rnielsen emerged the winners but it was a great showing from all submitters.</p>
                  
            <br/><br/>
            
    <!-- Design Winners Begins -->
            <table border="0" cellspacing="0" cellpadding="3" width="500" align="center">
                <tr valign="middle">
                    <td class="statTextLarge" bgcolor="#999999"><font size="3">Development Advancers</font></td>
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
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd" align="left"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=277356">aksonov</a></td>
                    <td class="formHandleOdd" align="right">95.68</td>
                    <td class="formHandleOdd" align="right">95.34,96.02</td>
                    <td class="formHandleOdd" align="right">$336.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven" align="center">2</td>
                    <td class="formHandleEven" align="left"><a class="coderTextBlue" href="/stat?tc?module=MemberProfile&amp;cr=154714">rnielsen</a></td>
                    <td class="formHandleEven" align="right">93.89</td>
                    <td class="formHandleEven" align="right">93.90,96.71,91.08</td>
                    <td class="formHandleEven" align="right">$288.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd" align="center">3</td>
                    <td class="formHandleOdd" align="left"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=273428">rbnn</a></td>
                    <td class="formHandleOdd" align="right">90.07</td>
                    <td class="formHandleOdd" align="right">91.38, 88.76</td>
                    <td class="formHandleOdd" align="right">$84.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven" align="center">4</td>
                    <td class="formHandleEven" align="left"><a class="coderTextBlue" href="/stat?tc?module=MemberProfile&amp;cr=266149">akhil_bansal</a></td>
                    <td class="formHandleEven" align="right">86.29</td>
                    <td class="formHandleEven" align="right">82.52,90.05</td>
                    <td class="formHandleEven" align="right">$144.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd" align="center">5</td>
                    <td class="formHandleOdd" align="left"><a class="coderTextGray" href="/stat?tc?module=MemberProfile&amp;cr=153089">preben</a></td>
                    <td class="formHandleOdd" align="right">75.83</td>
                    <td class="formHandleOdd" align="right">88.24,63.42</td>
                    <td class="formHandleOdd" align="right">$190.00</td>
                </tr>

                <tr valign="middle"><td background="/i/graybv_bg.gif" class="statTextLarge" width="20%" align="left" colspan="5">*the average of the two highest scores, including at least one level II score</td></tr>

            </table>

           <br/><br/>

            <table border="0" cellspacing="0" cellpadding="3" width="500" align="center">
                <tr valign="middle">
                    <td class="statTextLarge" bgcolor="#999999"><font size="3">Development Wild Card Pool</font></td>
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
                    <td class="formHandleOdd" align="left"><a class="coderTextBlue" href="/stat?tc?module=MemberProfile&amp;cr=154307">holmana</a></td>
                    <td class="formHandleOdd" align="right">97.42</td>
                    <td class="formHandleOdd" align="right">97.42</td>
                    <td class="formHandleOdd" align="right">$192.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven" align="center">2</td>
                    <td class="formHandleEven" align="left"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=289251">ragnabot</a></td>
                    <td class="formHandleEven" align="right">92.31</td>
                    <td class="formHandleEven" align="right">92.31</td>
                    <td class="formHandleEven" align="right">$48.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd" align="center">3</td>
                    <td class="formHandleOdd" align="left"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=299904">mishagam</a></td>
                    <td class="formHandleOdd" align="right">84.04</td>
                    <td class="formHandleOdd" align="right">84.04</td>
                    <td class="formHandleOdd" align="right">$240.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven" align="center">4</td>
                    <td class="formHandleEven" align="left"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=154579">Altrag</a></td>
                    <td class="formHandleEven" align="right">81.62</td>
                    <td class="formHandleEven" align="right">81.62</td>
                    <td class="formHandleEven" align="right">$240.00</td>
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
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=6403441" class="statText" target="_blank">Authentication Factory</a></td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd"><a class="coderTextGray" href="/stat?tc?module=MemberProfile&amp;cr=153089">preben</a></td>
                    <td class="formHandleOdd" align="right">88.24</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7263827" class="statText" target="_blank">DNS Query</a></td>
                    <td class="formHandleEven" align="center">5</td>
                    <td class="formHandleEven" align="center">1</td>
                    <td class="formHandleEven"><a class="coderTextBlue" href="/stat?tc?module=MemberProfile&amp;cr=154714">rnielsen</a></td>
                    <td class="formHandleEven" align="right">96.71</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"></td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd" align="center">2</td>
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/stat?tc?module=MemberProfile&amp;cr=266149">akhil_bansal</a></td>
                    <td class="formHandleOdd" align="right">90.05</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="center">3</td>
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=273428">rbnn</a></td>
                    <td class="formHandleEven" align="right">87.93</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"></td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd" align="center">4</td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=154579">Altrag</a></td>
                    <td class="formHandleOdd" align="right">81.62</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="center">5</td>
                    <td class="formHandleEven"><a class="coderTextGray" href="/stat?tc?module=MemberProfile&amp;cr=153089">preben</a></td>
                    <td class="formHandleEven" align="right">63.42</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7323082" class="statText" target="_blank">Generic Event Manager</a></td>
                    <td class="formHandleOdd" align="center">6</td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/stat?tc?module=MemberProfile&amp;cr=154307">holmana</a></td>
                    <td class="formHandleOdd" align="right">97.42</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="center">2</td>
                    <td class="formHandleEven"><a class="coderTextBlue" href="/stat?tc?module=MemberProfile&amp;cr=154714">rnielsen</a></td>
                    <td class="formHandleEven" align="right">96.08</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"></td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd" align="center">3</td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=277356">aksonov</a></td>
                    <td class="formHandleOdd" align="right">96.02</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="center">4</td>
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=289251">ragnabot</a></td>
                    <td class="formHandleEven" align="right">92.31</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"></td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd" align="center">5</td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=273428">rbnn</a></td>
                    <td class="formHandleOdd" align="right">91.38</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="center">6</td>
                    <td class="formHandleEven"><a class="coderTextBlue" href="/stat?tc?module=MemberProfile&amp;cr=266149">akhil_bansal</a></td>
                    <td class="formHandleEven" align="right">82.52</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=5904558" class="statText" target="_blank">Generic Service</a></td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=299904">mishagam</a></td>
                    <td class="formHandleOdd" align="right">84.04</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=6409400" class="statText" target="_blank">MathML</a></td>
                    <td class="formHandleEven" align="center">1</td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=277356">aksonov</a></td>
                    <td class="formHandleEven" align="right">95.34</td>
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
