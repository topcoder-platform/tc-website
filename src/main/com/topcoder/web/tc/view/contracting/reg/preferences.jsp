<%@  page language="java"  %>
<%@ page import="com.topcoder.web.tc.Constants,
                 com.topcoder.web.tc.model.PreferenceGroup,
                 java.util.List" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Contract</title>

<jsp:include page="../../../script.jsp" />

<%
List prefList = (List)request.getAttribute("groups");
%>

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
        <td width="100%" align="center">
        <div class="myTCBody">

        <jsp:include page="../../page_title.jsp" >
            <jsp:param name="image" value="contract"/>
            <jsp:param name="title" value="Registration"/>
        </jsp:include>

<!-- Breadcrumb-->
        <table border=0 cellpadding=0 cellspacing=0 width="100%" class=bodyText>
			<tr>
				<td class=oppDesc width="100%" valign=top>
				<span class=bodySubtitle>Preferences</span>
				<br/><br/>
				This is a description paragraph with some instructions and some details about the questions asked.
				</td>
				<td valign=top>
				<jsp:include page="breadcrumb.jsp" >
				<jsp:param name="phase" value="preferences"/>
				</jsp:include>
				</td>
			</tr>
		</table>
		
		<FORM ACTION="/tc?module=ContractingPreferences" METHOD=POST onSubmit="" enctype="multipart/form-data" name="frmPref">
		<input type="hidden" name="dataToLoad" value="preferences" />
		
		<tc:preferenceGroupIterator id="prefGroup" list="<%=prefList%>">
                    <span class=bodySubtitle><%=prefGroup.getName()%></span>
                    <br/>
                    <table border=0 cellpadding=3 cellspacing=0 width="100%" class=bodyText>
                        <%String[] cssClasses = new String[] {"formTextEven", "formTextOdd" };
                          int i = 0;%>
                        <tc:preferenceIterator id="pref" list="<%=prefGroup.getPrefs()%>">
                        <tr>
                                <%if(pref.getType() == Constants.PREFERENCE_MULTIPLE_ANSWER) { %>
				<td width="100%" class=<%=cssClasses[i % 2]%>><%=pref.getText()%>:</td>
				<td class=<%=cssClasses[i++ % 2]%>>
                                        <tc:preferenceInput preference="<%=pref%>" />
				</td>
				<% } else { %>
				<td width="100%" class=<%=cssClasses[i % 2]%>><label><tc:preferenceInput preference="<%=pref%>" /> <%=pref.getText()%></label></td>
				<td class=<%=cssClasses[i++ % 2]%>>
                                        &nbsp;
				</td>
				<% } %>
			</tr>
                        </tc:preferenceIterator>
                    </table>
                    
                    <br/><br/>

		</tc:preferenceGroupIterator>
		
        <table border=0 cellpadding=3 cellspacing=0 width="100%" class=bodyText>
			<tr>
				<td class=bodyText>Attach your <b>resume</b> here and we'll include it in your profile</td>
			</tr>
			<tr>
				<td width=100%><input type=file name="Resume"></td>
			</tr>
		</table> 

		<div width="100%" align=center><br/><br/><a href="javascript:document.frmPref.submit();"><img src="/i/submit.jpg" border=0/></a></div>

		</FORM>

        </div>
		<p align=center class=bodyText><b>Please check to make sure that your information is up-to-date.</b></p>
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
