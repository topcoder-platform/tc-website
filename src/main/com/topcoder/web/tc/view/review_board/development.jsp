<%@  page language="java"  %>
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

<head>

<title>Development Review Board at TopCoder</title>

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
                <jsp:param name="level2" value="development"/> 
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
           <jsp:param name="title" value=""/>  
        </jsp:include>

<table border="0" cellspacing="10" cellpadding="0" width="100%" align="center">
      <tr>
         <td width="50%"></td>
<%--         <td height="42"><A href="/tc?module=Static&amp;d1=review_board&amp;d2=competition"  target="_top"><img src="/i/promos/competition_rb_promo.gif" alt="competition" width="175" height="86" border="0" /></A></td>--%>
         <td height="42"><A href="/tc?module=Static&amp;d1=review_board&amp;d2=design"  target="_top"><img src="/i/promos/design_rb_promo.gif" alt="competition" width="175" height="86" border="0" /></A></td>
         <td height="42""><A href="/tc?module=Static&amp;d1=review_board&amp;d2=development"  target="_top"><img src="/i/promos/development_rb_promo.gif" alt="competition" width="175" height="86" border="0" /></A></td>
         <td width="50%"></td>
      </tr>
</table>

<table width="100%" border="0" cellpadding="3" cellspacing="0">
      <tr><td valign="middle" bgcolor="#999999" colspan="3" class="statText"><font size="3"><strong> Development Review Board</strong></font></td></tr>
</table>      

<table border="0" cellspacing="0" cellpadding="0" width="100%">
      <tr>
         <td><img src="/i/clear.gif" width="240" height="1" border="0"><br>
<!-- Comment out until Dev info is available            <p align="right" >
               <a href="/?t=features&amp;c=#" class="bodyText"><strong>Go to Development Review Board</strong></a>
            </p> -->
            <p class="bodyText">
            TopCoder Software utilizes past component development winners and
            accomplished TopCoder competitors to staff the Development Review Board.
            These reviewers verify that each development submission meets the
            required functionality, coding style, adheres to the component design
            and contains a suitable test suite.  Furthermore, to certify the
            component belongs in the TopCoder catalog, the development review board
            adds a suite of test cases including stress, accuracy and failure tests
             to the component.
            </p>
            <p class="bodyText">
            The following members have agreed to participate on the TopCoder Development Review Board:
            <br>
            </p>
         </td>
      </tr>

