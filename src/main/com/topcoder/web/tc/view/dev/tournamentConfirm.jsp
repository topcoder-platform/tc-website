<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ page import="com.topcoder.web.tc.Constants"%>
<%@ page import="com.topcoder.web.common.model.SoftwareComponent"%> <head>
    <title>TopCoder - Message</title>
    <jsp:include page="../script.jsp"/>
    <jsp:include page="/style.jsp">
      <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
               <jsp:param name="node" value="<%= new Integer(SoftwareComponent.DESIGN_PHASE).equals(request.getAttribute(Constants.PHASE_ID))? "des_compete" : "dev_compete"%>"/>
            </jsp:include>
        </td>
        <!-- Left Column Ends -->

        <!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
        <!-- Gutter Ends -->

        <!-- Center Column Begins -->
        <td width="100%" align="center" class="bodyText">
            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>
            <jsp:include page="../body_top.jsp">
                <jsp:param name="image" value="development"/>
                <jsp:param name="image1" value="white"/>
                <jsp:param name="title" value="Components"/>
            </jsp:include>
            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>

            <p style="width: 510px;">
               <strong>Are you sure you want to register for this contest?</strong>
               <br><br>
               Please be aware that you are NOT REGISTERED for the tournament, and registering for this contest will not register you for the tournament.  If you don't register for the tournament prior to registering for this contest, it will not count in the tournament standings even if you sign up at a later date.
               <br><br>
               <a href="/tc?module=ProjectRegister&amp;pj=<%=request.getAttribute(Constants.PROJECT_ID)%>&amp;confirm=true&amp;<%=Constants.TERMS_AGREE%>=on">Yes, register for this contest anyway</a>
            </p>

        </td>
        <!-- Center Column Ends -->

        <!-- Gutter -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
        <!-- Gutter Ends -->

        <!-- Right Column Begins -->
        <td width="180">
            <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>

        </td>
        <!-- Right Column Ends -->

        <!-- Gutter -->
        <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
        <!-- Gutter Ends -->

    </tr>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>


