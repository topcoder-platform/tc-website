<%@  page
  language="java"
  import="java.util.*,
          java.text.*,
          com.topcoder.web.codinginterface.longcontest.*,
          com.topcoder.shared.common.LongRoundResults,
          com.topcoder.shared.dataAccess.resultSet.*"

%>
<%@ taglib uri="/WEB-INF/rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%!
    String buildHref(Map params, String key, String val){
        StringBuffer buf = new StringBuffer(100);
        buf.append("longcontest?");
        Map.Entry me = null;
        boolean first = false;
        if(params != null){
            first = true;
            buf.append(key).append('=').append(val);
        }
        for (Iterator it = params.entrySet().iterator(); it.hasNext();) {
            me = (Map.Entry)it.next();
            if(me.getKey().equals(key))continue;
            if(first){
                buf.append('&');
            }else{
                first = true;
            }
            String[] s = (String[])me.getValue();
            buf.append(me.getKey()).append('=').append(s[0]);
            for(int i = 1; i<s.length; i++){
                buf.append('&').append(me.getKey()).append('=').append(s[i]);
            }
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
    ArrayList tids = al.size() == 0 ? new ArrayList() : ((LongRoundResults.Record)al.get(0)).getParent().getTestCaseIds();
    int tests = tids.size();
    boolean over = ((Boolean)request.getAttribute(Constants.CONTEST_OVER)).booleanValue();
    String sort = (String)request.getAttribute(Constants.SORT_ORDER);
    String className = ((LongRoundResults.Record)al.get(0)).getParent().getClassName();
    DecimalFormat df = new DecimalFormat("0.000");
%>

<%if(startRow+rowCount < al.size()){%>
<A HREF="<%=buildHref(request.getParameterMap(), Constants.START_ROW, String.valueOf(startRow+rowCount))%>">next page</A>
<%}%>
<%if(startRow > 0){%>
<A HREF="<%=buildHref(request.getParameterMap(), Constants.START_ROW, String.valueOf(Math.max(0,startRow-rowCount)))%>">next page</A>
<%}%>
<table>
<tr>
<td colspan=2></td><td>
<%if(over && startCol > 0){%>
<A HREF="<%=buildHref(request.getParameterMap(), Constants.START_COL, String.valueOf(Math.max(0,startCol-colCount)))%>">&lt;&lt;</A>
<%}%>
</td>
<td colspan="<%=Math.min(tests-startCol,colCount)-2%>"></td>
<td align=right>
<%if(over && startCol+colCount < tests){%>
<A HREF="<%=buildHref(request.getParameterMap(), Constants.START_COL, String.valueOf(startCol+colCount))%>">&gt;&gt;</A>
<%}%>
</td><td></td>
</tr>
<tr>
<td></td>
<td>
<A HREF="<%=buildHref(request.getParameterMap(), Constants.SORT_ORDER, sort(sort,"C",primary))%>">Handle</A>
</td>
<%
for(int i = startCol; i<tests && i<startCol+colCount && over; i++){
%>
    <td>
    <A HREF="longcontest?module=ViewTestCase&tid=<%=tids.get(i)%>&rd=<%=request.getParameter("rd")%>&cid=<%=request.getParameter("cid")%>">+</A>
    <A HREF="<%=buildHref(request.getParameterMap(), Constants.SORT_ORDER, sort(sort,String.valueOf(i+1),primary))%>"><%=i+1%></A>
    </td>
<%}%>
<td>
<A HREF="<%=buildHref(request.getParameterMap(), Constants.SORT_ORDER, sort(sort,"T",primary))%>">Final Score</A>
</td>
<%
for(int i = startRow; i < al.size() && i<startRow+rowCount; i++){
    LongRoundResults.Record rec = (LongRoundResults.Record)al.get(i);
%>
    <tr>
    <td><A HREF="longcontest?module=SubmissionHistory&<%=Constants.CODER_ID%>=<%=rec.getCoderID()%>&<%=Constants.ROUND_ID%>=<%=request.getParameter(Constants.ROUND_ID)%>&<%=Constants.ROUND_ID%>=<%=request.getParameter(Constants.ROUND_ID)%>&<%=Constants.COMPONENT_ID%>=<%=request.getParameter(Constants.COMPONENT_ID)%>">+</A>
    </td><td>
    <A HREF="/tc?module=MemberProfile&cr=<%=rec.getCoderID()%>"><%=rec.getHandle()%></A> </td>
    <% for(int j = startCol; j<tests && j<startCol+colCount && over; j++){ %>
        <td align=right><%=df.format(rec.getTestScore(j))%></td>
    <%}%>
    <td align=right><%=df.format(rec.getScore())%> </td>
    </tr>
<%}%>
<tr>
<td colspan=2></td><td>
<%if(over && startCol > 0){%>
<A HREF="<%=buildHref(request.getParameterMap(), Constants.START_COL, String.valueOf(Math.max(0,startCol-colCount)))%>">&lt;&lt;</A>
<%}%>
</td>
<td colspan="<%=Math.min(tests-startCol,colCount)-2%>"></td>
<td align=right>
<%if(over && startCol+colCount < tests){%>
<A HREF="<%=buildHref(request.getParameterMap(), Constants.START_COL, String.valueOf(startCol+colCount))%>">&gt;&gt;</A>
<%}%>
</td><td></td>
</tr>
</table>

<%if(startRow+rowCount < al.size()){%>
<A HREF="<%=buildHref(request.getParameterMap(), Constants.START_ROW, String.valueOf(startRow+rowCount))%>">next page</A>
<%}%>
<%if(startRow > 0){%>
<A HREF="<%=buildHref(request.getParameterMap(), Constants.START_ROW, String.valueOf(Math.max(0,startRow-rowCount)))%>">next page</A>
<%}%>

