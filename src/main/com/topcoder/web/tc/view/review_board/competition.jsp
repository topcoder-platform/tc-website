<%@  page language="java"  %>
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

<head>

<title>Competition Review Board at TopCoder</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="location" value="registration"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="review_board"/>
                <jsp:param name="level2" value="competition"/> 
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1"></td>
<!-- Gutter Ends -->

<!-- Center Column Begins --> 
        <td class="bodyText" width="100%">
            
            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr valign="top">
                    <td class="bodyText" width="100%"><img src="/i/clear.gif" alt="" width="240" height="10" border="0"/><br/>          

                        <p>TopCoder is pleased to announce the formation of a Competition Review Board. The Review Board’s 
                        responsibilities include making recommendations on how to improve the quality and integrity of TopCoder 
                        Competitions. The Review Board will also provide us with guidelines on how we can best handle sub-optimal 
                        situations that can arise during competitions.</p>

                        <p>The following members have agreed to participate on the TopCoder Competition Review Board:</p>
                    </td>
                </tr>

                <tr><td valign="middle" bgcolor="#999999" class="statText"><font size="3"><strong>Competition Review Board</strong></font></td></tr>
                
            </table>

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><img src="/i/m/schveiguy_mug.gif" alt="schveiguy" width="55" height="61" border="0" /></td>
                    <td width="99%" class="bodyText">
                        <p>schveiguy graduated with a Bachelors degree in Computer Science from Worcester Polytechnic 
                        Institute and currently works as a Senior Software Developer at Network Engines in Canton, 
                        Massachusetts.</p>                       
                     </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><img src="/i/m/tangentz_mug.gif" alt="tangentz" width="55" height="61" border="0" /></td>
                    <td width="99%" class="bodyText">
                        <p>TangentZ received a Master of Computer Science degree from Dalhousie University.  While in 
                        school, he spent time researching artificial intelligence with a focus on neural networks.</p>                       
                     </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><img src="/i/m/vald_mug.gif" alt="vald" width="55" height="61" border="0" /></td>
                    <td width="99%" class="bodyText">
                        <p>ValD currently studies at the University of Albany and plans to graduate with honors.  In his 
                        spare time, he studies optimization problems and evolution strategies.  In fact, ValD believes 
                        he may be making progress towards a new evolution model.</p>                       
                     </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><img src="/i/m/SnapDragon_mug.gif" alt="snapdragon" width="55" height="61" border="0" /></td>
                    <td width="99%" class="bodyText">
                        <p>SnapDragon has participated in over 50 TopCoder rated events.  He is currently TopCoder’s 
                        highest rated member, and is one of only two members who have broken the 3300 rating 
                        mark.  SnapDragon is a graduate of the University of Waterloo and currently works for 
                        Bioinformatics Solutions Inc. in Ontario, Canada.</p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

<!-- Center Column Ends -->

<!-- Gutter -->
      <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0">
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
