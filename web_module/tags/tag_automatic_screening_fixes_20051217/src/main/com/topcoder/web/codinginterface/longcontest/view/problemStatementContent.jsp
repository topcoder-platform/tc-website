<%@ page
        language="java"
        import="com.topcoder.web.codinginterface.longcontest.Constants"

        %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>

<%= request.getAttribute(Constants.PROBLEM_STATEMENT_KEY) %>
