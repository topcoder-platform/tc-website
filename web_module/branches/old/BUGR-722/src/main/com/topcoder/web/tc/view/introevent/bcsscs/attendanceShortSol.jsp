<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../../script.jsp" />
    <jsp:include page="../../style.jsp">
    <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>
<body>

<jsp:include page="../../top.jsp" >
<jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="node" value="m_algo_competitions"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="left" class="bodyColumn">
            
            <jsp:include page="/page_title.jsp" >
               <jsp:param name="image" value="algorithm"/>
               <jsp:param name="title" value="Introduction Event"/>
            </jsp:include>

            <div style="float:right; margin-top: 6px;"><A href="/tc?module=Static&d1=help&d2=index"><img src="/i/introevent/tryMoreAlgo.png" alt="Try some more Algorithm Competitions?" /></A></div>
            <div align="left" style="margin-bottom: 20px;">
                <img src="/i/introevent/bcsLogo.png" alt="" />
            </div>
            <h2>Problem Statement for AttendanceShort</h2>

            <div>
            <strong>
            <A href="/tc?module=Static&d1=introevent&d2=bcsscs&d3=attendanceShort" class="bcLink">Problem Statement</A>
            | Solution
            </strong>
            </div>

<pre>
#include &lt;vector&gt;
#include &lt;string&gt;
using namespace std;
 
struct AttendanceShort {
vector&lt;string&gt; shortList(vector&lt;string&gt; names, vector&lt;string&gt; attendance)
{
 
vector&lt;string&gt; ret;
for (int i = 0; i &lt; names.size(); i ++)
{
    int present = 0, total = 0;
    for (int j = 0; j &lt; attendance[i].size(); j ++)
    {
        switch(attendance[i][j])
        {
        case 'P': present ++;
        case 'A': total ++;
        default: break;
        }
    }
    if (present * 4 &lt; total * 3) ret.push_back(names[i]);
}
 
return ret;
}
};
</pre>

        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
    </tbody>
</table>

<jsp:include page="../../foot.jsp" />
</body>
</html>