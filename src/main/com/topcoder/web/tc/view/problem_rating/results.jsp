<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/rsc-taglib.tld" prefix="rsc" %>
<jsp:useBean id="problemRatingResults" scope="request" class="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" />
<%
    int count = 0;
    int compCount = 0;
%>
<html>
<head>
<title>TopCoder Problem Rating Results - <%=request.getAttribute("problemName")%></title>
<jsp:include page="../script.jsp"/>
</head>
<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="competition"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value=""/>
                <jsp:param name="level2" value=""/> 
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1"></td>
<!-- Gutter Ends -->

<!-- Center Column Begins --> 
<td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="problem_rating"/>  
           <jsp:param name="image1" value="white"/>  
           <jsp:param name="title" value="Results"/>  
        </jsp:include>

<p class="header">Problem:&nbsp;<%= request.getAttribute("problemName") %></p>
    <table BORDER="0" CELLSPACING="0" CELLPADDING="5" WIDTH="100%">
        <tr>
           <td class="bodyTextBig">Question</td>
           <td class="bodyTextBig" align="right">Overall Average Rating</td>
           <td class="bodyTextBig" align="right">Average Rating for Competitors</td>
        </tr>
        <rsc:iterator list="<%=problemRatingResults%>" id="result">
        <% count = result.getIntItem("count");
           compCount = result.getIntItem("comp_count");
        %>
        <tr>
            <td class="bodyText">
                <rsc:item row="<%=result%>" name="question"/> :
            </td>
            <td class="bodyText" align="right">
                <rsc:item row="<%=result%>" name="average" format="#.##"/>
            </td>
            <td class="bodyText" align="right">
                <rsc:item row="<%=result%>" name="comp_average" format="#.##"/>
            </td>
        </tr>
        </rsc:iterator>
        <tr><td class="bodyTextBig" colspan="3" align="center"><%=count%> Total votes <%=compCount%> Competitor Votes</td></tr>
    </table>
    <table BORDER="0" CELLSPACING="0" CELLPADDING="5" WIDTH="100%">
      <tr>
         <td>
         <OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
         codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
         WIDTH="300" HEIGHT="200" id="problem_rating" ALIGN="">
         <PARAM NAME=movie VALUE="/i/problem_rating.swf"> <PARAM NAME=quality VALUE=medium> <PARAM NAME=bgcolor VALUE=#FFFFFF> <EMBED src="/i/problem_rating.swf" quality=medium bgcolor=#FFFFFF  WIDTH="300" HEIGHT="200" NAME="problem_rating" ALIGN=""
         TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED>
         </OBJECT>
         </td>
         <td>
         <OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
         codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
         WIDTH="300" HEIGHT="200" id="problem_rating" ALIGN="">
         <PARAM NAME=movie VALUE="/i/problem_rating.swf"> <PARAM NAME=quality VALUE=medium> <PARAM NAME=bgcolor VALUE=#FFFFFF> <EMBED src="/i/problem_rating.swf" quality=medium bgcolor=#FFFFFF  WIDTH="300" HEIGHT="200" NAME="problem_rating" ALIGN=""
         TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED>
         </OBJECT>
         </td>
      </tr>
      <tr>
         <td>
         <OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
         codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
         WIDTH="300" HEIGHT="200" id="problem_rating" ALIGN="">
         <PARAM NAME=movie VALUE="/i/problem_rating.swf"> <PARAM NAME=quality VALUE=medium> <PARAM NAME=bgcolor VALUE=#FFFFFF> <EMBED src="/i/problem_rating.swf" quality=medium bgcolor=#FFFFFF  WIDTH="300" HEIGHT="200" NAME="problem_rating" ALIGN=""
         TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED>
         </OBJECT>
         </td>
         <td>
         <OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
         codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
         WIDTH="300" HEIGHT="200" id="problem_rating" ALIGN="">
         <PARAM NAME=movie VALUE="/i/problem_rating.swf"> <PARAM NAME=quality VALUE=medium> <PARAM NAME=bgcolor VALUE=#FFFFFF> <EMBED src="/i/problem_rating.swf" quality=medium bgcolor=#FFFFFF  WIDTH="300" HEIGHT="200" NAME="problem_rating" ALIGN=""
         TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED>
         </OBJECT>
         </td>
      </tr>
   </table>
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
