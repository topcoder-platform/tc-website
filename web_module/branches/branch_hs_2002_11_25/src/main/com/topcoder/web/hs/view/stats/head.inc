<%@ page errorPage="../home/error.jsp"
  import="com.topcoder.shared.dataAccess.*,
          com.topcoder.shared.dataAccess.resultSet.*,
          com.topcoder.shared.problem.*
          com.topcoder.shared.language.*
          com.topcoder.shared.problemParser.*
          com.topcoder.common.web.render.ProblemRenderer,
          com.topcoder.web.stat.common.JSPUtils,
          java.text.DecimalFormat"
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%-- bring in some data used by most of the stats pages --%>
<jsp:useBean id="SessionInfo" class="com.topcoder.web.hs.model.SessionInfoBean" scope="request" />
<bean:define id="nameColor" name="CODER_COLORS" scope="request" />
<bean:define name="QUERY_RESPONSE" id="queryEntries" type="java.util.Map" scope="request" />
<% Request srb = (Request)request.getAttribute("REQUEST_BEAN"); %>

<HTML>
<HEAD>
	<TITLE>::TopCoder High School::</TITLE>
    <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
    <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

<jsp:include page="../includes/css.jsp" />

<script language="JavaScript">
function goTo(selection){
  sel = selection.options[selection.selectedIndex].value;
  if (sel && sel != '#'){
    window.location=sel;
  }
}
function getGraph(url,wd,ht) {
  var last=0;
  var daHt = parseInt(ht) + parseInt('49');
  var size = "top=2,left=2,width="+wd+",height="+daHt+"status=0";
  var name="graph";
  window.open('graphPopup.jsp?'+url+'&width='+wd+'&height='+ht,name,size);
  return;
}
</script>
