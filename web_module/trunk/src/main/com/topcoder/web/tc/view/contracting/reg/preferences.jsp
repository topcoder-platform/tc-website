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
		
		<FORM ACTION="" METHOD=POST onSubmit="">
		
		<tc:preferenceGroupIterator id="prefGroup" list="<%=prefList%>">
                    <span class=bodySubtitle><%=prefGroup.getName()%></span>
                    <br/>
                    <table border=0 cellpadding=3 cellspacing=0 width="100%" class=bodyText>
                        <%String[] cssClasses = new String[] {"formTextEven", "formTextOdd" };
                          int i = 0;%>
                        <tc:preferenceIterator id="pref" list="<%=prefGroup.getPrefs()%>">
                        <tr>
				<td width="100%" class=<%=cssClasses[i % 2]%>><%=pref.getText()%>:</td>
				<td class=<%=cssClasses[i++ % 2]%>>
					<%=pref.getType()%>
				</td>
			</tr>
                        </tc:preferenceIterator>
                    </table>
                    
                    <br/><br/>

		</tc:preferenceGroupIterator>
		
		<span class=bodySubtitle>Contract Work</span>
		<br/>

		
		<input type="checkbox" name="contract" value="" checked>I am interested in being hired for temporary contract work.
        <table border=0 cellpadding=3 cellspacing=0 width="100%" class=bodyText>
			<tr>
				<td width="100%" class=formTextEven>Minimum hourly rate:</td>
				<td class=formTextEven>
					<SELECT NAME="minHrRate">
					<OPTION VALUE="">&#160;-
					<OPTION VALUE="">$5.00/hr
					<OPTION VALUE="">$10.00/hr
					<OPTION VALUE="">$20.00/hr
					<OPTION VALUE="">$50.00/hr
					<OPTION VALUE="">$100.00/hr
					</SELECT>
				</td>
			</tr>
			<tr>
				<td class=formTextOdd>Maximum length of engagement:</td>
				<td class=formTextOdd>
					<SELECT NAME="maxEngage">
					<OPTION VALUE="">&#160;-
					<OPTION VALUE="">3 months
					<OPTION VALUE="">6 months
					<OPTION VALUE="">9 months
					<OPTION VALUE="">Indefinite
					</SELECT>
				</td>
			</tr>
			<tr>
				<td class=formTextEven>Minimum length of engagement</td>
				<td class=formTextEven>
					<SELECT NAME="maxEngage">
					<OPTION VALUE="">&#160;-
					<OPTION VALUE="">No minimum
					<OPTION VALUE="">3 months
					<OPTION VALUE="">6 months
					<OPTION VALUE="">9 months
					</SELECT>
				</td>
			</tr>
			<tr>
				<td class=formTextOdd>Willing to travel:</td>
				<td class=formTextOdd>
					<SELECT NAME="travel">
					<OPTION VALUE="">&#160;-
					<OPTION VALUE="">Yes
					<OPTION VALUE="">No
					</SELECT>
				</td>
			</tr>
		</table>
		
		<br/><br/>

		<span class=bodySubtitle>Permanent Position</span>		
		<br/>		

		<input type="checkbox" name="contract" value="" checked>I am interested in being hired for permanent positions.<br/>
        <table border=0 cellpadding=3 cellspacing=0 width="100%" class=bodyText>
			<tr>
				<td width="100%" class=formTextEven>Minimum salary:</td>
				<td class=formTextEven>
					<SELECT NAME="minHrRate">
					<OPTION VALUE="">&#160;-
					<OPTION VALUE="">$25,000
					<OPTION VALUE="">$50,000
					<OPTION VALUE="">$75,000
					<OPTION VALUE="">$100,000
					<OPTION VALUE="">$1,000,000
					</SELECT>
				</td>
			</tr>
			<tr>
				<td class=formTextOdd>Willing to relocate:</td>
				<td class=formTextOdd>
					<SELECT NAME="travel">
					<OPTION VALUE="">&#160;-
					<OPTION VALUE="">Yes
					<OPTION VALUE="">No
					</SELECT>
				</td>
			</tr>
		</table>

		<br/><br/>

        <table border=0 cellpadding=3 cellspacing=0 width="100%" class=bodyText>
			<tr>
				<td width="100%" class=formTextEven>Are you authorized to work in the US?</td>
				<td class=formTextEven>
					<SELECT NAME="minHrRate">
					<OPTION VALUE="">&#160;-
					<OPTION VALUE="">Yes
					<OPTION VALUE="">No
					</SELECT>
				</td>
			</tr>
			<tr>
				<td width="100%" class=formTextOdd>Preferred method for contact</td>
				<td class=formTextOdd>
					<SELECT NAME="minHrRate">
					<OPTION VALUE="">&#160;-
					<OPTION VALUE="">phone
					<OPTION VALUE="">email
					</SELECT>
				</td>
			</tr>
		</table>

		<br/><br/>

        <table border=0 cellpadding=3 cellspacing=0 width="100%" class=bodyText>
			<tr>
				<td class=bodyText>Attach your <b>resume</b> here and we'll include it in your profile</td>
			</tr>
			<tr>
				<td width=100%><input type=file name="Resume"></td>
			</tr>
		</table>

		<div width="100%" align=center><br/><br/><a href="/tc?module=Static&d1=contracting&d2=reg&d3=languages"><img src="/i/submit.jpg" border=0/></a></div>

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
