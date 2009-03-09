<%@ page import="com.topcoder.web.tc.Constants"%>
<%@  page language="java"  %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge  - Computer Programming Tournament - Overview</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>


</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
<jsp:param name="node" value="topcoder_tournaments"/>
</jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" width="100%">

			<jsp:include page="tccc04Head.jsp" />

			<table width="500" align="center" class="bodyText">
				<tr>
					<td>
						<p align="left">To complete your registration for the 2004 TopCoder Collegiate Challenge you must <b>read and agree to</b> the terms listed below.</p>

         			<p align="center"><textarea name="terms" rows="20" cols="80" readonly class="bodyText"><%=request.getAttribute("terms")%></textarea></p>

         			<p align="center"><a href="<%=sessionInfo.getServletPath()%>?<%=Constants.MODULE_KEY%>=TCCC04TermsAgree">I agree</a> to these terms and wish to participate in the 2004 TopCoder Collegiate Challenge.
         		</td>
         	</tr>
         </table>

         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
