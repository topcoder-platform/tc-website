<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.shared.util.ApplicationServer,
                com.topcoder.web.common.model.SoftwareComponent,
                com.topcoder.web.tc.Constants" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<HTML>
<HEAD>
    <TITLE>TopCoder Statistics</TITLE>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <jsp:include page="baseHRef.jsp"/>
    <jsp:include page="/script.jsp"/>

<style type="text/css">
.showText{ display: block }
.hideText{ display: none }
</style>

    <script type="text/javascript">
        var objPopUp = null;
        function popUp(event, objectID) {
            objPopTrig = document.getElementById(event);
            objPopUp = document.getElementById(objectID);
            xPos = objPopTrig.offsetLeft + 15;
            yPos = objPopTrig.offsetTop + objPopTrig.offsetHeight - 5;
            if (xPos + objPopUp.offsetWidth > document.body.clientWidth) xPos = xPos - objPopUp.offsetWidth;
            if (yPos + objPopUp.offsetHeight > document.body.clientHeight) yPos = yPos - objPopUp.offsetHeight - objPopTrig.offsetHeight;
            objPopUp.style.left = xPos + 'px';
            objPopUp.style.top = yPos + 'px';
            objPopUp.style.visibility = 'visible';
        }
        function popHide() {
            objPopUp.style.visibility = 'hidden';
            objPopUp = null;
        }
        function toggleDisplay(objectID){
		   var object = document.getElementById(objectID);
		   if(object.className == 'dark hideText') object.className = 'dark showText';
		   else if(object.className == 'dark showText') object.className = 'dark hideText';
		   else if(object.className == 'light showText') object.className = 'light hideText';
		   else object.className = 'light showText';
		   return;
		}
    </script>
    <STYLE TYPE="text/css">
        .popper {
            display: block;
            margin: 0px auto 0px auto;
        }

        #container {
            text-align: center;
            position: relative;
            margin: 0px;
            padding: 0px;
        }

        .popUp {
            font-size: 10px;
            text-align: center;
            background-color: #FFFFCC;
            visibility: hidden;
            margin: 10px;
            padding: 3px;
            position: absolute;
            white-space: nowrap;
            border: solid 1px black;
            z-index: 1;
        }
    </STYLE>
</HEAD>

<BODY>
<jsp:include page="../top.jsp"/>

<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
<TR valign="top">
<%
    ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("payment_detail");
    String coderId = (String) request.getParameter(Constants.CODER_ID);
%>
<TD WIDTH="180">
    <!-- Left nav begins -->
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="m_competitions"/>
    </jsp:include>
    <!-- Left nav ends -->
</TD>

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">


    <jsp:include page="../page_title.jsp">
		<jsp:param name="image" value="statistics_w"/>
		<jsp:param name="title" value="Payments"/>
    </jsp:include>


    <span class="bigHandle">Coder:&#160;<tc-webtag:handle coderId='<%=coderId%>'/></span>
    <br>
    <span class="bodySubtitle">Coder Statistics&#160;>&#160;</span><br>
    <span class="bc">
	<A HREF="/tc?module=MemberProfile&cr=<%=coderId%>" class="bcLink">Member Profile</A>
 | <A href="/tc?module=PaymentSummary&cr=<%=coderId%>" class="bcLink">Payment Summary</A>
 | Payment Details
   </span>

    <br>

    <table class="stat" cellpadding="0" cellspacing="0" width="100%">
        <tr><td class="title" colspan="10">
		Payment detail
        </td></tr>
        <tr>
            <TD CLASS="header"></TD>
            <TD CLASS="header">
                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="1" includeParams="true"/>">Description</a>
            </TD>
            <TD CLASS="header">
                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="1" includeParams="true"/>">Payment Type</a>
            </TD>
            <TD CLASS="header" width="40%">
                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Earnings</a>
            </TD>
        </tr>
        <%int i = 0;%>
        <%boolean even = false;%>
        <rsc:iterator list="<%=rsc%>" id="resultRow">
            <tr class="<%=even?"dark":"light"%> showText">            
            <TD class="value">
            <% if (resultRow.getItem("ref_payment_type_desc").getResultData() != null) {%>
                <%i++;%>
	            <a href="javascript:toggleDisplay('ref_<%=i%>');" class="statLink"><img src="/i/interface/open.gif" alt="open" border="0" /></a>
			<% }%>
            </TD>
            <TD class="value"><rsc:item name="payment_desc" row="<%=resultRow%>"/></TD>
            <TD class="value"><rsc:item name="payment_type_desc" row="<%=resultRow%>"/></TD>
            <TD class="value"><rsc:item name="earnings" row="<%=resultRow%>" format="$#,##0.00"/></TD>
            </tr>
            
            <% if (resultRow.getItem("ref_payment_type_desc").getResultData() != null) {%>
	            <tr class="<%=even?"dark":"light"%> showText" id="ref_<%=i%>">            
	            <TD class="value"></TD>
	            <TD class="value">+--<rsc:item name="ref_payment_desc" row="<%=resultRow%>"/></TD>
	            <TD class="value"><rsc:item name="ref_payment_type_desc" row="<%=resultRow%>"/></TD>
	            <TD class="value"><rsc:item name="ref_earnings" row="<%=resultRow%>" format="$#,##0.00"/></TD>
	            </tr>
			<% }%>
            <%even = !even;%>
        </rsc:iterator>
    </TABLE>
    <p><br></p>
    <!-- END BODY -->

</TD>
<td WIDTH="180" VALIGN="top">
    <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="profile"/>
    </jsp:include>
</TD>
<!-- Gutter -->
<td WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" border="0"/></TD>
<!-- Gutter Ends -->
</tr>
</TABLE>
<jsp:include page="../foot.jsp"/>
</BODY>
</HTML>
