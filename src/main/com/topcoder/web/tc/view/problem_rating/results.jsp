<%@ page import="com.topcoder.web.tc.model.ProblemRatingResult"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<jsp:useBean id="problemRatingResults" scope="request" class="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" />
<jsp:useBean id="overallDistribution" scope="request" class="java.util.List" />
<jsp:useBean id="competitorDistribution" scope="request" class="java.util.List" />
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
           <td class="bodyTextBig" align="left" valign="bottom">Question</td>
           <td class="bodyTextBig" align="right" valign="bottom">Overall Average Rating</td>
           <td class="bodyTextBig" align="right" valign="bottom">Average Rating for Competitors</td>
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
    </table><br/>
         <center>
<SCRIPT language="JavaScript">
<!--
     var params = <tc:problemRatingResultIterator list="<%=overallDistribution%>" id="item"><jsp:getProperty name="item" property="keyValueString"/>&</tc:problemRatingResultIterator><tc:problemRatingResultIterator list="<%=competitorDistribution%>" id="item"><jsp:getProperty name="item" property="keyValueString"/>&</tc:problemRatingResultIterator>
     params = params.substring(0, params.length-1);
     if (flashinstalled>1){
             document.write('<object type="application/x-shockwave-flash" data="/i/problem_rating.swf" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width=100% height=400 border="0" salign="Top" id="myFlash" >');
             document.write('<PARAM NAME=movie VALUE="/i/problem_rating.swf?'+params+'">');
             document.write('<PARAM NAME=quality VALUE="high">');
             document.write('<PARAM NAME=bgcolor VALUE="#FFFFFF">');
             document.write('<embed src="/i/problem_rating.swf?'+params+'&flashContentURL=flash_content/flash_content.html&altContentURL=upgrade_flash/upgrade_flash.html&contentVersion=6&contentMajorRevision=0&contentMinorRevision=79&allowFlashAutoInstall=false" quality=high width=200 height=15 border="0" salign="Top" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" name="myFlash" swLiveConnect="true" ></embed>');
             document.write('</object>');
     }
     // -->
  </SCRIPT>
         </center>
         <br/><br/>
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
