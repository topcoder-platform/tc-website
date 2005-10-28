<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.web.codinginterface.longcontest.*,
          com.topcoder.shared.dataAccess.resultSet.*"

%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>
<html>
<head>
<title>Submit - <%=request.getSession().getAttribute(Constants.CLASS_NAME)%></title>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>
<body>
<jsp:include page="top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="level1" value=""/>
                <jsp:param name="level2" value=""/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<TD class="statTableSpacer" width="100%" valign="top">

<jsp:include page="page_title.jsp" >
<jsp:param name="image" value="long_competitions"/>
<jsp:param name="title" value="Coding Area"/>
</jsp:include>
<%
    Boolean stat = ((Boolean)request.getSession().getAttribute(Constants.COMPILE_STATUS));
    String error = ((String)request.getSession().getAttribute(Constants.COMPILE_MESSAGE));
    String status = "";
    if(stat != null){
        status = stat.booleanValue()?"Your code compile successfully.":"Your code did not compile successfully.";
    }else{
        error = "";
    }
    int checked = ((Integer)request.getSession().getAttribute(Constants.SELECTED_LANGUAGE)).intValue();
    ResultSetContainer langs = (ResultSetContainer)request.getSession().getAttribute(Constants.LANGUAGES);
%>

<%=status%>
<%=error%>
<div align="center">
   <div style="width: 580px;">
      <div style="float: left; padding-bottom: 5px; width: 100%:">
         <div style="float: left; text-align:left;">
         <span class="bodyTitle">Coding Area</span><br>
         <A href="goes to problem_statement.jsp" class="statLink">Problem Statement</A> (<A href="goes to problem_statement_popup.jsp" class="statLink">new window</A>)
         </div>
         <form action="/longcontest/longcontest?module=Submit" method="POST">
         <input type="hidden" name="<%=Constants.ROUND_ID%>" value="<%=request.getParameter(Constants.ROUND_ID)%>">
         <input type="hidden" name="<%=Constants.CONTEST_ID%>" value="<%=request.getParameter(Constants.CONTEST_ID)%>">
         <input type="hidden" name="<%=Constants.COMPONENT_ID%>" value="<%=request.getParameter(Constants.COMPONENT_ID)%>">
   
         <div style="float:right; text-align:left;">Choose your language: 
         <rsc:iterator list="<%=langs%>" id="resultRow">
         <input type="radio" <%=resultRow.getIntItem("language_id") == checked ? "checked ":""%>
         name="<%=Constants.LANGUAGE_ID%>" value="<%=resultRow.getIntItem("language_id")%>"><%=resultRow.getStringItem("language_name")%>
         </rsc:iterator>
         </div>
      </div>

      <div style="float:left; text-align:left; padding-bottom: 5px;">
      <b>Problem Name: <%=request.getSession().getAttribute(Constants.CLASS_NAME)%><br>
      Method Name: Something</b>
      </div>

      <div style="float:right; text-align:left; padding-bottom: 5px;"> 
      <b>Return Type: String[]<br>
      Arg Types: String</b>
      </div>

      <div align="right">
      <textarea cols="70" rows="20" name="code">
      <%=request.getSession().getAttribute(Constants.CODE)%>
#include <string>
#include <vector>
#include <cmath>
#include <cctype>
#include <queue>
#include <map>
#include <set>
#include <algorithm>
#include <iostream>
#include <sstream>
#include <utility>
#include <numeric>
#include <complex>
 
using namespace std;
 
class PatternOptimizer {
  public:
  string optimize(string pattern) {
 
    string ans, tmp;
    pattern += '0';
    for (int i = 0; i < pattern.length(); i++)
      {
        if (pattern[i] == '?' || pattern[i] == '*')
    tmp += pattern[i];
        else
    {
      if (tmp != "")
        {
          for (int j = 0; j < tmp.length(); j++)
      if (tmp[j] == '*')
        {
          ans += '*';
          break;
        }
          for (int j = 0; j < tmp.length(); j++)
      if (tmp[j] == '?')
        ans += '?';
        }
      tmp = "";
      ans += pattern[i];
    }
      }
    return ans.substr(0, ans.length() - 1);
    
  }
};
 
 
// Powered by FileEdit
      </textarea>
      </div>
      <div style="float:right; padding: 5px 0px 0px 5px;"><img src="/i/interface/btn_submit.gif" alt="Submit" border="0" /></div>
      <div style="float:right; padding: 5px 0px 0px 5px;"><img src="/i/interface/btn_save.gif" alt="Save" border="0" /></div>
      </form>
   </div>
</div>
<br><br>
        </td>

<%-- Right Column Begins --%>
         <td width="170">
            <jsp:include page="public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<%-- Right Column Ends --%>

         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
    </tr>
</table>

<jsp:include page="foot.jsp" />
</body>
</html>
<%
    request.getSession().removeAttribute(Constants.COMPILE_STATUS);
    request.getSession().removeAttribute(Constants.COMPILE_MESSAGE);
    request.getSession().removeAttribute(Constants.SELECTED_LANGUAGE);
    request.getSession().removeAttribute(Constants.CODE);
    request.getSession().removeAttribute(Constants.LANGUAGES);
    request.getSession().removeAttribute(Constants.CLASS_NAME);
%>
