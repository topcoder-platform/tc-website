<%@ page import="com.topcoder.shared.dataAccess.*,
                 com.topcoder.shared.dataAccess.resultSet.*,
                 com.topcoder.shared.problem.*
                 com.topcoder.shared.language.*
                 com.topcoder.shared.problemParser.*
                 com.topcoder.common.web.render.ProblemRenderer,
                 com.topcoder.web.tc.controller.legacy.stat.common.JSPUtils,
                 java.text.DecimalFormat"
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%-- bring in some data used by most of the stats pages --%>
<jsp:useBean id="nameColor" class="com.topcoder.web.hs.model.CoderRatingStyleBean" scope="application" />
<jsp:useBean id="SessionInfo" class="com.topcoder.web.hs.model.SessionInfoBean" scope="request" />
<bean:define name="QUERY_RESPONSE" id="queryEntries" type="java.util.Map" scope="request" />
<% Request srb = (Request)request.getAttribute("REQUEST_BEAN"); %>

<html>
<head>

<title>TopCoder | High School</title>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

<jsp:include page="../includes/css.jsp" />

<script language="JavaScript">
function goTo(selection){
  sel = selection.options[selection.selectedIndex].value;
  if (sel && sel != '#'){
    window.location=sel;
  }
}
function getGraph(params,wd,ht,name) {
  var url = 'graph?' + params + '&width='+wd+'&height='+ht;
  var wht = parseInt(ht)+49;
  var features = 'width='+wd+',height='+wht+'status=0';
  var win = window.open('', name, features);
  win.document.open('text/html', 'replace');
  win.document.write('<html><head><title>TopCoder :: Graph</title></head><body bgcolor="#000000" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0"><img src="/i/hs/logo.gif" width="206" height="49"><br><img src="' + url + '" width="' + wd + '" height="' + ht + '"></body></html>');
  win.document.close();
  return;
}
</script>
