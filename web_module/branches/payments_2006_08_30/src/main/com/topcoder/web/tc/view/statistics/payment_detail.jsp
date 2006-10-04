<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.shared.util.ApplicationServer,
                com.topcoder.shared.dataAccess.DataAccessConstants,
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
.showText{ display: table-row }
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
        function next() {
            var myForm = document.paymentDetailForm;
            var oldStartRank = myForm.<%=DataAccessConstants.START_RANK%>.value;
            myForm.<%=DataAccessConstants.START_RANK%>.value = parseInt(myForm.<%=DataAccessConstants.END_RANK%>.value) + 1;
            myForm.<%=DataAccessConstants.END_RANK%>.value = 2 * parseInt(myForm.<%=DataAccessConstants.END_RANK%>.value) - parseInt(oldStartRank) + 1;
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
            myForm.submit();
        }
        function previous() {
            var myForm = document.paymentDetailForm;
            var oldEndRank = myForm.<%=DataAccessConstants.END_RANK%>.value;
            myForm.<%=DataAccessConstants.END_RANK%>.value = parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value) - 1;
            myForm.<%=DataAccessConstants.START_RANK%>.value = 2 * parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value) - parseInt(oldEndRank) - 1;
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
            myForm.submit();
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

    <div class="pagingBox" style="clear:both;">
        <% if (rsc.croppedDataBefore() || rsc.croppedDataAfter()) { %>
        <%=(rsc.croppedDataBefore() ? "<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
        | <%=(rsc.croppedDataAfter() ? "<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
        <% } else { %>
        &#160;
        <% } %>
    </div>

    <form name="paymentDetailForm" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="get">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="PaymentDetail"/>
        <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
        <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
        <tc-webtag:hiddenInput name="<%=DataAccessConstants.START_RANK%>"/>
        <tc-webtag:hiddenInput name="<%=DataAccessConstants.END_RANK%>"/>
        <tc-webtag:hiddenInput name="<%=Constants.CODER_ID%>"/>
        <tc-webtag:hiddenInput name="<%=Constants.PAYMENT_TYPE_ID%>"/>
	
	    <table class="stat" cellpadding="0" cellspacing="0" width="100%">
	        <tr><td class="title" colspan="6">
			Payment detail
	        </td></tr>
	        <tr class="dark">
	            <TD CLASS="header" width="5%"></TD>
	            <TD CLASS="header" width="10%">
	                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Date</a>
	            </TD>
	            <TD CLASS="header" width="45%">
	                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="0" includeParams="true"/>">Description</a>
	            </TD>
	            <TD CLASS="header" width="20%">
	                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="2" includeParams="true"/>">Payment Type</a>
	            </TD>
	            <TD CLASS="header" width="10%">
	                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="1" includeParams="true"/>">Earnings</a>
	            </TD>
	            <TD CLASS="header" width="10%"></TD>
	        </tr>
	        <%int i = 0;%>
	        <%boolean even = false;%>
	        <rsc:iterator list="<%=rsc%>" id="resultRow">
	            <tr class="<%=even?"dark":"light"%>">            
	            <TD class="value" width="5%">
	            <% if (resultRow.getItem("ref_payment_type_desc").getResultData() != null) {%>
	                <%i++;%>
		            <a href="javascript:toggleDisplay('ref_<%=i%>');" class="statLink"><img src="/i/interface/open.gif" alt="open" border="0" /></a>
				<% }%>
	            </TD>
	            <TD class="value" width="10%"><rsc:item name="date_due" row="<%=resultRow%>" format="MM.dd.yy"/></TD>
	            <TD class="value" width="45%"><rsc:item name="payment_desc" row="<%=resultRow%>"/></TD>
	            <TD class="value" width="20%"><rsc:item name="payment_type_desc" row="<%=resultRow%>"/></TD>
	            <TD class="value" width="10%">
		            <% if (resultRow.getIntItem("payment_type_id") == 5 && 
		                    resultRow.getItem("ref_earnings").getResultData() != null) {%>
		            	<rsc:item name="ref_earnings" row="<%=resultRow%>" format="$#,##0.00"/>
		            <% } else { %>
  		            	<rsc:item name="earnings" row="<%=resultRow%>" format="$#,##0.00"/>
		            <% } %>
	           	</TD>
	            <TD class="value" width="10%">
	            <% if (resultRow.getIntItem("payment_type_id") == 1) {%>
				<A href="/stat?c=coder_room_stats&cr=<%=coderId%>&rd=<rsc:item name="algorithm_round_id" row="<%=resultRow%>"/>" class="bcLink">Contest Details</A>
	            <% } else if (resultRow.getIntItem("payment_type_id") == 6) {%>
				<A href="/tc?module=CompContestDetails&pj=<rsc:item name="component_project_id" row="<%=resultRow%>"/>" class="bcLink">Project details</A>
				<% }%>
				</TD>
	            </tr>
	            
	            <% if (resultRow.getItem("ref_payment_type_desc").getResultData() != null) {%>
		            <tr class="<%=even?"dark":"light"%> hideText" id="ref_<%=i%>">            
		            <TD class="value" width="5%"></TD>
    	            <TD class="value" width="10%"><rsc:item name="ref_date_due" row="<%=resultRow%>" format="MM.dd.yy"/></TD>
		            <TD class="value" width="45%"><rsc:item name="ref_payment_desc" row="<%=resultRow%>"/></TD>
		            <TD class="value" width="20%"><rsc:item name="ref_payment_type_desc" row="<%=resultRow%>"/></TD>
		            <TD class="value" width="10%"><rsc:item name="ref_earnings" row="<%=resultRow%>" format="$#,##0.00"/></TD>
		            </tr>
				<% }%>
	            <%even = !even;%>
	        </rsc:iterator>
	    </TABLE>
    </FORM>

    <div class="pagingBox">
        <% if (rsc.croppedDataBefore() || rsc.croppedDataAfter()) { %>
        <%=(rsc.croppedDataBefore() ? "<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
        | <%=(rsc.croppedDataAfter() ? "<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
        <% } else { %>
        &#160;
        <% } %>
    </div>

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
