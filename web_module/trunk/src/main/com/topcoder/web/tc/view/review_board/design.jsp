<%@  page language="java"  %>
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

<head>

<title>Design Review Board at TopCoder</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<jsp:include page="../top.jsp" />

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="review_board"/>
                <jsp:param name="level2" value="design"/> 
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1"></td>
<!-- Gutter Ends -->

<!-- Center Column Begins --> 
        <td class="bodyText" width="99%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="review_boards"/>  
           <jsp:param name="image1" value="white"/>  
           <jsp:param name="title" value=""/>  
        </jsp:include>

            <table border="0" cellspacing="10" cellpadding="0" width="100%" align="center">
                <tr>
                    <td width="49%"></td>
<%--         <td height="42"><A href="/tc?module=Static&amp;d1=review_board&amp;d2=competition"  target="_top"><img src="/i/promos/competition_rb_promo.gif" alt="competition" width="175" height="86" border="0" /></A></td>--%>
                    <td height="42"><A href="/tc?module=Static&amp;d1=review_board&amp;d2=design"  target="_top"><img src="/i/promos/design_rb_promo.gif" alt="competition" width="175" height="86" border="0" /></A></td>
                    <td height="42"><A href="/tc?module=Static&amp;d1=review_board&amp;d2=development"  target="_top"><img src="/i/promos/development_rb_promo.gif" alt="competition" width="175" height="86" border="0" /></A></td>
                    <td width="49%"></td>
                </tr>
            </table>

            <table width="100%" border="0" cellpadding="3" cellspacing="0">
                <tr><td valign="middle" bgcolor="#999999" colspan="3" class="statText"><font size="3"><strong> Design Review Board</strong></font></td></tr>
            </table>      

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td class="bodyText"><img src="/i/clear.gif" width="240" height="1" border="0"><br>
<!-- Comment out until Dev info is available            <p align="right" >
               <a href="/?t=features&amp;c=#" class="bodyText"><strong>Go to Development Review Board</strong></a>
            </p> -->
                        <p>Highly rated and experienced TopCoder members fill the ranks of the Architecture Review Board.  These members screen and review all design
                        submissions to ensure the components meet the functional requirements, are documented properly and contain the appropriate sequence, use case
                        and class diagrams.  Additionally, the Architecture Review Board recommends design enhancements and verifies the design is flexible
                        enough to be reused and customized in the future.</p>
            
                        <p>The following members have agreed to participate on the TopCoder Design Review Board:</p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top"><br>
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=277356"><img src="/i/m/aksonov_mug.gif" alt="aksonov" width="63" height="70" border="0"  class="myStatsPhoto"/></a></td>
                    <td width="99%" class="bodyText">
                        <p>                        
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=277356"><strong>aksonov</strong></a> graduated from the Nikolaev Informatical and Mathematical Lyceum.  He was a jury member of the Ukranian Olympiads in informatics and won the ACM Regional Programming Contest award
                        </p>
                     </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=260578"><img src="/i/m/danno_mug.gif" alt="danno" width="63" height="70" border="0" class="myStatsPhoto"/></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=260578"><strong>danno</strong></a> graduated with a BS degree in Computer Science and Mathematics from Houghton College.  He was the runner up for Best Paper at IEEE's SMC/ia 2001 Conference.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=158333"><img src="/i/m/dvickrey_mug.gif" alt="dvickrey" width="63" height="70" border="0" class="myStatsPhoto"/></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=158333"><strong>dvickrey</strong></a> has reviewed over 15 components and has earned over a $1,000 as a review board member.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=299180"><img src="/i/m/isv_mug.gif" alt="isv" width="63" height="70" border="0" class="myStatsPhoto"/></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=299180"><strong>isv</strong></a> graduated from Don State Technical University in Russia and is a certified specialist in Computer Science.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />
            
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=156859"><img src="/i/m/ivern_mug.gif" alt="ivern" width="63" height="70" border="0" class="myStatsPhoto"/></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=156859"><strong>ivern</strong></a> has reviewed the DNS Query, Magic Numbers, Integer Utility and more then 10 other components.  Ivern has earned over $900 dollars reviewing components.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />
            
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=291974"><img src="/i/m/kanliang_mug.gif" alt="kanliang" width="63" height="70" border="0" class="myStatsPhoto"/></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=291974"><strong>kanliang</strong></a> graduated from the Renmin University of China.  She hopes to learn from others' designs as part of the review board.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />
            
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=265736"><img src="/i/m/Ken_Alverson_mug.gif" alt="Ken Alverson" width="63" height="70" border="0" class="myStatsPhoto"/></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=265736"><strong>Ken Alverson</strong></a> graduated from the Case Western Reserve University.  He placed 5th in a Microsoft Research sponsored collegiate programming competition.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />
            
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=154754"><img src="/i/m/Ken_Vogel_mug.gif" alt="Ken Vogel" width="63" height="70" border="0" class="myStatsPhoto"/></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=154754"><strong>Ken Vogel</strong></a> has reviewed over 20 components including .NET and Java submissions.  Ken Vogel has also earned over $2,700 from TopCoder software by reviewing components and winning more than 5 designs.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />
            
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=152342"><img src="/i/m/kyky_mug.gif" alt="kyky" width="63" height="70" border="0" class="myStatsPhoto"/></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=152342"><strong>kyky</strong></a> graduated from the Moscow Institute of Electronic Technology with a BS in Computer Engineering and also earned an MS in Computer Science from the New Jersey Institute of Technology.  kyky enjoys being part of the review board because he feels looking at other people's designs gives him the chance to learn from the thinking that went into the design and that's in addition to the aesthetic pleasure of looking at good designs. 
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />
            
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=292451"><img src="/i/m/Mr._Sketch_mug.gif" alt="Mr. Sketch" width="63" height="70" border="0" class="myStatsPhoto"/></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=292451"><strong>Mr. Sketch</strong></a> graduated Cum Laude with a BS in Computer Science and Computer Engineering.  He also has four years of on-the-job experience designing software.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />
            
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=150940"><img src="/i/m/orb_mug.gif" alt="orb" width="63" height="70" border="0" class="myStatsPhoto"/></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=150940"><strong>orb</strong></a> graduated from the University of Texas.  He has also written for several magazines including Java Developer's Journal and Doctor Dobb's Journal.  His first book should be coming out soon.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />
            
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=290395"><img src="/i/m/pmadden_mug.gif" alt="pmadden" width="63" height="70" border="0" class="myStatsPhoto"/></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=290395"><strong>pmadden</strong></a> graduated with a BS and an MS in Computer Science and Mathematics from New Mexico Tech and also earned an PhD in Computer Science from UCLA.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />
            
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=119676"><img src="/i/m/Pops_mug.gif" alt="Pops" width="63" height="70" border="0"  class="myStatsPhoto"/></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=119676"><strong>Pops</strong></a> graduated from Indiana University and has received many corporate awards.  Pops was also our first design contest winner!
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=138663"><img src="/i/m/Sord_mug.gif" alt="Sord" width="63" height="70" border="0" class="myStatsPhoto"/></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=138663"><strong>Sord</strong></a> has been a valued member of the review board since the beginning of 2003.  He has reviewed many components including the Thesaurus and Chart Data Structure components.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />
            
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=296145"><img src="/i/m/srowen_mug.gif" alt="srowen" width="63" height="70" border="0" class="myStatsPhoto"/></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=296145"><strong>srowen</strong></a> graduated from Harvard University with a BA in Computer Science and has several Sun certifications.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />
            
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=273206"><img src="/i/clear.gif" alt="b0b0b0b" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=273206"><strong>b0b0b0b</strong></a> graduated from Carnegie Mellon University with a BS in Computer Science and Mathematics.
                        </p>                       
                     </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=153434"><img src="/i/clear.gif" alt="bokbok" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=153434"><strong>bokbok</strong></a> graduated from Princeton University.  He feels that being a part of the review board will allow him to learn from others as they learn from him.
                        </p>                       
                     </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />
            
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=158258"><img src="/i/clear.gif" alt="jerm" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=158258"><strong>jerm</strong></a> has reviewed numerous components including the Lightweight Model View Controller component.  Jerm has served on this board since February.
                        </p>                       
                     </td>
                </tr>
            </table>            
            
            <hr width="100%" size="1" noshade="noshade" />
            
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=158201"><img src="/i/clear.gif" alt="mecraw" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=158201"><strong>mecraw</strong></a> is a well respected and valued review board member.  Mecraw graduated from UMass Amherst and has over 6 years of experience designing systems.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />
            
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=304697"><img src="/i/clear.gif" alt="ozzie" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=304697"><strong>ozzie</strong></a> graduated from Lalor Secondary College in Melbourne, Australia.  He is a Sun Certified Programmer for Java 1.1 and 1.4.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=293470"><img src="/i/clear.gif" alt="sapro" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=293470"><strong>sapro</strong></a> has earned over $900 dollars and reviewed more than 15 components as a member of the Review Board
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=278595"><img src="/i/clear.gif" alt="seaniswise" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=278595"><strong>seaniswise</strong></a> has reviewed over 20 components for TopCoder Software.  seaniswise has also won several design contests.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />
            
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=272069"><img src="/i/clear.gif" alt="sunyuan" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=272069"><strong>sunyuan</strong></a> graduated from the University of Toronto and looks forward to keeping up to date on new technologies by being on the review board.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />
            
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=269515"><img src="/i/clear.gif" alt="valeriy" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=269515"><strong>valeriy</strong></a> graduated from St.-Petersburg State University in Russia.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <p align="middle" ><A href="mailto:service@topcodersoftware.com" class="bodyText">Have a question about the TopCoder Design Review Board?</strong></a></p>
            
            <p><br></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
      <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
       <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"><br/>
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="review_board"/>
                <jsp:param name="level2" value="competition"/> 
            </jsp:include>
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
      <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
