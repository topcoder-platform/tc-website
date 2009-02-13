<%@  page language="java"  %>
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

<head>

<title>Design Review Board at TopCoder</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="review_board"/>
</jsp:include>

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
<td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="review_boards"/>  
           <jsp:param name="image1" value="white"/>  
           <jsp:param name="title" value="Design"/>  
        </jsp:include>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
      <tr>
         <td><img src="/i/clear.gif" width="240" height="1" border="0"><br>
<!-- Comment out until Dev info is available            <p align="right" >
               <a href="/?t=features&amp;c=#" class="bodyText"><strong>Go to Development Review Board</strong></a>
            </p> -->
            <p class="bodyText">
            Highly rated and experienced TopCoder members fill the ranks of the
            Architecture Review Board.  These members screen and review all design
            submissions to ensure the components meet the functional requirements,
            are documented properly and contain the appropriate sequence, use case
            and class diagrams.  Additionally, the Architecture Review Board
            recommends design enhancements and verifies the design is flexible
            enough to be reused and customized in the future.
            </p>
            <p class="bodyText">
            The following members have agreed to participate on the TopCoder Design Review Board:
            <br><br>
            </p>
         </td>
      </tr>

<table width="100%" border="0" cellpadding="3" cellspacing="0">
<tr><td valign="middle" bgcolor="#999999" colspan="3" class="statText"><font size="3"><strong>Design Review Board</strong></font></td></tr>
</table>
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=260578"><img src="/i/m/danno_mug.gif" alt="danno" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=260578"><strong>danno</strong></a><span class="smallText"> graduated with a BS degree in Computer Science and Mathematics from Houghton College.  He was the runner up for Best Paper at IEEE's SMC/ia 2001 Conference.</span>
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=158333"><img src="/i/m/dvickrey_mug.gif" alt="dvickrey" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=158333"><strong>dvickrey</strong></a><span class="smallText"></span>
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=299180"><img src="/i/m/isv_mug.gif" alt="isv" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=299180"><strong>isv</strong></a><span class="smallText"> graduated from Don State Technical University in Russia and is a certified specialist in Computer Science.</span>
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />
            
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=291974"><img src="/i/m/kanliang_mug.gif" alt="kanliang" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=291974"><strong>kanliang</strong></a><span class="smallText"> graduated from the Renmin University of China.  She hopes to learn from others' designs as part of the review board.</span>
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />
            
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=265736"><img src="/i/m/Ken_Alverson_mug.gif" alt="Ken Alverson" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=265736"><strong>Ken Alverson</strong></a><span class="smallText"> graduated from the Case Western Reserve University.  He placed 5th in a Microsoft Research sponsored collegiate programming competition.</span>
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />
            
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=154754"><img src="/i/m/Ken_Vogel_mug.gif" alt="Ken Vogel" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=154754"><strong>Ken Vogel</strong></a><span class="smallText"></span>
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />
            
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=152342"><img src="/i/m/kyky_mug.gif" alt="kyky" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=152342"><strong>kyky</strong></a><span class="smallText"> graduated from the Moscow Institute of Electronic Technology with a BS in Computer Engineering and also earned an MS in Computer Science from the New Jersey Institute of Technology.</span>
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />
            
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=292451"><img src="/i/m/Mr._Sketch_mug.gif" alt="Mr. Sketch" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=292451"><strong>Mr. Sketch</strong></a><span class="smallText"> graduated Cum Laude with a BS in Computer Science and Computer Engineering.  He also has four years of on-the-job experience designing software.</span>
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />
            
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=150940"><img src="/i/m/orb_mug.gif" alt="orb" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=150940"><strong>orb</strong></a><span class="smallText"> graduated from the University of Texas.  He has also written for several magazines including Java Developer's Journal and Doctor Dobb's Journal.  His first book should be coming out soon.</span>
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />
            
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=290395"><img src="/i/m/pmadden_mug.gif" alt="pmadden" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=290395"><strong>pmadden</strong></a><span class="smallText"> graduated with a BS and an MS in Computer Science and Mathematics from New Mexico Tech and also earned an PhD in Computer Science from UCLA.</span>
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />
            
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=138663"><img src="/i/m/Sord_mug.gif" alt="Sord" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=138663"><strong>Sord</strong></a><span class="smallText"></span>
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />
            
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=296145"><img src="/i/m/srowen_mug.gif" alt="srowen" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=296145"><strong>srowen</strong></a><span class="smallText"> graduated from Harvard University with a BA in Computer Science and has several Sun certifications.</span>
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />
            
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top"><br>
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=277356"><img src="/i/clear.gif" alt="aksonov" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>                        
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=277356"><strong>aksonov</strong></a><span class="smallText"> graduated from the Nikolaev Informatical and Mathematical Lyceum.  He was a jury member of the Ukranian Olympiads in informatics and won the ACM Regional Programming Contest award</span>
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
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=273206"><strong>b0b0b0b</strong></a><span class="smallText"> graduated from Carnegie Mellon University with a BS in Computer Science and Mathematics.</span>
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
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=153434"><strong>bokbok</strong></a><span class="smallText"> graduated from Princeton University.  He feels that being a part of the review board will allow him to learn from others as they learn from him.</span>
                        </p>                       
                     </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />
            
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=156859"><img src="/i/clear.gif" alt="ivern" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=156859"><strong>ivern</strong></a><span class="smallText"></span>
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
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=158258"><strong>jerm</strong></a><span class="smallText"></span>
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
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=158201"><strong>mecraw</strong></a><span class="smallText"> graduated from UMass Amherst.</span>
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
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=304697"><strong>ozzie</strong></a><span class="smallText"> graduated from Lalor Secondary College in Melbourne, Australia.  He is a Sun Certified Programmer for Java 1.1 and 1.4.</span>
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=119676"><img src="/i/clear.gif" alt="Pops" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=119676"><strong>Pops</strong></a><span class="smallText"> graduated from Indiana University and has received many corporate awards.</span>
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
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=293470"><strong>sapro</strong></a><span class="smallText"></span>
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
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=278595"><strong>seaniswise</strong></a><span class="smallText"></span>
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
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=272069"><strong>sunyuan</strong></a><span class="smallText"> graduated from the University of Toronto and looks forward to keeping up to date on new technologies by being on the review board.</span>
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
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=269515"><strong>valeriy</strong></a><span class="smallText"> graduated from St.-Petersburg State University in Russia.</span>
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />
            
            

            

<p align="middle" >
<A href="mailto:service@topcodersoftware.com" class="bodyText">Have a question about the TopCoder Design Review Board?</strong></a>
</p>
<p><br></p>

<!-- Center Column Ends -->

<!-- Gutter -->
      <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
       <td width="170">
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
