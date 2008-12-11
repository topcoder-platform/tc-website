<%@ page language="java" %>

<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<logic:iterate name="QCKSTAT_LST" id="qsb" type="com.topcoder.web.tc.controller.legacy.stat.bean.QuickStatBean" scope="application">
<OPTION value="<bean:write name="qsb" property="URL" filter="false"/>">&#160;<bean:write name="qsb" property="displayName"/></OPTION>
</logic:iterate>
