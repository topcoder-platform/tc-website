<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="/tc.tld" prefix="tc" %>
<jsp:useBean id="questionInfo" scope="request" class="java.util.List" />
<html>

<head>

<title>TopCoder Survey Results</title>

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
         <td width="100%" class="bodyText">
            <img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br>
            <img src="/i/header_questions.gif" width="210" height="26" border="0"><br/>
            <p><img src="/i/clear.gif" width="240" height="1" border="0"><br>
               <tc:questionIterator list="<%=questionInfo%>" id="question">
                  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="bodyText">
                     <tr>
                        <td colspan="3">
                           <jsp:getProperty name="question" property="text"/>
                           <p><br /></p>
                        </td>
                     </tr>
                     <% boolean even = false; %>
                        <rsc:iterator list="<%=question.getAnswerInfo()%>" id="answer">
                     <tr class="<%=even?"formTextOdd":"formTextEven"%>">
                        <td>
                           <rsc:item row="<%=answer%>" name="answer_text"/>
                        </td>
                        <td>
                          <rsc:item row="<%=answer%>" name="count"/>
                        </td>
                        <td>
                           <rsc:item row="<%=answer%>" name="percentage" format="#.##"/>%
                        </td>
                        <td>
                            <p align="center">
                            <object
                                  type="application/x-shockwave-flash"
                                  data="/i/barGraph.swf"
                            classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
                            codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0"
                            width="200"
                            height="15"
                            border="0"
                            id="myFlash<%=question.getId()%>_<rsc:item row="<%=answer%>" name="answer_id"/>" >
                            <param name="movie"  value="/i/barGraph.swf"/>
                            <param name="quality" value="high"/>
                            <param name="bgcolor" value="#FFFFFF"/>
                            <param name="sw1" value="<rsc:item row="<%=answer%>" name="percentage" format="#.##"/>"/>
                            <embed
                            src="/i/barGraph.swf"
                            quality=high
                            width=200
                            height=15
                            border="0"
                            type="application/x-shockwave-flash"
                            pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"
                            name="myFlash"
                            swLiveConnect="true"
                            sw1="<rsc:item row="<%=answer%>" name="percentage" format="#.##"/>" >
                            </embed>
                            </object>
                            </p>
                        </td>
                     </tr>
                     <% even = !even; %>
                  </rsc:iterator>
                  </table>
             </tc:questionIterator>
            </p>
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
