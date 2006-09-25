<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.ContractHeader" %>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants"%>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.TCData"%>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.UserProfileHeader"%>
<%@ page import="com.topcoder.shared.util.TCContext"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="com.topcoder.web.common.*"%>
<%@ page import="com.topcoder.web.ejb.pacts.*"%>

<html>


<body>

<br> 
<%
        InitialContext c =  TCContext.getInitial();
        PactsClientServices pcs = (PactsClientServices) BaseProcessor.createEJB(c, PactsClientServices.class);
%>



Component Winning:
<%
ComponentProjectReferencePayment cp =new ComponentWinningPayment(14810373,400, 8596547, 1);
	pcs.addPayment(cp);
%>
getId: <%= cp.getId() %> <br>
getCoderId: <%= cp.getCoderId() %> <br>
getNetAmount: <%= cp.getNetAmount() %> <br>
getGrossAmount: <%= cp.getGrossAmount() %> <br>
getStatusId: <%= cp.getStatusId() %> <br>
getDescription: <%= cp.getDescription() %> <br>
getDueDate: <%= cp.getDueDate() %> <br>
getProjectId: <%= cp.getProjectId() %> <br>
getPaymentType: <%= cp.getPaymentType() %>
<br>
<br>


Review Board
<%
cp =new ReviewBoardPayment(14810373,400, "TC Client", 20186915);
	pcs.addPayment(cp);
%>
getId: <%= cp.getId() %> <br>
getCoderId: <%= cp.getCoderId() %> <br>
getNetAmount: <%= cp.getNetAmount() %> <br>
getGrossAmount: <%= cp.getGrossAmount() %> <br>
getStatusId: <%= cp.getStatusId() %> <br>
getDescription: <%= cp.getDescription() %> <br>
getDueDate: <%= cp.getDueDate() %> <br>
getProjectId: <%= cp.getProjectId() %> <br>
getPaymentType: <%= cp.getPaymentType() %>
<br>
<br>

</body>

</html>