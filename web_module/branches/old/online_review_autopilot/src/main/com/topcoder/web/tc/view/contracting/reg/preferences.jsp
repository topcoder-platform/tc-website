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
boolean isEdit = ((String)request.getAttribute("isEdit")).equals("true");
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
                <jsp:param name="level2" value="employmentOpps"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="center">
        <div class="myTCBody">

        <jsp:include page="../../page_title.jsp" >
            <jsp:param name="image" value="employmentOpps"/>
            <jsp:param name="title" value="Registration"/>
        </jsp:include>

<!-- Breadcrumb-->

    <script language="javascript">
        function goToPage(s)
        {
            document.frmPref.module.value = s;
            document.frmPref.submit();
        }
    </script>

		<FORM ACTION="/tc" METHOD=POST onSubmit="" enctype="multipart/form-data" name="frmPref">
		<input type="hidden" name="module" value="ContractingLanguages"/>
		<input type="hidden" name="previouspage" value="preferences" />
		
        <table border=0 cellpadding=0 cellspacing=0 width="100%" class=bodyText>
			<tr>
				<td class=oppDesc width="100%" valign=top>
				<span class=bodySubtitle>Preferences</span>
				<br/><br/>
				</td>
				<td valign=top>
				<jsp:include page="breadcrumb.jsp" >
				<jsp:param name="phase" value="preferences"/>
				</jsp:include>
				</td>
			</tr>
		</table>
		
		
		<tc:preferenceGroupIterator id="prefGroup" list="<%=prefList%>">
                    <span class=bodySubtitle><%=prefGroup.getName()%></span>
                    <br/>
                    <table border=0 cellpadding=3 cellspacing=0 width="100%" class=bodyText>
                        <%String[] cssClasses = new String[] {"formTextEven", "formTextOdd" };
                          int i = 0;%>
                        <tc:preferenceIterator id="pref" list="<%=prefGroup.getPrefs()%>">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.PREFERENCE_PREFIX + pref.getID()%>">
                            <tr>
                                <td colspan=2 width="100%" align=center class=<%=cssClasses[i % 2]%>>
                                    <span class="bigRed"><%=err%></span>
                                </td>
                            </tr>
                        </tc-webtag:errorIterator>
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
		<p align=center class=bodyText><b>Please check to make sure that your contact information is up-to-date in your profile.</b></p>
		
        <table border=0 cellpadding=3 cellspacing=0 width="100%" class=bodyText>
			<tr>
				<td class=bodyText>Attach your <b>resume</b> here and we'll include it in your profile</td>
			</tr>
			<%if(request.getAttribute("hasResume") != null && request.getAttribute("hasResume").equals("true")) {%>
			<tr>
				<td class=bodyText><a href="/Resume?&t=DownloadTask">Download your existing resume</a></td>
			</tr>
			<%}%>
			<tr>
				<td width=100%><input type=file name="Resume"></td>
			</tr>
		</table> 

		<div width="100%" align=center><br/><br/><a href="javascript:goToPage('ContractingLanguages');"><img src="/i/submit.jpg" border=0/></a>
		<%if(isEdit) {%><a href="javascript:goToPage('ContractingConfirm');"><img src="/i/jumpToEnd.jpg" border=0/></a><%}%></div>

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
