<%@ page import="com.topcoder.web.tc.Constants"%>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>TopCoder High School Competitions</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

</head>

<body>

<jsp:include page="/top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="m_competitions"/>
         </jsp:include>
        </td>
        <!-- Left Column Ends -->

        <!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Match Results"/>
</jsp:include>

<script language="JavaScript">
<!--
function goTo(selection){
sel = selection.options[selection.selectedIndex].value;
if (sel && sel != '#'){
window.location='/longcontest/?module=ViewOverview&rd='+sel;
}
}
// -->
</script>

<div style="float:right;" align="center">
<select name="rd" onchange="goTo(this)">
<option value="" selected="selected">Please select a contest</option>
<option value="0000">HS Single Round Match 1</option>
</select>
<br>
<strong>or</strong>
<br>
<select name="season" onchange="goTo(this)">
<option value="" selected="selected">Please select a season</option>
<option value="0000">2006-2007</option>
</select>
</div>

<span class="bigTitle">Competition: HS SRM 1</span><br>
<span class="bodySubtitle">Season: 2006-2007</span><br>
<span class="bodySubtitle">Competitors: 499</span><br>
<A href="" class="bcLink">Discuss this contest</a>

<div class="pagingBox">
&lt;&lt; prev
| <a href="Javascript:next()" class="bcLink">next &gt;&gt;</a>
</div>
<table class="stat" cellpadding="0" cellspacing="0" width="100%">
   <tr><td class="title" colspan="15">HS SRM 1 Results</td></tr>
   <tr>
      <td class="headerC" colspan="9" style="border-right:1px solid #999999;">&#160;</td>
      <td class="headerC" colspan="6">Rating</td>
   <tr>
      <td class="header">&#160;</td>
      <td class="header">Competitors</td>
      <td class="headerR" nowrap="nowrap">Coding Phase</td>
      <td class="headerR">+</td>
      <td class="headerR" nowrap="nowrap">Challenge Phase</td>
      <td class="headerR">+</td>
      <td class="headerR" nowrap="nowrap">System Tests</td>
      <td class="headerR">=</td>
      <td class="headerR" nowrap="nowrap" style="border-right:1px solid #999999;">Point Total</td>
      <td class="headerR" nowrap="nowrap">Old</td>
      <td class="headerR">+</td>
      <td class="headerR" nowrap="nowrap">Change</td>
      <td class="headerR">=</td>
      <td class="headerR" nowrap="nowrap">New</td>
      <td class="headerR">&#160;</td>
   </tr>
   <% boolean even = false; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" style="vertical-align: middle;">
      <A href="#"><img src="/i/interface/exp_w.gif" alt="" /></A>
      </td>
      <td class="value">
      <tc-webtag:handle coderId="144400" />
      </td>
      <td class="valueR">
      1062.82
      </td>
      <td class="valueR" colspan="2">
      775.00
      </td>
      <td class="valueR" colspan="2">
      0.00
      </td>
      <td class="valueR" colspan="2" style="border-right:1px solid #999999;">
      1837.82
      </td>
      <td class="valueR">
      3422
      </td>
      <td class="valueR" colspan="2">
      94
      </td>
      <td class="valueR" colspan="2">
      3516
      </td>
      <td class="value" style="vertical-align: middle;">
      <img src="/i/interface/greenUp.gif" alt="" />
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" style="vertical-align: middle;">
      <A href="#"><img src="/i/interface/exp_w.gif" alt="" /></A>
      </td>
      <td class="value">
      <tc-webtag:handle coderId="144400" />
      </td>
      <td class="valueR">
      1062.82
      </td>
      <td class="valueR" colspan="2">
      775.00
      </td>
      <td class="valueR" colspan="2">
      0.00
      </td>
      <td class="valueR" colspan="2" style="border-right:1px solid #999999;">
      1837.82
      </td>
      <td class="valueR">
      3422
      </td>
      <td class="valueR" colspan="2">
      94
      </td>
      <td class="valueR" colspan="2">
      3516
      </td>
      <td class="value" style="vertical-align: middle;">
      <img src="/i/interface/redDown.gif" alt="" />
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" style="vertical-align: middle;">
      <A href="#"><img src="/i/interface/exp_w.gif" alt="" /></A>
      </td>
      <td class="value">
      <tc-webtag:handle coderId="144400" />
      </td>
      <td class="valueR">
      1062.82
      </td>
      <td class="valueR" colspan="2">
      775.00
      </td>
      <td class="valueR" colspan="2">
      0.00
      </td>
      <td class="valueR" colspan="2" style="border-right:1px solid #999999;">
      1837.82
      </td>
      <td class="valueR">
      3422
      </td>
      <td class="valueR" colspan="2">
      94
      </td>
      <td class="valueR" colspan="2">
      3516
      </td>
      <td class="value" style="vertical-align: middle;">
      <img src="/i/interface/redDown.gif" alt="" />
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="valueR" style="vertical-align: middle;">
      <A href="#"><img src="/i/interface/exp_ed_w.gif" alt="" /></A>
      </td>
      <td class="value">
      <tc-webtag:handle coderId="144400" />
      </td>
      <td class="valueR">
      <strong>1062.82</strong>
      </td>
      <td class="valueR" colspan="2">
      <strong>775.00</strong>
      </td>
      <td class="valueR" colspan="2">
      <strong>0.00</strong>
      </td>
      <td class="valueR" colspan="2" style="border-right:1px solid #999999;">
      <strong>1837.82</strong>
      </td>
      <td class="valueR">
      <strong>3422</strong>
      </td>
      <td class="valueR" colspan="2">
      <strong>94</strong>
      </td>
      <td class="valueR" colspan="2">
      <strong>3516</strong>
      </td>
      <td class="value" style="vertical-align: middle;">
      <img src="/i/interface/redDown.gif" alt="" />
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" style="vertical-align: middle;">
      <A href="#"><img src="/i/interface/exp_w.gif" alt="" /></A>
      </td>
      <td class="value">
      <tc-webtag:handle coderId="144400" />
      </td>
      <td class="valueR">
      1062.82
      </td>
      <td class="valueR" colspan="2">
      775.00
      </td>
      <td class="valueR" colspan="2">
      0.00
      </td>
      <td class="valueR" colspan="2" style="border-right:1px solid #999999;">
      1837.82
      </td>
      <td class="valueR">
      3422
      </td>
      <td class="valueR" colspan="2">
      94
      </td>
      <td class="valueR" colspan="2">
      3516
      </td>
      <td class="value" style="vertical-align: middle;">
      <img src="/i/interface/redDown.gif" alt="" />
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" style="vertical-align: middle;">
      <A href="#"><img src="/i/interface/exp_w.gif" alt="" /></A>
      </td>
      <td class="value">
      <tc-webtag:handle coderId="144400" />
      </td>
      <td class="valueR">
      1062.82
      </td>
      <td class="valueR" colspan="2">
      775.00
      </td>
      <td class="valueR" colspan="2">
      0.00
      </td>
      <td class="valueR" colspan="2" style="border-right:1px solid #999999;">
      1837.82
      </td>
      <td class="valueR">
      3422
      </td>
      <td class="valueR" colspan="2">
      94
      </td>
      <td class="valueR" colspan="2">
      3516
      </td>
      <td class="value" style="vertical-align: middle;">
      <img src="/i/interface/redDown.gif" alt="" />
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" style="vertical-align: middle;">
      <A href="#"><img src="/i/interface/exp_w.gif" alt="" /></A>
      </td>
      <td class="value">
      <tc-webtag:handle coderId="144400" />
      </td>
      <td class="valueR">
      1062.82
      </td>
      <td class="valueR" colspan="2">
      775.00
      </td>
      <td class="valueR" colspan="2">
      0.00
      </td>
      <td class="valueR" colspan="2" style="border-right:1px solid #999999;">
      1837.82
      </td>
      <td class="valueR">
      3422
      </td>
      <td class="valueR" colspan="2">
      94
      </td>
      <td class="valueR" colspan="2">
      3516
      </td>
      <td class="value" style="vertical-align: middle;">
      <img src="/i/interface/redDown.gif" alt="" />
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" style="vertical-align: middle;">
      <A href="#"><img src="/i/interface/exp_w.gif" alt="" /></A>
      </td>
      <td class="value">
      <tc-webtag:handle coderId="144400" />
      </td>
      <td class="valueR">
      1062.82
      </td>
      <td class="valueR" colspan="2">
      775.00
      </td>
      <td class="valueR" colspan="2">
      0.00
      </td>
      <td class="valueR" colspan="2" style="border-right:1px solid #999999;">
      1837.82
      </td>
      <td class="valueR">
      3422
      </td>
      <td class="valueR" colspan="2">
      94
      </td>
      <td class="valueR" colspan="2">
      3516
      </td>
      <td class="value" style="vertical-align: middle;">
      <img src="/i/interface/redDown.gif" alt="" />
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" style="vertical-align: middle;">
      <A href="#"><img src="/i/interface/exp_w.gif" alt="" /></A>
      </td>
      <td class="value">
      <tc-webtag:handle coderId="144400" />
      </td>
      <td class="valueR">
      1062.82
      </td>
      <td class="valueR" colspan="2">
      775.00
      </td>
      <td class="valueR" colspan="2">
      0.00
      </td>
      <td class="valueR" colspan="2" style="border-right:1px solid #999999;">
      1837.82
      </td>
      <td class="valueR">
      3422
      </td>
      <td class="valueR" colspan="2">
      94
      </td>
      <td class="valueR" colspan="2">
      3516
      </td>
      <td class="value" style="vertical-align: middle;">
      <img src="/i/interface/redDown.gif" alt="" />
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" style="vertical-align: middle;">
      <A href="#"><img src="/i/interface/exp_w.gif" alt="" /></A>
      </td>
      <td class="value">
      <tc-webtag:handle coderId="144400" />
      </td>
      <td class="valueR">
      1062.82
      </td>
      <td class="valueR" colspan="2">
      775.00
      </td>
      <td class="valueR" colspan="2">
      0.00
      </td>
      <td class="valueR" colspan="2" style="border-right:1px solid #999999;">
      1837.82
      </td>
      <td class="valueR">
      3422
      </td>
      <td class="valueR" colspan="2">
      94
      </td>
      <td class="valueR" colspan="2">
      3516
      </td>
      <td class="value" style="vertical-align: middle;">
      <img src="/i/interface/redDown.gif" alt="" />
      </td>
   </tr>
   <% even = !even;%>
</table>

<div class="pagingBox">
&lt;&lt; prev
| <a href="Javascript:next()" class="bcLink">next &gt;&gt;</a>

<br>

View &nbsp;
<input name="nr" size="4" maxlength="4" onkeypress="submitEnter(event)" value="50" type="text">
&nbsp;at a time starting with &nbsp;

<input name="sr" size="4" maxlength="4" onkeypress="submitEnter(event)" value="1" type="text">
<a href="javascript:document.matchListForm.submit();" class="bcLink">&nbsp;[ submit ]</a>

</div>
</td>
        <!-- Center Column Ends -->

        <!-- Right Column Begins -->
        <td width="170">
            <jsp:include page="/public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
        <!-- Right Column Ends -->

        <!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
        <!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>
