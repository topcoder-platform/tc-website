<%@  page language="java"  %>
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

<head>

<title>Register for membership in TopCoder</title>

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
            <jsp:include page="../includes/left.jsp">
                <jsp:param name="level1" value="review_board"/>
                <jsp:param name="level2" value="competition"/> 
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1"></td>
<!-- Gutter Ends -->

<!-- Center Column Begins --> 
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#FFFFFF" VALIGN="top">
<xsl:call-template name="BodyTop">
<!--  <xsl:with-param name="image1">white</xsl:with-param>-->
<!--  <xsl:with-param name="image">features</xsl:with-param>-->
<xsl:with-param name="title">&#160;Competition</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>          
					<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#FFFFFF">
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="21" BORDER="0"/></TD></TR>						
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">
<!-- <IMG SRC="/i/f/feat_050102_tn3.jpg" ALT="" WIDTH="100" HEIGHT="150" HSPACE="10" VSPACE="3" ALIGN="right" BORDER="0"/> -->

<p>
TopCoder is pleased to announce the formation of a Competition Review Board. The Review Board’s 
responsibilities include making recommendations on how to improve the quality and integrity of TopCoder 
Competitions. The Review Board will also provide us with guidelines on how we can best handle sub-optimal 
situations that can arise during competitions.
</p>
<p>
The following members have agreed to participate on the TopCoder Competition Review Board:
</p>
<table width="100%" border="0" cellpadding="3" cellspacing="0">
<tr><td valign="middle" bgcolor="#999999" colspan="3" class="statText"><font size="3"><strong>Competition Review Board</strong></font></td></tr>


            <table width="100%" border="0" cellpadding="3" cellspacing="0">
                <tr valign="top">
                    <td width="274"><img src="/i/m/schveiguy_mug.gif" alt="schveiguy" width="55" height="61" border="0" /></td>
                    <td width="99%" class="bodyText">
                        <p>
                        schveiguy graduated with a Bachelors degree in Computer Science from Worcester Polytechnic 
                        Institute and currently works as a Senior Software Developer at Network Engines in Canton, 
                        Massachusetts.
                        </p>                       
                     </td>
                </tr>
            </table>

<hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><img src="/i/m/tangentz_mug.gif" alt="schveiguy" width="55" height="61" border="0" /></td>
                    <td width="99%" class="bodyText">
                        <p>
                        TangentZ received a Master of Computer Science degree from Dalhousie University.  While in 
                        school, he spent time researching artificial intelligence with a focus on neural networks.
                        </p>                       
                     </td>
                </tr>
            </table>

<hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><img src="/i/m/vald_mug.gif" alt="schveiguy" width="55" height="61" border="0" /></td>
                    <td width="99%" class="bodyText">
                        <p>
                        ValD currently studies at the University of Albany and plans to graduate with honors.  In his 
                        spare time, he studies optimization problems and evolution strategies.  In fact, ValD believes 
                        he may be making progress towards a new evolution model.
                        </p>                       
                     </td>
                </tr>
            </table>

<hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><img src="/i/m/SnapDragon_mug.gif" alt="schveiguy" width="55" height="61" border="0" /></td>
                    <td width="99%" class="bodyText">
                        <p>
                        SnapDragon has participated in over 50 TopCoder rated events.  He is currently TopCoder’s 
                        highest rated member, and is one of only two members who have broken the 3300 rating 
                        mark.  SnapDragon is a graduate of the University of Waterloo and currently works for 
                        Bioinformatics Solutions Inc. in Ontario, Canada.
                        </p>                       
                     </td>
                </tr>
            </table>            

<hr width="100%" size="1" noshade="noshade" />

<!-- Center Column Ends -->


<!-- Gutter -->
      <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
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
