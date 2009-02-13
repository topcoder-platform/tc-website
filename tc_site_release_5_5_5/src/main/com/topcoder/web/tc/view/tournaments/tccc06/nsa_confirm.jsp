<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="eventPatrons"/>
<jsp:param name="tabLev3" value="nsa"/>
</jsp:include>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<div align="center"><img src="/i/tournament/tccc06/nsa_logo.gif" alt="NSA" border="0" /></div>
<br><br>
By clicking "Submit" below you will be releasing your TopCoder contact and statistical information to NSA and you will be giving NSA permission to contact you about their current job opportunities.
<br><br>
<A href="/tc?module=JobHit&jid=339&jt=1">Submit</A>
<br><br><br><br><br><br>

        </div>
      </td>
        
         
<!-- Right Column-->
<td>&#160;</td>
<%--
        <td width="170" align="right">
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="nsa"/>
            </jsp:include>
         </td>
--%>    
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />
</body>

</html>