<table width="100%" border="0" cellpadding="3" cellspacing="0">
</table>

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=278342"><img src="/i/m/adic_mug.gif" alt="adic" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=278342"><strong>adic</strong></a> has been a valued member on twenty different review board projects.  When he is not reviewing components, Adic has also won several design and development competitions.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=154579"><img src="/i/m/Altrag_mug.gif" alt="Altrag" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=154579"><strong>Altrag</strong></a> graduated from the University of Calgary and also placed 27th in the 2002 ACM ICPC world finals.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=260911"><img src="/i/m/amitc_mug.gif" alt="amitc" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=260911"><strong>amitc</strong></a> is currently pursuing his undergraduate degree in Computer Science from SVCE. He has won many regional programming contests and enjoys finding bugs in software. He enjoys being part of the review board as it presents him an opportunity to examine some of the finest solutions from all over the world. 
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=287614"><img src="/i/m/argolite_mug.gif" alt="argolite" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=287614"><strong>argolite</strong></a> graduated from the University of British Columbia.  He believes that being a part of the review board allows him to see solutions to problems from angles he might not have seen on his own.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=111202"><img src="/i/m/ColinMacLeod_mug.gif" alt="ColinMacLeod" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=111202"><strong>ColinMacLeod</strong></a> has been reviewing components for TopCoder software for over 5 months and has worked on the Jar Compressor, Random String Generator, Class Discovery and other components.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=152605"><img src="/i/m/georgepf_mug.gif" alt="georgepf" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=152605"><strong>georgepf</strong></a> graduated from MIT and has served as an accuracy tester for several components.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=279471"><img src="/i/m/haha_mug.gif" alt="haha" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=279471"><strong>haha</strong></a> graduated from Tsinghua University in Beijing, China.  He has also had training to attend ACM/ICPC 2000 and 2001.  As a member of the review board, haha feels he learns alot from reviewing the submitter's excellent ideas and submissions.
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
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=152342"><strong>kyky</strong></a> graduated from the Moscow Institute of Electronic Technology with a BS in Computer Engineering and also earned an MS in Computer Science from the New Jersey Institute of Technology.  kyky enjoys being part of the review board because he feels looking at other people's designs gives him the chance to learn from the thinking that went into the design and that's in addition to the aesthetic pleasure of looking at good designs.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />
            
            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=280367"><img src="/i/m/lkw_mug.gif" alt="lkw" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=280367"><strong>lkw</strong></a>  graduated from Queens College and is a Sun Certified Programmer for Java2 Platform.   Joining the review board has given lkw greater exposure to the software design process in a group setting
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=108262"><img src="/i/m/mathgodleo_mug.gif" alt="mathgodleo" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=108262"><strong>mathgodleo</strong></a> graduated from Caltech and enjoys seeing the different ways that different people can implement the same design by being on the review board.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=299904"><img src="/i/m/mishagam_mug.gif" alt="mishagam" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=299904"><strong>mishagam</strong></a> reviews both .NET and Java solutions as a member of the review board.  He is also the winning developer of the .NET Math Expression Evaluator component.   
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=289824"><img src="/i/m/MPhk_mug.gif" alt="MPhk" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=289824"><strong>MPhk</strong></a> has won over $400 dollars as a designer for TopCoder Software components.  One of his winning designs is the SVG 2DGraphics component.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=296745"><img src="/i/m/pzhao_mug.gif" alt="pzhao" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=296745"><strong>pzhao</strong></a> graduated with a BS from Tsinghua University in Beijing, China.  He competed in ACM 1998 and his team finished in 7th place in the final round.  Pzhao enjoys being a member of the review board because he believes testing is a crucial to guaranteeing high quality software.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=268546"><img src="/i/m/tangentz_mug.gif" alt="TangentZ" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=268546"><strong>TangentZ</strong></a> received a Master of Computer Science degree from Dalhousie University.  While in school, he spent time researching artificial intelligence with a focus on neural networks. 
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=299761"><img src="/i/m/techie1_mug.gif" alt="techie1" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=299761"><strong>techie1</strong></a> graduated from the Stevens Institute of Technology.  He is also a developer for Java, MCSD, and MCSD.NET.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=297731"><img src="/i/m/TheCois_mug.gif" alt="TheCois" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=297731"><strong>TheCois</strong></a> has recently joined the development review board.  TheCois has proven to be a successful designer and developer by winning competitions in both categories.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=302018"><img src="/i/m/Tomson_mug.gif" alt="Tomson" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=302018"><strong>Tomson</strong></a> attends the Shanghai Jiaotong University.  In high school, he was the runner-up in the National Olympic of Information and won the first-class prize in the National Physics Olympics.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=158447"><img src="/i/m/vald_mug.gif" alt="vald" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=158447"><strong>ValD </strong></a> currently studies at the University of Albany and plans to graduate with honors.  In his spare time, he studies optimization problems and evolution strategies.  In fact, ValD believes he may be making progress towards a new evolution model. ValD says he has joined the review board because it provides deep insight into how teams of developers function.  The board has great flexibility with work distribution and treats everyone like an independent contractor.  This is a great plus for anyone with business goals.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=286907"><img src="/i/m/WishingBone_mug.gif" alt="WishingBone" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=286907"><strong>WishingBone</strong></a> graduated from Zhejiang University and enjoys meeting outstanding programmers world-wide through his participation in the review boards
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=251989"><img src="/i/clear.gif" alt="AdamSelene" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=251989"><strong>AdamSelene</strong></a> has reviewed several components including Phonetic Pattern Matching, Java FTP and the Value Object Generator components.  AdamSelene is also certifing completed TopCoder components.
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
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=277356"><strong>aksonov</strong></a> graduated from the Nikolaev Informatical and Mathematical Lyceum.  He was a jury member of the Ukranian Olympiads in informatics and won the ACM Regional Programming Contest award.  Aksonov also serves on our Architecture review board and reviews both .NET and Java components.
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
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=273206"><strong>b0b0b0b</strong></a> graduated from Carnegie Mellon University with a BS in Computer Science and Mathematics.   b0b0b0b also serves on the Architecture Review Board and the Application Design and Development Boards.
                        </p>                       
                     </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=262467"><img src="/i/clear.gif" alt="billy" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=262467"><strong>billy</strong></a> attends the Georgia Institute of Technology.  Billy has participated in many different components, including reviewing the Lazy Instantiation List component.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=290448"><img src="/i/clear.gif" alt="BryanChen" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=290448"><strong>BryanChen</strong></a> has earned his way onto the review board by winning several development solutions.  BryanChen is currently attending Carnegie Mellon University and sees the review board as a way to contribute back to the TopCoder Software development process.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=303185"><img src="/i/clear.gif" alt="Cosmin.ro" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=303185"><strong>Cosmin.ro</strong></a> has been a valued member of the review board.  He has served as accuracy, failure and stress tester on several different Java component competitions.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=159921"><img src="/i/clear.gif" alt="Da Twink Daddy" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=159921"><strong>Da Twink Daddy</strong></a> has participated on the review board as a .NET Reviewer.  .NET is not the only language Da Twink Daddy excels at.  He has also worked on internal Java projects for TopCoder. 
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=271773"><img src="/i/clear.gif" alt="heather" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=271773"><strong>heather</strong></a> has reviewed over 10 components for TopCoder Software.  Besides reviewing components, heather developed the current TopCoder Software website.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=288429"><img src="/i/clear.gif" alt="jfjiang" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=288429"><strong>jfjiang</strong></a> has recently joined the Development Review Board.  Jfjiang has competed on several development projects at TopCoder Software.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=151886"><img src="/i/clear.gif" alt="kdby" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=151886"><strong>kdby</strong></a> is a new addition to the review and has already reviewed several component projects.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=272490"><img src="/i/clear.gif" alt="kolanovic" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=272490"><strong>kolanovic</strong></a> has served as a valued member of the review board for several components including the Jar Compressor component.  Additionally, kolanovic has served on the Application Development Review Board.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=157582"><img src="/i/clear.gif" alt="msuhocki" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=157582"><strong>msuhocki</strong></a> has recently joined the review board after winning two components.  Msuhocki has proven to be a well rounded developer by winning both a .NET and Java competition.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=158922"><img src="/i/clear.gif" alt="Revoklaw" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=158922"><strong>Revoklaw</strong></a> has reviewed over 8 components and earned more than $750 dollars serving on the Review Board.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=158922"><img src="/i/clear.gif" alt="snard6" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=158922"><strong>snard6</strong></a> recently joined the review board because of his performance in recent development competitions.
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=150498"><img src="/i/clear.gif" alt="ThinMan " width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=150498"><strong>ThinMan</strong></a> graduated with a BS in Mathematics and Chemistry from Washington University.  He also has a PhD in Inorganic Chemistry from Northwestern University.  In his field, he works to develop and maintain crystallographic software.
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
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=269515"><strong>valeriy</strong></a> graduated from St.-Petersburg State University in Russia.  Valeriy enjoys being a member of TopCoder because of TopCoder's spirit of innovation.  Not only has Valeriy served on the Development Review Board, but he has also serves on the Architecture Review Board and the Application Development and Design Review Boards. 
                        </p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />
            

<p align="middle" >
<A href="mailto:service@topcodersoftware.com" class="bodyText">Have a question about the TopCoder Development Review Board?</strong></a>
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
