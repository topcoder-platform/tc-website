<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page
        language="java"
        import="com.topcoder.web.codinginterface.longcontest.Constants"

        %>
<%@ page import="com.topcoder.shared.problem.Problem"%>
<%@ page import="com.topcoder.shared.language.Language"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib prefix="mm" tagdir="/WEB-INF/tags" %>
<% int roundType = request.getAttribute(Constants.ROUND_TYPE_ID)==null?Constants.LONG_ROUND_TYPE_ID:((Integer)request.getAttribute(Constants.ROUND_TYPE_ID)).intValue();%>
<% String myNode = "long_compete";
    String image = "long_comps_topcoder";
     if (roundType==Constants.LONG_PRACTICE_ROUND_TYPE_ID || roundType==Constants.AMD_LONG_PRACTICE_ROUND_TYPE_ID) {
         myNode="long_practice";
     } else if (roundType ==Constants.INTEL_LONG_PRACTICE_ROUND_TYPE_ID) {
         myNode="long_intelmtcs_practice";
         image = "long_comps_intel";
     } else if (roundType ==Constants.INTEL_LONG_ROUND_TYPE_ID) {
         myNode="long_intelmtcs_compete";
         image = "long_comps_intel";
     }
%>
<html>
<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="script.jsp" />
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <script type="text/javascript" src="/js/print.js" ></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="//cdn.jsdelivr.net/jquery.cookie/1.4.1/jquery.cookie.min.js"></script>
</head>

<body>

<div id="onTop">
<jsp:include page="top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180" id="onLeft">
            <jsp:include page="includes/global_left.jsp">
                <jsp:param name="node" value="m_long_contests"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="left" class="bodyColumn">

            <jsp:include page="page_title.jsp">
                <jsp:param name="image" value="<%=image%>"/>
                <jsp:param name="title" value="Problem Statement"/>
            </jsp:include>

            <div style="float:right;font-size: 13px;">
                <div id="printableLink"><a href="/tc?module=MatchDetails&amp;rd=${infoRow.map['round_id']}">Register & Rules</a>   &nbsp;|&nbsp; <a href="/longcontest/?module=ViewStandings&amp;rd=${infoRow.map['round_id']}">Standings/Registrants</a>   &nbsp;|&nbsp; <a href="https://apps.topcoder.com/forums/?module=ThreadList&amp;forumID=${infoRow.map['forum_id']}">Forum</a>   &nbsp;|&nbsp; <A href="Javascript:makeInvisible();" mce_href="Javascript:makeInvisible();">Printable view</A></div>
                <div id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();" mce_href="Javascript:makeNavigable();">Normal view</A></div>
            </div>

            <span class="bigHandle">Contest: <mm:contestLink roundId="${infoRow.map['round_id']}" name="${infoRow.map['display_name']}" /></span><br />                
            <span class="bodySubtitle">Problem: ${infoRow.map['class_name']}</span><br />
            <br />
            <div>
                <tc-webtag:problemStatement problem="<%=(Problem)request.getAttribute(Constants.PROBLEM_STATEMENT_KEY)%>" language="<%=((Language)request.getAttribute(Constants.LANGUAGE_ID)).getName()%>"/>
            </div>


        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170" id="onRight">
            <jsp:include page="public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
</tbody>
</table>

<div id="onBottom">
<jsp:include page="foot.jsp" />
</div>

<script async="" src="//www.google-analytics.com/analytics.js"></script>
<!-- Google Analytics -->
<script>
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','__gaTracker');

__gaTracker('create', 'UA-6340959-1', 'auto');

</script>
<!-- End Google Analytics -->
<script type="text/javascript">
var naame;
window.onload = function() {
  var getHandle = function(callback) {
    var self = this;
    var tcjwt = $.cookie('tcjwt');


    if (typeof tcjwt === 'undefined') {
      callback(self.handle);
    }
    else if (typeof tcjwt !== 'undefined') {
      $.ajax({
        type: "GET",
        url: 'https://api.topcoder.com/v2' + '/user/identity',
        dataType: 'json',
        headers: {
          'Authorization': 'Bearer ' + tcjwt
        },
        success: function(data) {
          self.handle = data.handle;
          callback(self.handle);
        }
      }).fail(function() {
        document.cookie = 'tcsso=; path=/; domain=.topcoder.com; expires=' + new Date(0).toUTCString();
        document.cookie = 'tcjwt=; path=/; domain=.topcoder.com; expires=' + new Date(0).toUTCString();
        location.reload();
      });
    }
  };
  var probName = '${infoRow.map['class_name']}';
  var roundId = ${infoRow.map['round_id']};
  getHandle(function(handle) {
    __gaTracker('send', 'event', 'mmViewProblem', roundId + ': ' + probName, handle || 'anonymous', roundId);
  });
  __gaTracker('send', 'pageview');
};
</script>



</body>

</html>
