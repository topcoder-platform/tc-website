<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.web.codinginterface.longcontest.*,
          com.topcoder.shared.common.LongRoundResults,
          com.topcoder.shared.dataAccess.resultSet.*"

%>
<%@ taglib uri="/WEB-INF/rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>
<%!
    String buildHref(Map params, String param, String val){
        StringBuffer buf = new StringBuffer(100);
        buf.append("longcontest?");
        Map.Entry me = null;
        boolean first = false;
        if(params != null){
            first = true;
            buf.append(params).append('=').append(val);
        }
        for (Iterator it = params.entrySet().iterator(); it.hasNext();) {
            me = (Map.Entry)it.next();
            if(me.getKey().equals(params))continue;
            if(first){
                buf.append('&');
            }else{
                first = true;
            }
            buf.append(me.getKey()).append('=').append(me.getValue());
        }
        return buf.toString();
    }
    String sort(String old, String col, int primary){
        StringBuffer sb = new StringBuffer(20);
        if(col.equals("C") && primary == LongRoundResults.Record.CODER_SORT
            || col.equals("T") && primary == LongRoundResults.Record.TOTAL_SORT
            || !col.equals("C") && !col.equals("T") && primary == Integer.parseInt(col)){
            sb.append('-');
        }
        sb.append(col);
        StringTokenizer st = new StringTokenizer(old,"_");
        while(st.hasMoreTokens()){
            String s = st.nextToken();
            if(!s.equals("-"+col) && !s.equals(col)){
                sb.append('_');
                sb.append(s);
            }
        }
        return sb.toString();
    }
%>
<%
    ArrayList al = (ArrayList)request.getAttribute(Constants.RESULTS);
    int startRow = ((Integer)request.getAttribute(Constants.START_ROW)).intValue();
    int startCol = ((Integer)request.getAttribute(Constants.START_COL)).intValue();
    int rowCount = ((Integer)request.getAttribute(Constants.ROW_COUNT)).intValue();
    int colCount = ((Integer)request.getAttribute(Constants.COL_COUNT)).intValue();
    int primary = ((Integer)request.getAttribute(Constants.PRIMARY_COLUMN)).intValue();
    String sort = (String)request.getParameter(Constants.SORT_ORDER);
%>


<table>
<tr>
<td>
<A HREF="<%=buildHref(request.getParameterMap(), Constants.SORT_ORDER, sort(sort,"C",primary))%>">Handle</A>
</td>
<%
for(int i = startCol; i<startCol+colCount; i++){
%>
    <td>
    <A HREF="<%=buildHref(request.getParameterMap(), Constants.SORT_ORDER, sort(sort,String.valueOf(i),primary))%>"><%=i+1%></A>
    </td>
<%}%>
<td>
<A HREF="<%=buildHref(request.getParameterMap(), Constants.SORT_ORDER, sort(sort,"T",primary))%>">Final Score</A>
</td>
<%
for(int i = startRow; i<startRow+rowCount; i++){
    LongRoundResults.Record rec = (LongRoundResults.Record)al.get(i);
%>
    <tr>
    <td><A HREF="longcontest?module=SubmissionHistory&<%=Constants.CODER_ID%>=<%=rec.getCoderID()%>&<%=Constants.ROUND_ID%>=<%=request.getParameter(Constants.ROUND_ID)%>&<%=Constants.ROUND_ID%>=<%=request.getParameter(Constants.ROUND_ID)%>&<%=Constants.COMPONENT_ID%>=<%=request.getParameter(Constants.COMPONENT_ID)%>">+</A>
    </td><td>
    <A HREF="/tc?module=MemberProfile&cr=<%=rec.getCoderID()%>"><%=rec.getHandle()%></A> </td>
    <% for(int j = startCol; j<startCol+colCount; j++){ %>
        <td><%=rec.getTestScore(j)%></td>
    <%}%>
    <td> <%=rec.getScore()%> </td>
    </tr>
<%}%>
</table>


