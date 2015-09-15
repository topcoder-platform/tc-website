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
            <h2>PersistentNumber</h2>

            <div>
            <strong>
            Problem Statement
            | <a href="/tc?module=Static&d1=introevent&d2=bcsscs&d3=persistentNumberSol" class="bcLink">Solution</a>    
            </strong>
            </div>

            <table><tbody><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>Given a number x, we can define p(x) as the product of the digits of x.  We can then form a sequence x, p(x), p(p(x))...  The persistence of x is then defined as the index (0-based) of the first single digit number in the sequence.  For example, using 99, we get the sequence 99, 9*9 = 81, 8*1 = 8.  Thus, the persistence of 99 is 2.  You will be given <b>n</b>, and you must return its persistence.</td></tr><tr><td colspan="2">&nbsp;</td></tr><tr><td colspan="2"><h3>Definition</h3></td></tr><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><table><tbody><tr><td>Class:</td><td>PersistentNumber</td></tr><tr><td>Method:</td><td>getPersistence</td></tr><tr><td>Parameters:</td><td>int</td></tr><tr><td>Returns:</td><td>int</td></tr><tr><td>Method signature:</td><td>int getPersistence(int n)</td></tr><tr><td colspan="2">(be sure your method is public)</td></tr></tbody></table></td></tr><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;</td></tr><tr><td></td></tr><tr><td colspan="2">&nbsp;</td></tr><tr><td colspan="2"><h3>Constraints</h3></td></tr><tr><td align="center" valign="top">-</td><td><b>n</b> will be between 0 and 2,000,000,000, inclusive.</td></tr><tr><td colspan="2">&nbsp;</td></tr><tr><td colspan="2"><h3>Examples</h3></td></tr><tr><td align="center" nowrap="true">0)</td><td></td></tr><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><table><tbody><tr><td><table><tbody><tr><td><pre>99</pre></td></tr></tbody></table></td></tr><tr><td><pre>Returns: 2</pre></td></tr><tr><td><table><tbody><tr><td colspan="2">The example from the problem statement.</td></tr></tbody></table></td></tr></tbody></table></td></tr><tr><td align="center" nowrap="true">1)</td><td></td></tr><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><table><tbody><tr><td><table><tbody><tr><td><pre>268</pre></td></tr></tbody></table></td></tr><tr><td><pre>Returns: 4</pre></td></tr><tr><td><table><tbody><tr><td colspan="2">The sequence here is 268, 96, 54, 20, 0.</td></tr></tbody></table></td></tr></tbody></table></td></tr><tr><td align="center" nowrap="true">2)</td><td></td></tr><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><table><tbody><tr><td><table><tbody><tr><td><pre>6</pre></td></tr></tbody></table></td></tr><tr><td><pre>Returns: 0</pre></td></tr><tr><td><table><tbody><tr><td colspan="2">6 is already a single-digit number.</td></tr></tbody></table></td></tr></tbody></table></td></tr><tr><td align="center" nowrap="true">3)</td><td></td></tr><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><table><tbody><tr><td><table><tbody><tr><td><pre>68889789</pre></td></tr></tbody></table></td></tr><tr><td><pre>Returns: 3</pre></td></tr><tr><td><table><tbody><tr><td colspan="2"></td></tr></tbody></table></td></tr></tbody></table></td></tr><tr><td align="center" nowrap="true">4)</td><td></td></tr><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><table><tbody><tr><td><table><tbody><tr><td><pre>86898</pre></td></tr></tbody></table></td></tr><tr><td><pre>Returns: 7</pre></td></tr><tr><td><table><tbody><tr><td colspan="2"></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table><hr><p>This problem statement is the exclusive and proprietary property of TopCoder, Inc.  Any unauthorized use or reproduction of this information without the prior written consent of TopCoder, Inc. is strictly prohibited.  (c)2006, TopCoder, Inc.  All rights reserved.</p>

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