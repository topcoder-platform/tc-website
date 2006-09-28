<%@page contentType="text/xml"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean" %>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>
<%@ page import="com.topcoder.web.common.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.servlet.*" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.*" %>
<%@ page import="com.topcoder.web.ejb.pacts.*" %>

<%
    BasePayment payment = BasePayment.createPayment(
    		Integer.parseInt(request.getParameter("payment_type_id")),
    		7545675, 0.01, Long.parseLong(request.getParameter("reference_id")));

payment.setDescription("descr");
%>





<taconite-root xml:space="preserve">

 <taconite-replace-children contextNodeID="runJS" parseInBrowser="true">     
   <script type="text/javascript">
        
        document.f.payment_desc.value = "<%= payment.getDescription() %>";
    </script>
</taconite-replace-children>      
 </taconite-root>
 