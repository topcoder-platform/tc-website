<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="/tc.tld" prefix="tc" %>
<jsp:useBean id="questionInfo" scope="request" class="java.util.List" />
<html>

<head>

<title>Member Surveys</title>

<jsp:include page="../script.jsp" />
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
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="member_surveys"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1"></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td width="100%" class="bodyText" valign="top">
                  <table width="100%" border="0" cellpadding="10" cellspacing="0" class="bodyText">
                     <tr>
                        <td class ="bodyText" width="100%"><img src="/i/header_questions.gif" width="210" height="26" border="0"><br/>
                        <p align="right" class="bodyText"><a href="/tc?&module=SurveyList">Archive</a></p></td>
                     </tr>
                  </table>

               <tc:questionIterator list="<%=questionInfo%>" id="question">
                  <table width="510" border="0" cellpadding="5" cellspacing="0" class="formFrame" align="center">
                     <tr>
                        <td class="bodySubtitle" valign="top">
                           <img src="/i/es/nvidia/survey_logo.gif" alt="survey logo" width="100" height="70" align="left" border="0"/>
                        </td>
                        <td colspan="3" class="bodySubtitle" valign="top" width="100%">
                           <jsp:getProperty name="question" property="text"/><br/><br/>
                        </td>
                     </tr>
                     <tr>
                        <td class="header">Answer</td>
                        <td class="header" align="right">Responses</td>
                        <td class="header" align="right">Percentage</td>
                        <td class="header"></td>
                     </tr>
                     <% boolean even = false; %>
                        <rsc:iterator list="<%=question.getAnswerInfo()%>" id="answer">
                     <tr class="<%=even?"formTextOdd":"formTextEven"%>">
                        <td width="100%">
                           <rsc:item row="<%=answer%>" name="answer_text"/>
                        </td>
                        <td align="right">
                          <rsc:item row="<%=answer%>" name="count"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td align="right">
                           <rsc:item row="<%=answer%>" name="percentage" format="0.00"/>%&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td bgcolor="#FFFFFF" valign="top" nowrap>
                            <p align="center">

                            <SCRIPT LANGUAGE="JavaScript">
                            <!--
                            if (flashinstalled>1){
                               document.write('<object type="application/x-shockwave-flash" data="/i/barGraph.swf" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width=200 height=15 border="0" id="myFlash<%=question.getId()%>_<rsc:item row="<%=answer%>" name="answer_id"/>" >');
                               document.write('<PARAM  NAME=movie  VALUE="/i/barGraph.swf?percentage=<rsc:item row="<%=answer%>" name="percentage" format="#.##"/>">');
                               document.write('<PARAM NAME=quality VALUE="high">');
                               document.write('<PARAM NAME=bgcolor VALUE="#FFFFFF">');
                               document.write('<embed src="/i/barGraph.swf?percentage=<rsc:item row="<%=answer%>" name="percentage" format="#.##"/>&flashContentURL=flash_content/flash_content.html&altContentURL=upgrade_flash/upgrade_flash.html&contentVersion=6&contentMajorRevision=0&contentMinorRevision=79&allowFlashAutoInstall=false" quality=high width=200 height=15 border="0" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" name="myFlash<%=question.getId()%>_<rsc:item row="<%=answer%>" name="answer_id"/>" swLiveConnect="true" ></embed>');
                               document.write('</object>');
                            }
                            // -->
                            </SCRIPT>
                            </p>
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