<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <jsp:include page="../../script.jsp" />
    <jsp:include page="../../style.jsp">
    <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
</head>
<body>

<jsp:include page="../../top.jsp" >
<jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">

            <jsp:include page="../../page_title.jsp" >
                <jsp:param name="image" value="csdn"/>
                <jsp:param name="title" value="&#160;"/>
            </jsp:include>
            
			<div style="margin: 20px 0px 200px 0px;">
            	<h2>欢迎参加TopCoder/CSDN竞赛。</h2>
				<p>
				本次竞赛将于2007年3月16日（周五）晚上9点举行，面向所有目前居住在中国的TopCoder会员。如果你现在还不是TopCoder会员，请在这里注册：<A target="_blank" href="/reg/">www.topcoder.com/reg</A>
				</p>
				<p>
				请点击这里注册参加TopCoder/CSDN竞赛：<a href="/tc?module=CSDN07SubmitRegistration">www.topcoder.com/tc?module=CSDN07SubmitRegistration</a><br>
				在线竞赛注册将于2007年3月15日（周四）晚上11点59分截止。
				</p>
			</div>
            </div>
        </td>
<%-- Center Column Ends --%>
        
    </tr>
    </tbody>
</table>

<jsp:include page="../../foot.jsp" />
</body>
</html>