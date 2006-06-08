<%@ page import="java.util.List"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<% List questionInfo = (List)request.getAttribute("questionInfo");%>
<jsp:useBean id="surveyInfo" scope="request" class="com.topcoder.web.tc.model.Survey" />


<html>

<head>

<title>Member Surveys</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_stats"/>
</jsp:include>

<style type="text/css">
div.resultsBar{
float:left;
margin: 4px 0px 4px 0px;
padding:0px;
background: #6363E3 url(/i/survey/bar_bg.gif) center left repeat-x;
}
</style>

</head>

<body>
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="competitor_surveys"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1"></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">

<div class="fixedWidthBody">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="surveys"/>
<jsp:param name="title" value="Results"/>
</jsp:include>

<div align="right"><a href="/tc?module=SurveyList" class="bcLink">Archive</a></div>

             <% if (surveyInfo.getText()!=null) { %>
             <p><jsp:getProperty name="surveyInfo" property="text"/></p>
             <% } %>

            <div align="center">
               <tc:questionIterator list="<%=questionInfo%>" id="question">
                  <table width="510" border="0" cellpadding="5" cellspacing="0" class="stat">
                     <tr class="light">
                        <td class="value" valign="top" align = "center"colspan="4">
                        <tc:sponsorImage src="<%=question.getImagePath()%>" href="<%=question.getLink()%>" alt="survey logo" width="160" height="95" align="center" border="0"/>
                        </td>
                     </tr>
                     <tr class="light">
                        <td colspan="4" class="light" valign="top" width="100%">
                           <span class="subtitle"><jsp:getProperty name="question" property="text"/></span><br/><br/>
                        </td>
                     </tr>
                     <tr>
                        <td class="header">Answer</td>
                        <td class="headerR">Responses</td>
                        <td class="headerR">Percentage</td>
                        <td class="header"><div style="width:100px;">&#160;</div></td>
                     </tr>
                     <% boolean even = false; %>
                        <rsc:iterator list="<%=question.getAnswerInfo()%>" id="answer">
                     <tr class="<%=even?"dark":"light"%>">
                        <td class="value" style="padding-bottom: 10px;">
                           <rsc:item row="<%=answer%>" name="answer_text"/>
                        </td>
                        <td class="valueR">
                          <rsc:item row="<%=answer%>" name="count"/>
                        </td>
                        <td class="valueR">
                           <rsc:item row="<%=answer%>" name="percentage" format="0.00"/>%
                        </td>
                        <td class="value" valign="top">
<%--

currently I'm using the same DB reference in
the <div style="width="> below that we were using
in the Flash version.

Pseudocode:

myPercent = get percentage from DB 
if(myPercent < .5)
   myPercent = 1
else
   myPercent = round to nearest integer (myPercent)
reference myPercent in the div in the next line down

--%>

                           <div class="resultsBar" style="width:<rsc:item row="<%=answer%>" name="percentage" format="#"/>px;"><img src="/i/clear.gif" alt="bar" width="1" height="13" border="0" /></div>
                        </td>
                     </tr>
                     <% even = !even; %>
                  </rsc:iterator>
                  </table>
                  <p><br/></p>
             </tc:questionIterator>
                  <table width="100%" border="0" cellpadding="3" cellspacing="0" class="bodyText">
                     <tr>
                        <td>
                            <SCRIPT LANGUAGE="JavaScript">
                            <!--
                            if (flashinstalled<2){
                               document.write('<a href="http://www.macromedia.com/go/getflashplayer"><img src="/i/getflash.gif" width="15" heigh="15" border="0" hspace="2"></a>To view the graphical analysis, please install the latest Macromedia Flash <a href="http://www.macromedia.com/go/getflashplayer">plugin</a>.');
                            }
                            // -->
                            </SCRIPT>
                            <br/><br/>
                        </td>
                    </tr>
                  </table>
         </div>
         </div>

         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
      <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
       <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="review_board"/>
                <jsp:param name="level2" value="competition"/>
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