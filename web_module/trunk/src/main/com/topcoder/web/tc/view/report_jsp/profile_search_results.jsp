<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.common.web.data.report.*,
          com.topcoder.shared.dataAccess.resultSet.*,
          com.topcoder.web.common.StringUtils"

%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
  <!--
  <%= request.getAttribute("QUERY") %>
  -->
<%
  if("on".equals(request.getParameter("queryOnly"))){
    out.print("<pre>"+StringUtils.htmlEncode(request.getAttribute("QUERY").toString())+"</pre>");
  }else{
    Map m = (Map)request.getAttribute(Constants.REPORT_PROFILE_SEARCH_RESULTS_KEY);
    ResultSetContainer results = (ResultSetContainer)m.get("results");
    List headers = (List)request.getAttribute("column_headers");
    Enumeration e = request.getParameterNames();
%>


<html>
  <head>
<style type="text/css">
    TABLE.entry TD{
        BORDER-BOTTOM: #777777 1px solid ;
	    padding: 1px;
	    font-size: 12px;
        font-weight: normal;
        padding-right:1px;
    }
    A:link {
            COLOR: #4444bb; TEXT-DECORATION: none
    }
    A:visited {
            COLOR: #4444bb; TEXT-DECORATION: none
    }
    A:active {
            COLOR: #7777FF; TEXT-DECORATION: none
    }
    A:hover {
            COLOR: #7777FF; TEXT-DECORATION: none
    }

</style>
<script language="javascript">
<!--
    function sort(i){
        i++;
        document.revise['module'].value = 'ProfileSearch';
        if(i == parseInt(document.revise['order'].value)){
            document.revise['sort'].value = -parseInt(document.revise['sort'].value);
        }else{
            document.revise['sort'].value = '1';
        }
        document.revise['order'].value = i+'';
        document.revise.submit();
    }
    function revise(){
        document.revise['module'].value = 'ProfileSearch';
        document.revise['t'].value = 'profile_search';
        document.revise.submit();
    }
    function viewList(){
        document.revise['module'].value = 'ProfileSearch';
        document.revise['t'].value = '';
        document.revise['count'].value = 'off';
        document.revise.submit();
    }
    -->
</script>
    <title>TopCoder Reporting</title>
  </head>
  <body>
    <table class="entry" cellspacing=0>
    <tr>
    <tc:counter min="0" max="<%=results.getColumnCount()-1%>" id="i">
        <td>
            <a href="JavaScript:sort(<%=i%>)">
                <%=headers.get(Integer.parseInt(i))%>&nbsp;&nbsp;&nbsp;
            </a>
        </td>
    </tc:counter>
    </tr>
    <rsc:iterator list="<%=results%>" id="resultRow">
        <tr>
            <tc:counter min="0" max="<%=results.getColumnCount()-1%>" id="i">
                <td nowrap>
                    <%=resultRow.getStringItem(Integer.parseInt(i))%>&nbsp;
                </td>
            </tc:counter>
        </tr>
    </rsc:iterator>
    </table>
    <form name="revise" action="tc" method="get">
        <input type="hidden" name="revise" value="on">
        <logic:iterate collection="<%=e%>" id="key">
            <logic:iterate collection="<%=Arrays.asList(request.getParameterValues(key.toString()))%>" id="val">
                <input type="hidden" name="<%=key%>" value="<%=val%>">
            </logic:iterate>
        </logic:iterate>
    </form>
    <a href="JavaScript:revise()">Revise query</a>
    <% if("on".equals(request.getParameter("count"))){%>
        <br/><a href="JavaScript:viewList()">View full List</a>
    <% } %>
  </body>
</html>
<%}%>
