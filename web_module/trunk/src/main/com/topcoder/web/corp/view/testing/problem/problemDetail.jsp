<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="screening.tld" prefix="screen" %>
<HTML>
<HEAD>
<title>Topcoder&#160;&#160;|&#160;&#160;Technical Assessment Application Management Tool</title>
<jsp:include page="../includes/script.jsp"/>
</HEAD>

<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">
    <tr><td colspan="3" class="globalNavSmall"><img src="/i/corp/clear.gif" width="1" height="15" border="0"/></td></tr>

    <tr>
        <td width="15"><a name="top"></a><img src="/i/corp/clear.gif" width="15" height="1" alt="" border="0"></td>
        <td width="206"><img src="/i/corp/logo_testing.gif" width="206" height="49" border="0" alt="TopCoder Technical Assessment Application" vspace="13"></TD>
        <td width="100%"><img src="/i/corp/clear.gif" width="1" height="1" alt="" border="0"></td>
    </tr>

    <tr><td colspan="3" class="testTop"><img src="/i/corp/clear.gif" width="1" height="18" border="0"/></td></tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- gutter begins -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- gutter ends -->

<!-- Middle column begins -->
        <td width="50%"></td>
        <td align="center"><img src="/i/corp/clear.gif" width="700" height="11" alt="" border="0"><br>
            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrameNB">
                <tr valign="top">
                    <td class="bodyText">
            <p class="testHead">Problem Detail</p>
                    </td>
                </tr>
            </table>
            <p></p>

            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
            <jsp:useBean id="problemInfo" type="com.topcoder.web.corp.model.ProblemInfo" scope="request" />
            <TR>
              <TD COLSPAN="6" CLASS="screeningTitle"><jsp:getProperty name="problemInfo" property="problemName" /></TD>
           </TR>
            <TR>
               <TD ALIGN="left" CLASS="screeningHeader">Division</TD>
               <TD ALIGN="center" CLASS="screeningHeader">Difficulty</TD>
               <TD ALIGN="center" CLASS="screeningHeader">Sub. %</TD>
               <TD ALIGN="center" CLASS="screeningHeader">Sub. Acc. %</TD>
	       <TD ALIGN="center" CLASS="screeningHeader">Overall Accuracy %</TD>
               <TD ALIGN="center" CLASS="screeningHeader">TC Sub. %</TD>
               <TD ALIGN="center" CLASS="screeningHeader">TC Sub. Acc. %</TD>
	       <TD ALIGN="center" CLASS="screeningHeader">TC Overall Accuracy %</TD>
               <TD ALIGN="center" CLASS="screeningHeader">Algorithmic Categories</TD>
            </TR>
            <TR>
               <TD ALIGN="left" CLASS="screeningCellOdd"><jsp:getProperty name="problemInfo" property="divisionDesc" /></TD>
               <TD ALIGN="center" CLASS="screeningCellOdd"><jsp:getProperty name="problemInfo" property="difficultyDesc" /></TD>
               <TD ALIGN="center" CLASS="screeningCellOdd"><jsp:getProperty name="problemInfo" property="submission" />%</TD>
               <TD ALIGN="center" CLASS="screeningCellOdd"><jsp:getProperty name="problemInfo" property="submissionAccuracy" />%</TD>
               <TD ALIGN="center" CLASS="screeningCellOdd"><jsp:getProperty name="problemInfo" property="overallAccuracy" />%</TD>
               <TD ALIGN="center" CLASS="screeningCellOdd"><jsp:getProperty name="problemInfo" property="tcSubmission" />%</TD>
               <TD ALIGN="center" CLASS="screeningCellOdd"><jsp:getProperty name="problemInfo" property="tcSubmissionAccuracy" />%</TD>
               <TD ALIGN="center" CLASS="screeningCellOdd"><jsp:getProperty name="problemInfo" property="tcOverallAccuracy" />%</TD>
               <TD ALIGN="center" CLASS="screeningCellOdd"><jsp:getProperty name="problemInfo" property="algorithmicCategoryList" /></TD>
            </TR>
         </table>

         <p></p>

            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
           <TR>
              <TD CLASS="screeningTitle">Problem Statement:</TD>
           </TR>
           <TR>
              <TD CLASS="screeningCellOdd" VALIGN="top">
<screen:problemStatement text="<%=problemInfo.getProblemStatement()%>" language="Java" class="bodyText"/>
              </TD>
           </TR>
         </table>

            <p><br></p>
        </td>
        <td width="50%"></td>
<!-- Middle Column ends -->

<!-- Gutter -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

  <jsp:include page="../../foot.jsp" />

</body>
</html>
