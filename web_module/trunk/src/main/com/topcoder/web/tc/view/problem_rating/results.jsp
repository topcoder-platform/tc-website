<%@ page import="com.topcoder.web.tc.model.ProblemRatingResult"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-taglib.tld" prefix="tc-tags" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<jsp:useBean id="problemRatingResults" scope="request" class="java.util.List" />
<jsp:useBean id="overallDistribution" scope="request" class="java.util.List" />
<jsp:useBean id="div1Distribution" scope="request" class="java.util.List" />
<jsp:useBean id="div2Distribution" scope="request" class="java.util.List" />
<%
    int count = 0;
    int div1Count = 0;
    int div2Count = 0;
%>
<html>
<head>
<title>TopCoder Problem Rating Results - <%=request.getAttribute("problemName")%></title>
<jsp:include page="../script.jsp"/>
                            <SCRIPT LANGUAGE="JavaScript">
                            <!--
                            var flashinstalled = 0;
                            var flashversion = 0;
                            MSDetect = "false";
                            if (navigator.plugins && navigator.plugins.length)
                            {
                                x = navigator.plugins["Shockwave Flash"];
                                if (x)
                                {
                                    flashinstalled = 2;
                                    if (x.description)
                                    {
                                        y = x.description;
                                        flashversion = y.charAt(y.indexOf('.')-1);
                                    }
                                }
                                else
                                    flashinstalled = 1;
                                if (navigator.plugins["Shockwave Flash 2.0"])
                                {
                                    flashinstalled = 2;
                                    flashversion = 2;
                                }
                            }
                            else if (navigator.mimeTypes && navigator.mimeTypes.length)
                            {
                                x = navigator.mimeTypes['application/x-shockwave-flash'];
                                if (x && x.enabledPlugin)
                                    flashinstalled = 2;
                                else
                                    flashinstalled = 1;
                            }
                            else
                                MSDetect = "true";

                            // -->
                            </SCRIPT>

                            <SCRIPT LANGUAGE="VBScript">

                            on error resume next

                            If MSDetect = "true" Then
                                For i = 2 to 6
                                    If Not(IsObject(CreateObject("ShockwaveFlash.ShockwaveFlash." & i))) Then

                                    Else
                                        flashinstalled = 2
                                        flashversion = i
                                    End If
                                Next
                            End If

                            If flashinstalled = 0 Then
                                flashinstalled = 1
                            End If

                            </SCRIPT>
</head>
<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1"></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="500" height="1" vspace="5" border="0"><br>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="problem_rating"/>
           <jsp:param name="image1" value="white"/>
           <jsp:param name="title" value="Results"/>
        </jsp:include>

<p class="header">Problem:&nbsp;<%= request.getAttribute("problemName") %></p>
    <table  WIDTH="500" BORDER="0" CELLSPACING="0" CELLPADDING="6"align="center" class="sidebarBox">
        <tr>
           <td class="sidebarTitle" align="left" valign="bottom" nowrap>Question</td>
           <td class="sidebarTitle" align="right" valign="bottom" nowrap>Total Avg. Rating</td>
           <td class="sidebarTitle" align="right" valign="bottom" nowrap>Div I Avg. Rating</td>
           <td class="sidebarTitle" align="right" valign="bottom" nowrap>Div II Avg. Rating</td>
        </tr>
        <%  if (!problemRatingResults.isEmpty()) {
                count = ((ProblemRatingResult)problemRatingResults.get(0)).getOverallCount().intValue();
                div1Count = ((ProblemRatingResult)problemRatingResults.get(0)).getDiv1Count().intValue();
                div2Count = ((ProblemRatingResult)problemRatingResults.get(0)).getDiv2Count().intValue();
            }
        %>
        <tc:problemRatingResultIterator list="<%=problemRatingResults%>" id="result">
        <tr>
            <td class="sidebarText">
                <jsp:getProperty name="result" property="Question"/>
            </td>
            <td class="sidebarText" align="right">
                <tc-tags:format object="<%=result.getOverallAverage()%>" format="0.00"/>
            </td>
            <td class="sidebarText" align="right">
                <tc-tags:format object="<%=result.getDiv1Average()%>" format="0.00"/>
            </td>
            <td class="sidebarText" align="right">
                <tc-tags:format object="<%=result.getDiv2Average()%>" format="0.00"/>
            </td>
        </tr>
        </tc:problemRatingResultIterator>
        <tr><td class="sidebarTitle" colspan="4" align="center"><%=count%> Total ratings | <%=div1Count%> Div I ratings | <%=div2Count%> Div II ratings</td></tr>
    </table><br/>
         <center>
<SCRIPT language="JavaScript">
<!--
     var params = '<tc:problemRatingDistributionIterator list="<%=overallDistribution%>" id="item"><jsp:getProperty name="item" property="keyValueString"/>&</tc:problemRatingDistributionIterator><tc:problemRatingDistributionIterator list="<%=div1Distribution%>" id="item"><jsp:getProperty name="item" property="keyValueString"/>&</tc:problemRatingDistributionIterator><tc:problemRatingDistributionIterator list="<%=div2Distribution%>" id="item"><jsp:getProperty name="item" property="keyValueString"/>&</tc:problemRatingDistributionIterator>'
     params = params.substring(0, params.length-1);
     if (flashinstalled>1){
             document.write('<object type="application/x-shockwave-flash" data="/i/problem_rating.swf" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="500" height=360 border="0" salign="Top" id="myFlash" >');
             document.write('<PARAM NAME=movie VALUE="/i/problem_rating.swf?'+params+'">');
             document.write('<PARAM NAME=quality VALUE="high">');
             document.write('<PARAM NAME=bgcolor VALUE="#FFFFFF">');
             document.write('<embed src="/i/problem_rating.swf?'+params+'&flashContentURL=flash_content/flash_content.html&altContentURL=upgrade_flash/upgrade_flash.html&contentVersion=6&contentMajorRevision=0&contentMinorRevision=79&allowFlashAutoInstall=false" quality=high width=500 height=360 border="0" salign="Top" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" name="myFlash" swLiveConnect="true" ></embed>');
             document.write('</object>');
     }
     // -->
  </SCRIPT>

                            <SCRIPT LANGUAGE="JavaScript">
                            <!--
                            if (flashinstalled<2){
                               document.write('<a href="http://www.macromedia.com/go/getflashplayer"><img src="/i/getflash.gif" width="15" heigh="15" border="0" hspace="2"></a>To view the graphical analysis, please install the latest Macromedia Flash <a href="http://www.macromedia.com/go/getflashplayer">plugin</a>.');
                            }
                            // -->
                            </SCRIPT>

         </center>
      </td>
<!-- Center Column Ends -->

<!-- Gutter -->
      <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>
</body>
</html>
