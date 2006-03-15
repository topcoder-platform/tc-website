<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Tournaments</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
</head>

<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="topcoder_tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div style="margin: 0px 10px 0px 10px;">

    <jsp:include page="/page_title.jsp">
        <jsp:param name="image" value="tc_tournaments"/>
        <jsp:param name="title" value="TopCoder Tournaments"/>
    </jsp:include>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td height="10"><img src="/i/clear.gif" alt="" width="240" height="10" border="0" /></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
                
            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="bodyText">
                        <div align="center"><img src="/i/development/bonusContestGraphic.gif" alt="TopCoder Software Development Bonus Contest" width="470" height="59" border="0" /></div>
                        
                        <p><strong>With an average score of 93.09 on 5 submissions, Pops beat out 40 other TopCoder members to take the top spot... and the $2000 bonus.</strong></p>

                        <p>In addition, Pops has earned $1120 for his winning designs, as well as royalty payments. These are the projects for which Pops submitted winning design solutions:</p>
                        
                    </td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td align="center">
                        <table border="0" cellspacing="0" cellpadding="5" width="300" class="formFrame">
                            <tr valign="middle">
                                <td background="/i/graybv_bg.gif" class="StatTextLarge">Project</td>
                                <td background="/i/graybv_bg.gif" class="StatTextLarge" align="center">Submissions</td>
                                <td background="/i/graybv_bg.gif" class="StatTextLarge" align="center">Score</td>
                            </tr>
                
                            <tr valign="top">
                                <td class="formTextOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=6508770" target="_blank">Bag Collection</a></td>
                                <td class="formTextOdd" align="center">3</td>
                                <td class="formTextOdd" align="center">95.14</td>
                            </tr>

                            <tr valign="top">
                                <td class="formTextEven"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=3304122" target="_blank">Chat Server</a></td>
                                <td class="formTextEven" align="center">1</td>
                                <td class="formTextEven" align="center">95.00</td>
                            </tr>

                            <tr valign="top">
                                <td class="formTextOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=6402357" target="_blank">Class Discovery</a></td>
                                <td class="formTextOdd" align="center">1</td>
                                <td class="formTextOdd" align="center">93.77</td>
                            </tr>

                            <tr valign="top">
                                <td class="formTextEven"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=4201389" target="_blank">Heartbeat</a></td>
                                <td class="formTextEven" align="center">1</td>
                                <td class="formTextEven" align="center">85.39</td>
                            </tr>

                            <tr valign="top">
                                <td class="formTextOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=3300871" target="_blank">URL Loader</a></td>
                                <td class="formTextOdd" align="center">2</td>
                                <td class="formTextOdd" align="center">96.13</td>
                            </tr>

                        </table>
                    </td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="bodyText">
                        <p>Thank you to everyone who submitted entries for our February/March Component Design Contest.</p>
                    </td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td align="center">
                        <table border="0" cellspacing="0" cellpadding="3" width="300" class="formFrame">

                <tr>
                    <td class="statTextLarge" colspan="3" bgcolor="#999999"><a name="design"></a><font size="3">Qualifying Contest Entries</font></td>
                </tr>

                <tr valign="middle">
                    <td background="/i/graybv_bg.gif" class="statTextLarge">Handle</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Submissions</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Average Score</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/tc?module=MemberProfile&cr=279551">scamp</a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formTextOdd" align="center">96.86</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextGreen" href="/tc?module=MemberProfile&cr=299180">isv</a></td>
                    <td class="formTextEven" align="center">2</td>
                    <td class="formTextEven" align="center">96.57</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/tc?module=MemberProfile&cr=278595">seaniswise</a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formTextOdd" align="center">95.42</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextBlue" href="/tc?module=MemberProfile&cr=119676">Pops</a></td>
                    <td class="formTextEven" align="center">5</td>
                    <td class="formTextEven" align="center">93.09</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/tc?module=MemberProfile&cr=296145">srowen</a></td>
                    <td class="formTextOdd" align="center">5</td>
                    <td class="formTextOdd" align="center">89.91</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextYellow" href="/tc?module=MemberProfile&cr=299706">cruizza</a></td>
                    <td class="formTextEven" align="center">1</td>
                    <td class="formTextEven" align="center">89.82</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/tc?module=MemberProfile&cr=271978">rusi</a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formTextOdd" align="center">88.97</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextBlue" href="/tc?module=MemberProfile&cr=289824">MPhk</a></td>
                    <td class="formTextEven" align="center">1</td>
                    <td class="formTextEven" align="center">88.46</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/tc?module=MemberProfile&cr=154754">Ken Vogel</a></td>
                    <td class="formTextOdd" align="center">4</td>
                    <td class="formTextOdd" align="center">88.04</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextYellow" href="/tc?module=MemberProfile&cr=150498">ThinMan</a></td>
                    <td class="formTextEven" align="center">5</td>
                    <td class="formTextEven" align="center">87.90</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/tc?module=MemberProfile&cr=304697">ozzie</a></td>
                    <td class="formTextOdd" align="center">3</td>
                    <td class="formTextOdd" align="center">87.87</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextGreen" href="/tc?module=MemberProfile&cr=261822">bodrius</a></td>
                    <td class="formTextEven" align="center">4</td>
                    <td class="formTextEven" align="center">87.77</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/tc?module=MemberProfile&cr=277356">aksonov</a></td>
                    <td class="formTextOdd" align="center">5</td>
                    <td class="formTextOdd" align="center">85.77</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextGreen" href="/tc?module=MemberProfile&cr=153434">bokbok</a></td>
                    <td class="formTextEven" align="center">1</td>
                    <td class="formTextEven" align="center">85.63</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextGreen" href="/tc?module=MemberProfile&cr=294463">theMADscientist</a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formTextOdd" align="center">85.05</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextBlue" href="/tc?module=MemberProfile&cr=273100">wf</a></td>
                    <td class="formTextEven" align="center">2</td>
                    <td class="formTextEven" align="center">84.87</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/tc?module=MemberProfile&cr=278342">adic</a></td>
                    <td class="formTextOdd" align="center">4</td>
                    <td class="formTextOdd" align="center">83.78</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextBlue" href="/tc?module=MemberProfile&cr=155381">djFD</a></td>
                    <td class="formTextEven" align="center">3</td>
                    <td class="formTextEven" align="center">83.78</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextGray" href="/tc?module=MemberProfile&cr=281975">keithnigh</a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formTextOdd" align="center">82.55</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextGreen" href="/tc?module=MemberProfile&cr=280167">ttsuchi</a></td>
                    <td class="formTextEven" align="center">7</td>
                    <td class="formTextEven" align="center">82.04</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/tc?module=MemberProfile&cr=265522">veredox</a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formTextOdd" align="center">81.90</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextBlue" href="/tc?module=MemberProfile&cr=297731">TheCois</a></td>
                    <td class="formTextEven" align="center">1</td>
                    <td class="formTextEven" align="center">81.33</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextGreen" href="/tc?module=MemberProfile&cr=287614">argolite</a></td>
                    <td class="formTextOdd" align="center">3</td>
                    <td class="formTextOdd" align="center">81.07</td>
                </tr>
                
                 <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextGreen" href="/tc?module=MemberProfile&cr=156618">mckavity</a></td>
                    <td class="formTextEven" align="center">1</td>
                    <td class="formTextEven" align="center">79.35</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/tc?module=MemberProfile&cr=304976">giginim</a></td>
                    <td class="formTextOdd" align="center">5</td>
                    <td class="formTextOdd" align="center">78.58</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextBlue" href="/tc?module=MemberProfile&cr=155357">alexaukf</a></td>
                    <td class="formTextEven" align="center">1</td>
                    <td class="formTextEven" align="center">77.57</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextGreen" href="/tc?module=MemberProfile&cr=157174">preetham</a></td>
                    <td class="formTextOdd" align="center">3</td>
                    <td class="formTextOdd" align="center">76.86</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextBlue" href="/tc?module=MemberProfile&cr=294570">Saxophonist</a></td>
                    <td class="formTextEven" align="center">3</td>
                    <td class="formTextEven" align="center">74.97</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextGray" href="/tc?module=MemberProfile&cr=136305">HuskerFan</a></td>
                    <td class="formTextOdd" align="center">2</td>
                    <td class="formTextOdd" align="center">73.51</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextGreen" href="/tc?module=MemberProfile&cr=252022">AleaActaEst</a></td>
                    <td class="formTextEven" align="center">1</td>
                    <td class="formTextEven" align="center">72.75</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/tc?module=MemberProfile&cr=271917">slowjoe</a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formTextOdd" align="center">72.72</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextBlue" href="/tc?module=MemberProfile&cr=280393">lAZer</a></td>
                    <td class="formTextEven" align="center">2</td>
                    <td class="formTextEven" align="center">72.46</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextGreen" href="/tc?module=MemberProfile&cr=272311">yellow_gecko</a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formTextOdd" align="center">72.44</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextGray" href="/tc?module=MemberProfile&cr=289864">FTolToaster</a></td>
                    <td class="formTextEven" align="center">2</td>
                    <td class="formTextEven" align="center">70.18</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/tc?module=MemberProfile&cr=300664">ahoenig</a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formTextOdd" align="center">69.35</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextGray" href="/tc?module=MemberProfile&cr=295413">alienisty</a></td>
                    <td class="formTextEven" align="center">1</td>
                    <td class="formTextEven" align="center">67.29</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextBlue" href="/tc?module=MemberProfile&cr=263386">TemporarilyBlue</a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formTextOdd" align="center">67.21</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextBlue" href="/tc?module=MemberProfile&cr=260172">ddwsdl</a></td>
                    <td class="formTextEven" align="center">2</td>
                    <td class="formTextEven" align="center">66.90</td>
                </tr>
                
                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextGray" href="/tc?module=MemberProfile&cr=343287">kameshjayaram</a></td>
                    <td class="formTextOdd" align="center">1</td>
                    <td class="formTextOdd" align="center">65.70</td>
                </tr>
                
                 <tr valign="top">
                    <td class="formHandleEven"><a class="coderTextGray" href="/tc?module=MemberProfile&cr=296226">CDummy</a></td>
                    <td class="formTextEven" align="center">1</td>
                    <td class="formTextEven" align="center">63.26</td>
                </tr>

                <tr valign="top">
                    <td class="formHandleOdd"><a class="coderTextGray" href="/tc?module=MemberProfile&cr=261909">RedSpectra</a></td>
                    <td class="formTextOdd" align="center">2</td>
                    <td class="formTextOdd" align="center">60.71</td>
                </tr>
                
                        </table>
                    </td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="bodyText">
                        
                        <hr width="100%" noshade="noshade" color="#666666" />
                        
                        <p><strong>Contest Requirements</strong><br />
                        Just submit designs that pass screening for a minimum of four Component Design Projects whose initial submission dates are between February 1, 2003 
                        and March 31, 2003. To pass screening, a design submission must score in the top 5 for that component and meet the minimum requirements of the 
                        screening scorecard.  All submissions that pass screening will be entered into the contest. The design submission with the highest review board score 
                        greater than or equal to 75 will be declared the component design winner for that project.</p>

 <!--                        <p>Get started today... There are plenty of <a href="/tc?module=ViewActiveContests&ph=112">Active Contests</a> for you to choose from.</p> -->

                        <p>Not sure what to submit? See our <a href="/tc?module=Static&d1=dev&d2=support&d3=desDocumentation">sample design solution</a> for ideas.</p>
                        
                        <hr width="100%" noshade="noshade" color="#666666" />
                        
                        <p><strong>Design and Development Terms</strong><br />
                        By indicating your interest in designing or developing a component for TopCoder, you represent to TopCoder the following:</p>

                        <ol>
                            <li>You are a rated TopCoder member</li>
                            <li>You are at least 18 years of age</li>
                            <li>You are either (i) a U.S. citizen, (ii) a lawful permanent resident of the U.S., (iii) a temporary resident, asylee, refugee, or 
                            have a lawfully issued work authorization card permitting unrestricted employment, or (iv) a non-U.S. citizen working in your 
                            country of residence.</li>
                        </ol>
                        
                        <p>Read the full <a href="/tc?module=Static&d1=about&d2=terms">Terms and Conditions</a></p>
                        
                        <hr width="100%" noshade="noshade" color="#666666" />
                        
                        <p><br /></p>
                        
                        <p>** Some members may be subject to applicable taxes.</p>
                     </td>
                  </tr>
               </table>


   <br><br>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
