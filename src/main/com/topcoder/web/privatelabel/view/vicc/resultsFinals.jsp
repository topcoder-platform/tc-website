<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <jsp:include page="/script.jsp"/>

    <title>VeriSign Code Fest, Powered by TopCoder</title>
    <link type="text/css" rel="stylesheet" href="/css/vicc.css"/>
</head>

<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp">
    <jsp:param name="tabLev2" value="results"/>
    <jsp:param name="tabLev3" value="finals"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
<tr valign="top">
<td valign="top" align="center">
<div class="bodySpacer">

<span class="bigTitle">VTS Finals </span>
<br/><br/>
Congratulations to the Top Five Finalists who will be participating in the VTS Finals on August 14th:
<br><br>
<%--
H2O<br>
jdubb<br>
relic<br>
suomi<br>
vdods
<br><br>
Check back in August to find who the winner will be!
--%>
<%--
         <table width="350" border="0" align="center" cellpadding="6" cellspacing="2" class="sidebarBox">
            <tr>
               <td class="sidebarTitle">Finalist</td><td class="sidebarTitle">Winner</td>
            </tr>
            <tr valign="top">
               <td class="sidebarText"><b>H2O</b></td><td class="sidebarText"><b>&#160;</b></td> 
            </tr>
            <tr valign="top">
               <td class="sidebarText"><b>jdubb</b></td><td class="sidebarText"><b>&#160;</b></td>
            </tr>
            <tr valign="top">
               <td class="sidebarText"><b>relic</b></td><td class="sidebarText"><b>&#160;</b></td> 
            </tr>
            <tr valign="top">
               <td class="sidebarText"><b>suomi</b></td><td class="sidebarText"><b>&#160;</b></td>
            </tr>
            <tr valign="top">
               <td class="sidebarText"><b>vdods</b></td><td class="sidebarText"><b>&#160;</b></td>
            </tr>
         </table>
--%>
         <table width="150" border="0" align="center" cellpadding="6" cellspacing="2" class="sidebarBox">
            <tr>
               <td class="sidebarTitle">Finalists</td>
            </tr>
            <tr valign="top">
               <td class="sidebarText"><b>H2O</b></td>
            </tr>
            <tr valign="top">
               <td class="sidebarText"><b>jdubb</b></td>
            </tr>
            <tr valign="top">
               <td class="sidebarText"><b>relic</b></td>
            </tr>
            <tr valign="top">
               <td class="sidebarText"><b>suomi</b></td>
            </tr>
            <tr valign="top">
               <td class="sidebarText"><b>vdods</b></td>
            </tr>
         </table>

            <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
            <br/><br/><br/><br/><br/>
            To find out more detailed information about the VeriSign&#174; Code Fest, including a list of the
            prizes, please read the <a href="/pl/?&module=Static&d1=vicc&d2=rules">Terms and Conditions</a>.
        </div>    
      </td>


<!-- Right Column-->
<td width="180" align="right" style="padding: 0px 15px 0px 0px;">
    <jsp:include page="right.jsp"/>

</td>

</tr>

</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>
