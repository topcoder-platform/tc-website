<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Member Contact</title>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="contact"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="member_contact"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div class="fixedWidthBody">

<span class="bodySubtitle">Enable Member Contact</span>
<br><br>
Are you sure you want to enable other rated TopCoder members to contact you?
<br><br>
Once this is enabled, all rated TopCoder members will be able to send email messages to you, 
unless you block access for specific members on the <a href='/tc?module=BlackList'>black list</a> page.  
TopCoder member contact email messages will be sent to the email address listed in your TopCoder profile.
<br><br>
<form action="/tc" name="f">
<input type="hidden" name="enable" value="true" />
<input type="hidden" name="module" value="MemberContactEnable" />

<A href="javascript:document.f.submit()" class="bodyText"><img src="i/interface/btn_ok.gif" border="0"/></A>
&#160;
<A href="/tc?module=MemberContact" class="bodyText"><img src="i/interface/btn_cancel.gif" border="0"/></A>
</form>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="about"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>