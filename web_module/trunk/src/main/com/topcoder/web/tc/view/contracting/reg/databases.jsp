<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Contracting</title>

<jsp:include page="../../../script.jsp" />

<SCRIPT TYPE="text/javascript">
<!--
function dropdown(mySel)
{
var myWin, myVal;
myVal = mySel.options[mySel.selectedIndex].value;
if(myVal)
   {
   if(mySel.form.target)myWin = parent[mySel.form.target];
   else myWin = window;
   if (! myWin) return true;
   myWin.location = myVal;
   }
return false;
}
//-->
</SCRIPT>

</head>

<body>

<jsp:include page="../../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../../includes/global_left.jsp">
                <jsp:param name="level1" value="my_home"/>
                <jsp:param name="level2" value="index"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td class="cardCell" width="100%" align="center">

        <div class="myTCBody">
        <jsp:include page="../../page_title.jsp" >
            <jsp:param name="image" value="contract"/>
            <jsp:param name="title" value="Registration"/>
        </jsp:include>

		<FORM ACTION="" METHOD=POST onSubmit="">
        <table border=0 cellpadding=2 cellspacing=0 width="100%" class=bodyText>
			<tr><td class=bodyText colspan=11>This is a description paragraph with some instructions and some details about the questions asked.</td></tr>
			<tr><td>&#160;</td><td class=bodyText colspan=5><span class=bodySubtitle>Novice</span></td><td class=bodyText colspan=5 align=right><span class=bodySubtitle>Expert</span></td>
        	<tr><td class=bodyText valign=top width="100%"><span class=bodySubtitle>Database</span></td>
            <% for(int i = 1; i<=10; i++){ %>
                <td class=bodyText align=center valign=top>
                    <span class=bodySubtitle><%=i%></span>
                </td>
            <% } %>
			</tr>
	        <tr>
	            <td class=bodyText valign=top>Oracle</td>
            <% for(int i = 1; i<=10; i++){ %>
	            <td valign=top align=center class=bodyText><input type="radio" name=group1 property=""/></td>
            <% } %>
	        </tr>
	        <tr>
	            <td class=bodyText valign=top>Sybase</td>
            <% for(int i = 1; i<=10; i++){ %>
	            <td valign=top align=center class=bodyText><input type="radio" name=group2 property=""/></td>
            <% } %>
	        </tr>
	        <tr>
	            <td class=bodyText valign=top>Informix</td>
            <% for(int i = 1; i<=10; i++){ %>
	            <td valign=top align=center class=bodyText><input type="radio" name=group3 property=""/></td>
            <% } %>
	        </tr>
	        <tr>
	            <td class=bodyText valign=top>MS SQL Server</td>
            <% for(int i = 1; i<=10; i++){ %>
	            <td valign=top align=center class=bodyText><input type="radio" name=group4 property=""/></td>
            <% } %>
	        </tr>
	        <tr>
	            <td class=bodyText valign=top>DB2</td>
            <% for(int i = 1; i<=10; i++){ %>
	            <td valign=top align=center class=bodyText><input type="radio" name=group5 property=""/></td>
            <% } %>
	        </tr>
	        <tr>
	            <td class=bodyText valign=top>Access</td>
            <% for(int i = 1; i<=10; i++){ %>
	            <td valign=top align=center class=bodyText><input type="radio" name=group6 property=""/></td>
            <% } %>
	        </tr>
	        <tr>
	            <td class=bodyText valign=top>Paradox</td>
            <% for(int i = 1; i<=10; i++){ %>
	            <td valign=top align=center class=bodyText><input type="radio" name=group7 property=""/></td>
            <% } %>
	        </tr>
	        <tr>
	            <td class=bodyText valign=top>dBase</td>
            <% for(int i = 1; i<=10; i++){ %>
	            <td valign=top align=center class=bodyText><input type="radio" name=group7 property=""/></td>
            <% } %>
	        </tr>
	        <tr>
	            <td class=bodyText valign=top>Interbase</td>
            <% for(int i = 1; i<=10; i++){ %>
	            <td valign=top align=center class=bodyText><input type="radio" name=group7 property=""/></td>
            <% } %>
	        </tr>
	        <tr>
	            <td class=bodyText valign=top>PostgreSQL</td>
            <% for(int i = 1; i<=10; i++){ %>
	            <td valign=top align=center class=bodyText><input type="radio" name=group7 property=""/></td>
            <% } %>
	        </tr>
	        <tr>
	            <td class=bodyText valign=top>MySQL</td>
            <% for(int i = 1; i<=10; i++){ %>
	            <td valign=top align=center class=bodyText><input type="radio" name=group7 property=""/></td>
            <% } %>
	        </tr>
			<tr><td colspan=11 align=center><br/><br/><a href="/tc?module=Static&d1=contracting&d2=reg&d3=success"><img src="/i/submit.jpg" border=0/></a></td></tr>
		</table>
		</FORM>

        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../../foot.jsp" />

</body>

</html>
