<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page errorPage="/errorPage.jsp" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<HTML>
<HEAD>
<title>Topcoder&#160;&#160;|&#160;&#160;Testing Application Management Tool</title>
<jsp:include page="/script.jsp"/>
</HEAD>

<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">            
    <tr><td colspan="3" class="globalNavSmall"><img src="/i/clear.gif" width="1" height="15" border="0"/></td></tr>

    <tr>
        <td width="15"><a name="top"></a><img src="/i/clear.gif" width="15" height="1" alt="" border="0"></td>
        <td width="206"><img src="/i/logo_testing.gif" width="206" height="49" border="0" alt="TopCoder Testing Application" vspace="13"></TD>
        <td width="100%"><img src="/i/clear.gif" width="1" height="1" alt="" border="0"></td>
    </tr>             

    <tr><td colspan="3" class="testTop"><img src="/i/clear.gif" width="1" height="18" border="0"/></td></tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- gutter begins -->
        <td width="25"><img src="/i/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- gutter ends -->

<!-- Middle column begins -->
        <td width="50%" align="center"><img src="/i/clear.gif" width="400" height="11" alt="" border="0"><br>
            <table border="0" cellspacing="0" cellpadding="0" width="50%">
                <tr valign="top">
                    <td class="bodyText">
            <h1 class="testHead">Problem Detail</h1>
                    </td>
                </tr>
            </table>

            <FORM>
            <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
           <TR>
              <TD COLSPAN="6"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>


            <jsp:useBean id="problemInfo" type="com.topcoder.web.screening.model.ProblemInfo" scope="request" />
            <TR>
              <TD COLSPAN="6" CLASS="statText" HEIGHT="15" BGCOLOR="#666666">&#160;<B><jsp:getProperty name="problemInfo" property="problemName" /></B></TD>
           </TR>
	        <TR>
		       <TD COLSPAN="2" VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;</B></TD>
		       <TD COLSPAN="2" VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;TopCoder Submission %</B></TD>
		       <TD COLSPAN="2" VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;</B></TD>		       
	        </TR>	        
            <TR>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Division</B></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Difficulty</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;Overall Accuracy %</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;Sub. Acc. %</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;Sub. %</B></TD>		       		       		       		       
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Algorithmic Categories</B></TD>
<%--               <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Business Categories</B></TD> --%>
            </TR>
           <TR>
              <TD COLSPAN="6"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>
            <TR>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<jsp:getProperty name="problemInfo" property="divisionDesc" /></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<jsp:getProperty name="problemInfo" property="difficultyDesc" /></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<jsp:getProperty name="problemInfo" property="overallAccuracy" />%</TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<jsp:getProperty name="problemInfo" property="submissionAccuracy" />%</TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<jsp:getProperty name="problemInfo" property="submission" />%</TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<jsp:getProperty name="problemInfo" property="algorithmicCategoryList" /></TD>
<%--               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<jsp:getProperty name="problemInfo" property="businessCategoryList" /></TD> --%>
            </TR>
           <TR>
              <TD COLSPAN="6"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="30" BORDER="0"></TD>
           </TR>
         </TABLE>

         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
           <TR>
              <TD CLASS="bodyText" VALIGN="middle" BGCOLOR="#CCCCCC" HEIGHT="15">&#160;<b>Problem Statement:</b></TD>
           </TR>
           <TR>
              <TD CLASS="bodyText" VALIGN="top">
<screen:problemStatement text="<%=problemInfo.getProblemStatement()%>" language="Java" />
              </TD>
           </TR>
           <TR>
              <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD colspan="2" class="errorText" align="left" valign="middle"></TD>
           </TR>
         </TABLE>
</FORM>
            <p><br></p>
        </td>
<!-- Middle Column ends -->

<!-- Gutter -->
        <td width="25"><img src="/i/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

  <jsp:include page="/includes/foot.jsp" />

</body>
</html>
