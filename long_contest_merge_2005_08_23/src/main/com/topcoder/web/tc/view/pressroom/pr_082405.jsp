<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

<jsp:include page="../script.jsp" />
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="press_room"/>
                <jsp:param name="level2" value=""/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">


            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                    <jsp:include page="../page_title.jsp" >
                        <jsp:param name="image" value="press_room"/>
                        <jsp:param name="title" value="Press Release"/>
                    </jsp:include>
                        <div align="center">
                        <p><span class="bodyTitle">TopCoder&#174; Announces 16 Finalists in Component Tournament of 2005 TopCoder Open</span><br />
                        <span class="bodySubTitle"><em>World Championship of Software Design and Development in Java and C# Starts Today</em></span></p>
                        </p>
                        </div>
                        
<p><strong>GLASTONBURY, CT, August 24, 2005 &#151;</strong>TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced the 16 finalists who have advanced in the 2005 TopCoder Open Component tournament. This year's tournament, sponsored by Sun Microsystems, received a record number of entries from more than 60 countries and included highly talented computer scientists from both the professional and academic sectors. The TopCoder Open brings together thousands of the world's finest programmers in competition for international ranking, notoriety and a share of the $150,000 prize purse for Algorithm, Component Design and Development categories.
<br><br>
Beginning June 29th, hundreds of programmers from around the world have been competing online for qualification and advancement. Through a series of elimination rounds, this field has now been narrowed to 16 final competitors - 8 designers and 8 developers. Today these elite finalists continue the journey that will culminate in face-to-face competition at the Santa Clara Marriott in California from October 12 - 14 to determine who will be crowned the 2005 winners of TopCoder Open Design and Development tournaments. Onsite finals Champions will be awarded $46,500 for the design competition and $28,500 for the development competition.
<br><br>
The 16 finalists in the Component Design and Development Tournaments are: 
<br><br>
<table class="sidebarBox" align="center" border="0" cellpadding="6" cellspacing="2" width="500">
<tr>
   <td class="sidebarTitle" align="center" width="50%">Design Competitors</td>
   <td class="sidebarTitle" align="center" width="50%">Development Competitors</td>
</tr>
<tr class="sidebarText">
   <td>Kyle Littlefield, Richland, WA, USA</td>
   <td>Carl Nettelblad, Vänge, Sweden</td>
</tr>      
<tr class="sidebarText">
   <td>Xiaodong Li, China</td>
   <td>Sindunata Sudarmaji, Surabaya, Indonesia</td>
</tr>      
<tr class="sidebarText">
   <td>Zhimin Chen, HangZhou, China</td>
   <td>Marcin   Stefaniak, Gdansk, Poland</td>
</tr>      
<tr class="sidebarText">
   <td>Celsus   Kintanar, Laguna, Philippines</td>
   <td>Qi Liu, China</td>
</tr>      
<tr class="sidebarText">
   <td>Nikolay Archak, Russian Federation</td>
   <td>Zheng   Zhang, Hangzhou, China</td>
</tr>      
<tr class="sidebarText">
   <td>Tim Roberts, Cary, NC, USA</td>
   <td>Chen QiangQiang, Hangzhou, China</td>
</tr>      
<tr class="sidebarText">
   <td>John Bollinger, Bloomington, IN, USA</td>
   <td>Meng Wang, Shenzhen, China</td>
</tr>      
<tr class="sidebarText">
   <td>Sergey Kalinichenko, San Francisco, CA, USA</td>
   <td>Chi On   Lau, Hong Kong</td>
</tr>      
</table>
<br><br>
The TopCoder Component tournament challenges contestants to submit component designs that adhere to strict project specifications and development solutions for those designs. Submissions are independently reviewed and scored by TopCoder's Architecture and Design Review Boards to determine final ranking placement for each component. 
<br><br>
Review Board
Design   Development
Jiazhi Wu, China   Mihai Pasca, Romania
Pavlo Aksonov, Ukraine   Alejandro Marcu, Argentina
Adrian Nicolae Carcu, Romania   Francois Bonin, Ghana
<br><br>
"We've seen a dramatic growth in the component division - more than twice the number of participants registered this year compared to last year and that really shows it's the hottest area of interest in TopCoder competitions," said Rob Hughes, President and COO of TopCoder. "It's a perfect parallel to our TopCoder Software component competitions which allow members to win prize money online, 24 hours a day, seven days a week." 
<br><br>
Full competition details and rules are provided at: <A href="tco05">http://www.topcoder.com/tco05</A>
<br><br>
About TopCoder, Inc.
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.
<br><br>
TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.
                        </p>
                        <p>###</p>
                        <p><br /></p>
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
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
