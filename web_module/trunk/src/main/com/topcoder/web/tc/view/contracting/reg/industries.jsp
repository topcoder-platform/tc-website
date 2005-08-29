<%@  page language="java"  %>
<%@ page import="com.topcoder.web.tc.Constants,
                 com.topcoder.web.tc.model.Skill,
                 java.util.List" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="nocache.jsp"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Placement Registration</title>

<jsp:include page="../../script.jsp" />

<%
List skillList = (List)request.getAttribute("skills");
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

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="level1" value="employment"/>
                <jsp:param name="level2" value="registration"/>
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
            document.frmIndustries.module.value = s;
            document.frmIndustries.submit();
        }
    </script>

		<FORM ACTION="/tc" METHOD=POST onSubmit="" name="frmIndustries">
		<input type="hidden" name="module" value="ContractingIndustries"/>
		<input type="hidden" name="previouspage" value="skills" />
        <table border=0 cellpadding=0 cellspacing=0 width="100%" class=bodyText>
			<tr>
				<td class=oppDesc width="100%" valign=top>
				<span class=bodySubtitle>Industries</span>
				<br/><br/>
				For each of the selections below rate your experience.  Use the following guide when making your selections:
				<br/><br/>
				<table border=0 cellpadding=3 cellspacing=0 class=formFrame>
					<tr valign=top><td class=bodyText nowrap=nowrap><b>0 -</b></td><td class=bodyText><b>No experience</b></td></tr>
					<tr valign=top><td class=bodyText nowrap=nowrap><b>1 -</b></td><td class=bodyText><b>Aware</b> of that specific item. Experimented with it in the past.</td></tr>
					<tr valign=top><td class=bodyText nowrap=nowrap><b>2 -</b></td><td class=bodyText><b>Fair amount of experience</b> using that specific item. However, you do not feel quite confident about it.</td></tr>
					<tr valign=top><td class=bodyText nowrap=nowrap><b>3 -</b></td><td class=bodyText><b>Confident</b> in your knowledge of that specific item. Have a good amount of experience using it.</td></tr>
					<tr valign=top><td class=bodyText nowrap=nowrap><b>4 -</b></td><td class=bodyText><b>Very confident</b> in your knowledge of that specific item. Have extensive experience using it.</td></tr>
					<tr valign=top><td class=bodyText nowrap=nowrap><b>5 -</b></td><td class=bodyText><b>Expert/Guru</b>.  Select this only if you feel you know all there is to know in regards to that specific item.</td></tr>
				</table>
				</td>
				<td valign=top>
				<jsp:include page="breadcrumb.jsp" >
				<jsp:param name="phase" value="industries"/>
				</jsp:include>
				</td>
			</tr>
		</table>

		<FORM ACTION="" METHOD=POST onSubmit="">
        <table border=0 cellpadding=3 cellspacing=0 width="100%" class=bodyText>
			<td class=bodyText valign=top>&#160;</td>
			<td class=bodyText valign=top width="100%">&#160;</td>
            <% for(int i = 0; i<=5; i++){ %>
                <td class=bodyText align=center valign=top>
                    <span class=bodySubtitle><%=i%></span>
                </td>
            <% } %>
			</tr>
	    <%String[] cssClasses = new String[] {"formTextEven", "formTextOdd" };
                          int i = 0;%>
                <tc:skillIterator id="skill" list="<%=skillList%>">
                <tr>
	            <td class=<%=cssClasses[i % 2]%> valign=top nowrap=nowrap><%=skill.getText()%></td>
				<td class=<%=cssClasses[i % 2]%> valign=top>&#160;</td>
	            <tc:skillInput styleClass="<%=cssClasses[i++ % 2]%>" skill="<%=skill%>" />
                </tr>
                </tc:skillIterator>
		</table>
        <table border=0 cellpadding=3 cellspacing=0 width="100%" class=bodyText>
			<tr>
	            <td class=bodyText valign=middle nowrap=nowrap>Additional Comments:</td>
				<td class=bodyText align=right>
				<tc-webtag:textArea name="<%=Constants.NOTE_PREFIX + Constants.INDUSTRY_NOTE_TYPE_ID%>" rows="3" cols="40"/>
				</td>
			</tr>
			<tr><td colspan=2 align=center><br/><br/><a href="javascript:goToPage('ContractingConfirm');"><img src="/i/submit.jpg" border=0/></a>
			<%if(isEdit) {%><a href="javascript:goToPage('ContractingConfirm');"><img src="/i/jumpToEnd.jpg" border=0/></a><%}%>
			</td></tr>
		</table>
		</FORM>

        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
