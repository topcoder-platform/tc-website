<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>TopCoder Studio</title>

<jsp:include page="style.jsp">
    <jsp:param name="key" value="tc_creative_forums"/>
</jsp:include>
</head>

<body>

<jsp:include page="top.jsp">
    <jsp:param name="section" value="default"/>
</jsp:include>

<jsp:include page="left.jsp">
    <jsp:param name="node" value="forums"/>
</jsp:include>

<div class="contentOuter">
   <div class="contentInner">
<table cellpadding="0" cellspacing="0" class="rtbcTable">
<tr>
   <td class="categoriesBox" style="padding-right: 20px;">
      <jsp:include page="categoriesHeader.jsp" />
   </td>
   <td nowrap="nowrap" valign="top" width="100%" style="padding-right: 20px;">
      <jsp:include page="searchHeader.jsp" />
    </td>
    <td align="right" nowrap="nowrap" valign="top">
        <A href="?module=History" class="rtbcLink">My Post History</A>&nbsp;&nbsp;|&nbsp;&nbsp;<A href="?module=Watches" class="rtbcLink">My Watches</A>&nbsp;&nbsp;|&nbsp;&nbsp;<A href="?module=Settings" class="rtbcLink">User Settings</A><br/>
    </td>
</tr>
<tr>
   <td colspan="3" style="padding-bottom:3px;"><strong>
      <A href="?module=Category&categoryID=1&mc=84597" class="rtbcLink">Forums</A> >
      <A href="?module=Category&categoryID=13&mc=68059" class="rtbcLink">Round Tables</A> >
      <A href="?module=ThreadList&forumID=244237&mc=10360" class="rtbcLink">General Discussion</A> >
      <img src="/i/interface/announcement.gif" alt="" border="0"> Guideline Clarifications
      </strong>
   </td>
</tr>
</table>

            

<table cellpadding="0" cellspacing="0" class="rtTable">
<tbody>
   <tr>
      <td class="rtHeader" colspan="2">
         <div style="float: right; padding-left: 5px; white-space: nowrap;">
         <a name="19">Jul 27, 2006 at 1:48 PM EDT 
         </a></div>
         <a name="19">Guideline Clarifications</a>
      </td>
   </tr>
   <tr>
      <td class="rtPosterCell">
         <div class="rtPosterSpacer">
         <img src="/i/m/ivern_big2.jpg" class="rtPhoto" border="0" height="61" width="55"><br>
         <span class="bodyText"><a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=156859" class="coderTextOrange">ivern</a></span><br><a href="?module=History&amp;userID=156859">1232 posts</a>
         </div>
      </td>
      <td class="rtTextCell" width="100%">
         Hello folks,<br><br>I will be posting clarifications that haven't made their way into the official guideline page yet here.<br><br><b>* Testing Protected Methods:</b><br><br>All methods that are exported by the component should be tested.  This includes protected methods.  In this light, "all public methods" in the scorecard should be interpreted to mean "all non-private methods".<br><br><b>* Association vs. Aggregation vs. Composition:</b><br><br>An association (base type) is used when any class (A) references any other class (B).  In this case, this reference isn't kept as an attribute of that class, it's just that A uses B somewhere without keeping B as part of its state.<br><br>A composition is used when class A keeps a reference to class B:<br> 1) as part of its state<br> 2) when instances of A define the lifetime of B (B is dependent on A for it's survival).<br><br>Aggregation is used when a reference exists between A and B but destroying A doesn't result in the death of B.<br><br><b>* Copyright Notices:</b><br><br>Copyright notices in source code need to be correct as required by the TopCoder CheckStyle rules.
      </td>
   </tr>
</tbody>
</table>


        <jsp:include page="foot.jsp"/>
    </div>
</div>
</body>
</html>
