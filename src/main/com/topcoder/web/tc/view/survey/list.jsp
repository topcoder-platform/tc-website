<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/rsc-taglib.tld" prefix="rsc" %>
<jsp:useBean id="surveyList" scope="request" class="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" />
<html>

<head>

<title>TopCoder Polls</title>

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
            <table border="0" cellpadding="0" cellspacing="0" class="bodyText" width="100%">
            <% boolean even = false; %>
               <rsc:iterator list="<%=surveyList%>" id="survey">
               <tr class="<%=even?"formTextOdd":"formTextEven"%>">
                  <td>
                     <rsc:item row="<%=survey%>" name="question_text"/>
                  </td>
                  <td>
                     <a href="?&module=SurveyResults&sid=<rsc:item row="<%=survey%>" name="survey_id"/>">view results</a>
                  </td>
               </tr>
               <% even = !even; %>
               </rsc:iterator>
            </table>
            </p>
            <p><br/></p>
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
