<%@ page language="java" errorPage="/errorPage.jsp" %>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<logic:iterate name="QCKSTAT_LST" id="qsb" type="com.topcoder.web.stat.bean.QuickStatBean" scope="application">
<OPTION value="<bean:write name="qsb" property="URL" filter="false"/>">&#160;<bean:write name="qsb" property="displayName"/></OPTION>
</logic:iterate>
