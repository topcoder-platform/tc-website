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

<BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
<jsp:include page="/includes/top.jsp"/>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
   <TR>
    <!-- Left Column Begins -->
      <TD WIDTH="22" VALIGN="top" BGCOLOR="#000000">
        <!-- Left Column Include Begins -->
        <!-- Global Seconday Nav Begins -->
        <jsp:include page="/includes/left.jsp"/>
        <!-- Global Seconday Nav Ends -->
        <!-- Left Column Include Ends -->
      </TD>
      <!-- Left Column Ends -->
      <!-- Gutter Begins -->
      <TD VALIGN="top"><IMG SRC="/i/ev/clear.gif" WIDTH="10" HEIGHT="1"></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
      <TD CLASS="bodyText" width="100%" valign="top"><img src="/i/ev/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
            <h1 class="testHead">Problem Sets</h1>
            <P>Below is a list of Problem Sets available for use in the Testing Application.  Clicking on a Problem Name opens a window that 
            displays statistical information about the Problem, as well as the Problem Statement.</P>
                   
        <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">	        
	        <TR>
		       <TD COLSPAN="3" VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;</B></TD>
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
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;Business Categories</B></TD>		       
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
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:beanWrite name='problem' property='businessCategoryList' /></TD>		       
	        </TR>
            </screen:problemInfoIterator>
            <TR>
                <TD COLSPAN="8"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
            </TR>
        </screen:nestedListIterator>
        </TABLE>                 
</FORM>         
<P><BR/></P>    
     </TD>
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="10"><IMG SRC="/i/ev/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
   </TR>
</TABLE>
  <!-- Body Ends -->

  <jsp:include page="/includes/foot.jsp"/>

</BODY>
</HTML>
