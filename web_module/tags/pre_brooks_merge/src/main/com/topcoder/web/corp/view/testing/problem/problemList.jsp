<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="com.topcoder.web.corp.common.Constants,
                 com.topcoder.web.corp.model.ProblemInfo" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<HTML>
<HEAD>
<title>Topcoder&#160;&#160;|&#160;&#160;Testing Application Management Tool</title>
<jsp:include page="../includes/script.jsp"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<SCRIPT TYPE="text/javascript">
function getProblemDetail(id) {
    var width = screen.availWidth * 2 / 3;
    var height = screen.availHeight / 2;
    var left = (screen.availWidth - width) / 2;
    var top = 0;
    var cmd = "toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=yes,top=" + top + ",left=" + left + ",width=" + width + ",height=" + height + ",status=0";
    var name="problemDetail";
    <% String url = sessionInfo.getServletPath() + "?" + Constants.MODULE_KEY + "=PopulateProblemDetail"; %>
    window.open('<%=url%>&<%=Constants.ROUND_PROBLEM_ID%>='+id,name,cmd);
    return;
  }
</SCRIPT>
</HEAD>

<body>

<!-- Header begins -->
<jsp:include page="../includes/top.jsp" />
<!-- Header ends -->


<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- gutter begins -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- gutter ends -->

<!-- Middle column begins -->
        <td width="100%" align="center"><img src="/i/corp/clear.gif" width="400" height="11" alt="" border="0"><br>
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText">
               <h1 class="testHead">Problem Sets</h1>
            <P>Below is a list of Problem Sets available for use in the Testing Application.  Clicking on a Problem Name opens a window that
            displays statistical information about the Problem, as well as the Problem Statement.</P>
                    </td>
                </tr>
            </table>


         <table cellspacing="1" cellpadding="3" width="100%" class="testFrame">
	        <TR>
		       <TD ALIGN="center" CLASS="testTableTitle">Name</TD>
		       <TD ALIGN="center" CLASS="testTableTitle">Division</TD>
		       <TD ALIGN="center" CLASS="testTableTitle">Difficulty</TD>
		       <TD ALIGN="center" CLASS="testTableTitle">Overall Accuracy %</TD>
		       <TD ALIGN="center" CLASS="testTableTitle">Sub. Acc. %</TD>
		       <TD ALIGN="center" CLASS="testTableTitle">Sub. %</TD>
		       <TD ALIGN="center" CLASS="testTableTitle">Algorithmic Categories</TD>
	        </TR>
        <jsp:useBean id='problemList' type='java.util.List' scope='request' />
        <screen:nestedListIterator id="subSet" list="<%=problemList%>">
            <% ProblemInfo firstProblem = (ProblemInfo)subSet.get(0); %>
            <TR>
                <TD COLSPAN="8" CLASS="testFormHeader"><%=firstProblem.getRoundName()%></TD>
            </TR>
            <screen:problemInfoIterator id="problem" list="<%= subSet %>">
	        <TR>
		       <TD ALIGN="center" CLASS="testTableOdd"><A HREF="JavaScript:getProblemDetail('<screen:beanWrite name='problem' property='roundId' />,<screen:beanWrite name='problem' property='problemId' />')" CLASS="bodyText"><screen:beanWrite name='problem' property='problemName' /></A></TD>
		       <TD ALIGN="center" CLASS="testTableOdd"><screen:beanWrite name='problem' property='divisionDesc' /></TD>
		       <TD ALIGN="center" CLASS="testTableOdd"><screen:beanWrite name='problem' property='difficultyDesc' /></TD>
		       <TD ALIGN="center" CLASS="testTableOdd"><screen:beanWrite name='problem' property='overallAccuracy' />%</TD>
		       <TD ALIGN="center" CLASS="testTableOdd"><screen:beanWrite name='problem' property='submissionAccuracy' />%</TD>
		       <TD ALIGN="center" CLASS="testTableOdd"><screen:beanWrite name='problem' property='submission' />%</TD>
		       <TD ALIGN="center" CLASS="testTableOdd"><screen:beanWrite name='problem' property='algorithmicCategoryList' /></TD>
	        </TR>
            </screen:problemInfoIterator>
        </screen:nestedListIterator>
        </TABLE>                 
</FORM>         
            <p><br></p>
        </td>
<!-- Middle Column ends -->

<!-- Gutter -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

  <jsp:include page="../../foot.jsp" />

</body>
</html>
