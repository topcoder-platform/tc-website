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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
        function toggleDisplay(objectID,imageID,linkID){
           var object = document.getElementById(objectID) 
           if(object.className == 'dark hideText') {
                object.className = 'dark showText'; 
                document.images[imageID].src = '/i/interface/exp_ed_w.gif'; 
           }else if(object.className == 'dark showText') {
                object.className = 'dark hideText'; 
                document.images[imageID].src = '/i/interface/exp_w.gif';
           }else if(object.className == 'light showText') {
                object.className = 'light hideText'; 
                document.images[imageID].src = '/i/interface/exp_w.gif';
           }else {
                object.className = 'light showText';
                document.images[imageID].src = '/i/interface/exp_ed_w.gif';
           }
          linkID.blur();
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
<td width="100%" align="left" class="bodyColumn">


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
   </span>

	<% if (rsc.size() > 0) { %>
    <div class="pagingBox" style="clear:both;">
        <% if (rsc.croppedDataBefore() || rsc.croppedDataAfter()) { %>
            <%=(rsc.croppedDataBefore() ? "<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
            | <%=(rsc.croppedDataAfter() ? "<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
        <% } else { %>
            &#160;
        <% }%>
    </div>

    <form name="paymentDetailForm" action="${sessionInfo.servletPath}" method="get">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="PaymentDetail"/>
        <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
        <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
        <tc-webtag:hiddenInput name="<%=DataAccessConstants.START_RANK%>"/>
        <tc-webtag:hiddenInput name="<%=DataAccessConstants.END_RANK%>"/>
        <tc-webtag:hiddenInput name="<%=Constants.CODER_ID%>"/>
        <tc-webtag:hiddenInput name="<%=Constants.PAYMENT_TYPE_ID%>"/>
    
        <table class="stat" cellpadding="0" cellspacing="0" width="100%">
            <tr><td class="title" colspan="6">
            Payment Details
            </td></tr>
            <tr>
                <TD CLASS="headerC">
                    <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="3" includeParams="true"/>">Date</a>
                </TD>
                <td class="header">&nbsp;</td>
                <TD CLASS="header" width="60%">
                    <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="0" includeParams="true"/>">Description</a>
                </TD>
                <TD CLASS="header" width="40%">
                    <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="2" includeParams="true"/>">Payment Type</a>
                </TD>
                <TD CLASS="headerR">
                    <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="1" includeParams="true"/>">Earnings</a>
                </TD>
                <TD CLASS="header">&nbsp;</TD>
            </tr>
            <%int i = 0;
            boolean even = false;
            boolean hasCharity = false;%>
            <rsc:iterator list="<%=rsc%>" id="resultRow">
                <tr class="<%=even?"dark":"light"%>">            
                <TD class="valueC"><rsc:item name="date_due" row="<%=resultRow%>" format="MM.dd.yy"/></TD>
                <TD class="value" style="vertical-align:middle;">
                <% if (resultRow.getItem("ref_payment_type_desc").getResultData() != null) {%>
                    <%i++;%>
                    <a href="javascript:toggleDisplay('ref_<%=i%>','switch_<%=i%>');" onfocus="this.blur();"><img src="/i/interface/exp_w.gif" alt="Open" name="switch_<%=i%>" /></a>
                <% } else { %>
                    <div style="width:7px;">&nbsp;</div>
                <% }%>
                </TD>
                <TD class="value"><rsc:item name="payment_desc" row="<%=resultRow%>"/></TD>
                <TD class="value"><rsc:item name="payment_type_desc" row="<%=resultRow%>"/></TD>
                <TD class="valueR">
                    <rsc:item name="earnings" row="<%=resultRow%>" format="$#,##0.00"/>
                    <% if (resultRow.getIntItem("charity_ind") == 1) {
                        hasCharity = true;
                    %>*<% }%>
                </TD>
                <TD class="value" nowrap>
                <% if ((resultRow.getIntItem("payment_type_id") == 1 || 
                        resultRow.getIntItem("payment_type_id") == 1) && 
                        resultRow.getItem("reference_id").getResultData() != null) {%>
                <A href="/stat?c=coder_room_stats&cr=<%=coderId%>&rd=<rsc:item name="reference_id" row="<%=resultRow%>"/>">Contest Details</A>
                <% } else if (resultRow.getIntItem("payment_type_id") == 6 && resultRow.getItem("reference_id").getResultData() != null) {%>
                <A href="/tc?module=CompContestDetails&pj=<rsc:item name="reference_id" row="<%=resultRow%>"/>" class="bcLink">Project details</A>
                <% }%>
                </TD>
                </tr>
                <% if (resultRow.getItem("ref_payment_type_desc").getResultData() != null) {%>
                    <tr class="<%=even?"dark":"light"%> hideText" id="ref_<%=i%>">            
                    <TD class="value">&nbsp;</TD>
                    <TD class="value">&nbsp;</TD>
                    <TD class="value"><rsc:item name="ref_payment_desc" row="<%=resultRow%>"/></TD>
                    <TD class="value"><rsc:item name="ref_payment_type_desc" row="<%=resultRow%>"/></TD>
                    <TD class="value"><rsc:item name="ref_earnings" row="<%=resultRow%>" format="$#,##0.00"/></TD>
                    <TD class="value">&nbsp;</TD>
                    </tr>
                <% }%>
                <%even = !even;%>
            </rsc:iterator>
        </TABLE>
    </FORM>

    <% if(hasCharity) { %>
    <p>* donated to charity.</p>
    <% } %>

    <div class="pagingBox">
        <% if (rsc.croppedDataBefore() || rsc.croppedDataAfter()) { %>
        <%=(rsc.croppedDataBefore() ? "<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
        | <%=(rsc.croppedDataAfter() ? "<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
        <% } else { %>
        &#160;
        <% } %>
    </div>
     <% } else { %>
	    <p>There are no payments registered for this category.</p>
     <% }%>

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
