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

            <div style="float:right; margin-top: 6px;"><a href="/tc?module=Static&amp;d1=help&amp;d2=index"><img src="/i/introevent/tryMoreAlgo.png" alt="Try some more Algorithm Competitions?" /></a></div>
            <div align="left" style="margin-bottom: 20px;">
                <img src="/i/introevent/bcsLogo.png" alt="" />
            </div>
            <h2>Problem Statement for RevealTriangle</h2>

            <div>
            <strong>
            Problem Statement 
            | <a href="/tc?module=Static&amp;d1=introevent&amp;d2=bcsscs&amp;d3=revealTriangleSol" class="bcLink">Solution</a>
            </strong>
            </div>
            
            <table>
                <tbody>
                    <tr>
                        <td colspan="2"><h3>Problem Statement</h3></td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <p>Suppose there is a triangle of digits like the following:</p>
                            <pre>
74932
1325
457
92
1</pre>
                            <p>Each digit, with the exception of those in the top row, is equal to the last digit of the sum of its upper and upper-right neighboring digits.</p>
                            <p>You will be given a String[] <strong>questionMarkTriangle</strong> containing a triangle where only one digit in each row is known and all others are represented by '?'s (see example 0 for clarification). Each element of <strong>questionMarkTriangle</strong> represents a row of the triangle, and the rows are given from top to bottom. Each element contains exactly one digit ('0'-'9') and the remaining characters are all '?'s. Restore the triangle and return it as a String[] without '?'s.</p>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2"><h3>Definition</h3></td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <table>
                                <tbody>
                                    <tr>
                                        <td>Class:</td>
                                        <td>RevealTriangle</td>
                                    </tr>
                                    <tr>
                                        <td>Method:</td>
                                        <td>calcTriangle</td>
                                    </tr>
                                    <tr>
                                        <td>Parameters:</td>
                                        <td>String[]</td>
                                    </tr>
                                    <tr>
                                        <td>Returns:</td>
                                        <td>String[]</td>
                                    </tr>
                                    <tr>
                                        <td>Method signature:</td>
                                        <td>String[] calcTriangle(String[] questionMarkTriangle)</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">(be sure your method is public)</td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2"><h3>Constraints</h3></td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">-</td>
                        <td><strong>questionMarkTriangle</strong> will contain between 1 and 50 elements, inclusive.</td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">-</td>
                        <td>Element i (0 indexed) of <strong>questionMarkTriangle</strong> will contain exactly n-i characters, where n is the number of elements in <strong>questionMarkTriangle</strong>.</td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">-</td>
                        <td>Each element of <strong>questionMarkTriangle</strong> will contain exactly one digit ('0'-'9') and all others characters will be '?'s.</td>
                    </tr>
                    <tr>
                        <td colspan="2"><h3>Examples</h3></td>
                    </tr>
                    <tr>
                        <td align="center" nowrap="true">0)</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <pre>{"4??", 
 "?2", 
 "1"}</pre>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <pre>Returns: {"457", "92", "1" }</pre>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td colspan="2">Let's substitute '?'s with unknown variables:<br /><pre>4ab 
c2 
1
</pre><br />Having done that, we start solving for the variables from the bottom to the top. First, we know that the last digit of (c + 2) is 1. Therefore, c must be 9:<br /><pre>4ab 
92 
1
</pre><br />Now we know that the last digit of (4 + a) is 9, which means a is 5:<br /><pre>45b 
92 
1
</pre>And, finally, the last digit of (5 + b) is 2, so b is 7.</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" nowrap="true">1)</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <pre>{"1"}</pre>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <pre>Returns: {"1" }</pre>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td colspan="2">&nbsp;</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" nowrap="true">2)</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <pre>{"???2", "??2", "?2", "2"}</pre>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <pre>Returns: {"0002", "002", "02", "2" }</pre>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td colspan="2">&nbsp;</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" nowrap="true">3)</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <pre>{"??5?", "??9", "?4", "6"}</pre>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <pre>Returns: {"7054", "759", "24", "6" }</pre>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td colspan="2">&nbsp;</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    
                </tbody>
            </table>
            
            <hr><p>This problem statement is the exclusive and proprietary property of TopCoder, Inc. Any unauthorized use or reproduction of this information without the prior written consent of TopCoder, Inc. is strictly prohibited. &copy;2006, TopCoder, Inc. All rights reserved. </p></hr>

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