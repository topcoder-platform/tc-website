<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<link type="text/css" rel="stylesheet" href="/css/visrm06.css"/>
<title>VeriSign Internal SRMs, Powered by TopCoder</title>
</head>

<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev2" value="details"/>
<jsp:param name="tabLev3" value="description"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<span class="bigTitle">Description of the VeriSign Internal Competition</span>
<br/><br/>
        </div>
      </td>
        
         
<!-- Right Column-->
<td width="180" align="right" style="padding: 0px 15px 0px 0px;">
<jsp:include page="right_ver.jsp" />

</td>
      
   </tr>
   
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
