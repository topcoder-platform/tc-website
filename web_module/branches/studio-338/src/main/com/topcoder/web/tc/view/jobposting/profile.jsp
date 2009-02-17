<%@ page language="java" %>
<%@ page errorPage="/errorPage.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>Registration</TITLE>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
  </HEAD>
<body>

<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value=""/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">
<br />
<br />

<br clear="all">

<div>
<table style="width: 100%;" cellpadding="0" cellspacing="0">
<thead>
    <tr>
        <td>
                <!-- begin body -->
                  <jsp:include page="profile_center.jsp"/>
                <!-- end body -->

        </td>
    </tr>

</table>
<br /><br />
            </div>


<p>&nbsp;</p>
     </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
