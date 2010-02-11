<%@ page language="java" %>
<%@ page errorPage="/errorPage.jsp" %>
<jsp:useBean id="JobHitData" scope="request" class="com.topcoder.web.tc.model.JobHitData" />
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
<br />
<br />

<span class="bigTitle">Unrated Member</span>
<br />

<br clear="all">

<div>
<table style="width: 100%;" cellpadding="0" cellspacing="0">
<thead>
    <tr>
        <td>
            The ability to apply for a job at TopCoder is restricted to rated members. In line with TopCoder's
            overall philosophy, this policy allows companies to differentiate coders who otherwise look the same
            on paper. Non-rated members wishing to obtain a rating should review the competition calendar for the
            <A HREF="/tc?module=MatchDetails&amp;rd=<jsp:getProperty name="JobHitData" property="nextRoundId"/>" CLASS="statTextBig">next Single Round Match</A>
            or click <A HREF="/tc?module=Static&d1=calendar&d2=thisMonth" class="statTextBig">here</A> for a complete list of upcoming Single
            Round Matches.

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
