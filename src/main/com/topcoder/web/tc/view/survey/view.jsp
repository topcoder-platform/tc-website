<%@ page import="com.topcoder.web.tc.Constants,
                 com.topcoder.web.tc.view.tag.AnswerInput"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="/tc.tld" prefix="tc" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="questionInfo" scope="request" class="java.util.List" />
<jsp:useBean id="surveyInfo" scope="request" class="com.topcoder.web.tc.model.Survey" />
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<html>

<head>

<title>TopCoder Polls</title>

<SCRIPT type="text/javascript">
if ( window.navigator.userAgent.indexOf("Linux")>-1 ) {
  // Linux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/corpStyle_linux.css"/>');
} else {
  // NonLinux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/corpStyle.css"/>');
}
</SCRIPT>

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
                <jsp:param name="level2" value="competition"/> 
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1"></td>
<!-- Gutter Ends -->

<!-- Center Column Begins --> 
         <td width="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br>
            <jsp:include page="../body_top.jsp" >
                 <jsp:param name="image" value="polls"/>  
                 <jsp:param name="image1" value="white"/>  
            </jsp:include>
            <p><img src="/i/clear.gif" width="240" height="1" border="0"><br>   
               <form action="<jsp:getProperty name="sessionInfo" property="ServletPath"/>" method="POST" name="surveyForm">
                  <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="SubmitSurvey"/>
                  <input type="hidden" name="<%=Constants.SURVEY_ID%>" value="<%=surveyInfo.getId()%>"/>
                  <tc:questionIterator list="<%=questionInfo%>" id="question">
                     <table width="100%" border="0" cellpadding="3" cellspacing="0" class="formFrame">
                        <tr>
                           <td colspan="2">
                              <jsp:getProperty name="question" property="text"/>
                           </td>
                           </tr>
                           <tr>
                              <td colspan="2">
                                 <tc-webtag:errorIterator id="err" name="<%=AnswerInput.PREFIX+question.getId()%>"><%=err%><br/></tc-webtag:errorIterator>
                              </td>
                           </tr>
                           <% boolean even = false; %>
                        <tc:answerInput id="answerInput" question="<%=question%>">
                           <tr class="<%=even?"formTextOdd":"formTextEven"%>">
                              <td width="100%">
                                 <%=answerText%>
                              </td>
                              <td>                                 
                                 <%=answerInput%>
                              </td>
                           </tr>
                           <% even = !even; %>
                        </tc:answerInput>
                     </table>
                     <p><br/></p>
                  </tc:questionIterator>
                     <table class="bodyText" align="center">
                        <tr><td><div><p class="button" align="center"><a href="javascript: document.surveyForm.submit();"class="button">Submit</a>
                        </p></div></td>
                        </tr> 
                     </table>
                  </form>
               </p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
      <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
<!-- Right Column Ends -->

<!-- Gutter -->
      <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
