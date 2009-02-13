<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page errorPage="/errorPage.jsp"
         import="com.topcoder.web.screening.common.Constants,
                 com.topcoder.web.screening.model.ProblemInfo" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<HTML>
<HEAD>
<title>Topcoder&#160;&#160;|&#160;&#160;Testing Application Management Tool</title>
<jsp:include page="/script.jsp"/>
<SCRIPT TYPE="text/javascript">
function getProblemDetail(id) {
    var width = screen.availWidth * 2 / 3;
    var height = screen.availHeight / 2;
    var left = (screen.availWidth - width) / 2;
    var top = 0;
    var cmd = "toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=yes,top=" + top + ",left=" + left + ",width=" + width + ",height=" + height + ",status=0";
    var name="problemDetail";
    <% String url = Constants.CONTROLLER_URL + "?" + Constants.REQUEST_PROCESSOR + "=PopulateProblemDetail"; %>
    window.open('<screen:rewrite page="<%=url%>" />&<%=Constants.ROUND_PROBLEM_ID%>='+id,name,cmd);
    return;
  }
</SCRIPT>
</HEAD>

<body>

<!-- Header begins -->
<jsp:include page="/includes/top.jsp" />
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- gutter begins -->
        <td width="25"><img src="/i/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- gutter ends -->

<!-- Middle column begins -->
        <td width="100%" align="center"><img src="/i/clear.gif" width="400" height="11" alt="" border="0"><br>
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText">
               <h1 class="testHead">Problem Sets</h1>
            <P>Below is a list of Problem Sets available for use in the Testing Application.  Clicking on a Problem Name opens a window that 
            displays statistical information about the Problem, as well as the Problem Statement.</P>
                    </td>
                </tr>
            </table>

                   
        <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">	        
	        <TR>
		       <TD COLSPAN="2" VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;</B></TD>
		       <TD COLSPAN="3" VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;TopCoder Submission %</B></TD>
		       <TD COLSPAN="2" VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;</B></TD>		       
	        </TR>	        
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;Name</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;Division</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;Difficulty</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;Overall Accuracy %</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;Sub. Acc. %</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;Sub. %</B></TD>		       		       		       		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;Algorithmic Categories</B></TD>		       
<%--		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;Business Categories</B></TD> --%>
	        </TR>          
        <jsp:useBean id='problemList' type='java.util.List' scope='request' />
        <screen:nestedListIterator id="subSet" list="<%=problemList%>">
            <% ProblemInfo firstProblem = (ProblemInfo)subSet.get(0); %>
            <TR>
                <TD COLSPAN="8" CLASS="bodyText" BGCOLOR="#CCCCCC" HEIGHT="15">&#160;<B><%=firstProblem.getRoundName()%></B></TD>
            </TR>
            <screen:problemInfoIterator id="problem" list="<%= subSet %>">
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('<screen:beanWrite name='problem' property='roundId' />,<screen:beanWrite name='problem' property='problemId' />')" CLASS="bodyText"><screen:beanWrite name='problem' property='problemName' /></A></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name='problem' property='divisionDesc' /></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name='problem' property='difficultyDesc' /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name='problem' property='overallAccuracy' />%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name='problem' property='submissionAccuracy' />%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name='problem' property='submission' />%</TD>		       		       		       		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name='problem' property='algorithmicCategoryList' /></TD>		       
<%--		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name='problem' property='businessCategoryList' /></TD> --%>
	        </TR>
            </screen:problemInfoIterator>
            <TR>
                <TD COLSPAN="7"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
            </TR>
        </screen:nestedListIterator>
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
