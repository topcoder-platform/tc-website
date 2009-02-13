<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>TopCoder Statistics</TITLE>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="baseHRef.jsp" />   
<jsp:include page="../script.jsp" />
</HEAD>
<BODY>
   <jsp:include page="../top.jsp" />
   <table WIDTH="100%" border="0" CELLPADDING="0" CELLSPACING="0">
     <tr>
       <td WIDTH="180" VALIGN="top">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="m_competitions"/>
         </jsp:include>
       </TD>
<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Recent Handle Color Changes"/>
</jsp:include>

<strong>
<A href="" class="bcLink">All changes</A>
<br><A href="" class="coderTextRed">New reds</A>
<br><A href="" class="coderTextYellow">New yellows</A>
<br><A href="" class="coderTextBlue">New blues</A>
<br><A href="" class="coderTextGreen">New greens</A>
<br><A href="" class="coderTextGray">New grays</A>
</strong>

<br><br>
<table cellpadding="0" cellspacing="0" class="stat" width="100%">
<tbody>
   <tr>
      <td class="title" colspan="4">
      Recent Handle Color Changes
      </td>
   </tr>
   <tr>
      <td class="header">
      <A href="">Handle</A>
      </td>
      <td class="header">
      <A href="">Event</A>
      </td>
      <td class="headerC">
      <A href="">Old Rating</A>
      </td>
      <td class="headerC">
      <A href="">New Rating</A>
      </td>
   </tr>
<% boolean even = true; %>
<% even = !even; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <tc-webtag:handle coderId="7504863" context="algorithm"/>
      </td>
      <td class="value">
      <A href="/stat?c=coder_room_stats&cr=7504863&rd=9995&rm=249379">SRM 315</A>
      </td>
      <td class="valueBlue">
      1417
      </td>
      <td class="valueYellow">
      1525
      </td>
   </tr>
<% even = !even; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <tc-webtag:handle coderId="7504863" context="algorithm"/>
      </td>
      <td class="value">
      <A href="/stat?c=coder_room_stats&cr=7504863&rd=9995&rm=249379">SRM 315</A>
      </td>
      <td class="valueBlue">
      1417
      </td>
      <td class="valueYellow">
      1525
      </td>
   </tr>
<% even = !even; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <tc-webtag:handle coderId="7504863" context="algorithm"/>
      </td>
      <td class="value">
      <A href="/stat?c=coder_room_stats&cr=7504863&rd=9995&rm=249379">SRM 315</A>
      </td>
      <td class="valueBlue">
      1417
      </td>
      <td class="valueYellow">
      1525
      </td>
   </tr>
<% even = !even; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <tc-webtag:handle coderId="7504863" context="algorithm"/>
      </td>
      <td class="value">
      <A href="/stat?c=coder_room_stats&cr=7504863&rd=9995&rm=249379">SRM 315</A>
      </td>
      <td class="valueGreen">
      1417
      </td>
      <td class="valueYellow">
      1525
      </td>
   </tr>
<% even = !even; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <tc-webtag:handle coderId="7504863" context="algorithm"/>
      </td>
      <td class="value">
      <A href="/stat?c=coder_room_stats&cr=7504863&rd=9995&rm=249379">SRM 315</A>
      </td>
      <td class="valueBlue">
      1417
      </td>
      <td class="valueYellow">
      1525
      </td>
   </tr>
<% even = !even; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <tc-webtag:handle coderId="7504863" context="algorithm"/>
      </td>
      <td class="value">
      <A href="/stat?c=coder_room_stats&cr=7504863&rd=9995&rm=249379">SRM 315</A>
      </td>
      <td class="valueBlue">
      <span class="coderTextBlue">1417</span
      </td>
      <td class="valueYellow">
      <span class="coderTextYellow">1525</span
      </td>
   </tr>
<% even = !even; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <tc-webtag:handle coderId="7504863" context="algorithm"/>
      </td>
      <td class="value">
      <A href="/stat?c=coder_room_stats&cr=7504863&rd=9995&rm=249379">SRM 315</A>
      </td>
      <td class="valueBlue">
      <span class="coderTextBlue">1417</span
      </td>
      <td class="valueYellow">
      <span class="coderTextYellow">1525</span
      </td>
   </tr>
<% even = !even; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <tc-webtag:handle coderId="7504863" context="algorithm"/>
      </td>
      <td class="value">
      <A href="/stat?c=coder_room_stats&cr=7504863&rd=9995&rm=249379">SRM 315</A>
      </td>
      <td class="valueBlue">
      <span class="coderTextBlue">1417</span
      </td>
      <td class="valueYellow">
      <span class="coderTextYellow">1525</span
      </td>
   </tr>
<% even = !even; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <tc-webtag:handle coderId="7504863" context="algorithm"/>
      </td>
      <td class="value">
      <A href="/stat?c=coder_room_stats&cr=7504863&rd=9995&rm=249379">SRM 315</A>
      </td>
      <td class="valueBlue">
      <span class="coderTextBlue">1417</span
      </td>
      <td class="valueYellow">
      <span class="coderTextYellow">1525</span
      </td>
   </tr>
<% even = !even; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <tc-webtag:handle coderId="7504863" context="algorithm"/>
      </td>
      <td class="value">
      <A href="/stat?c=coder_room_stats&cr=7504863&rd=9995&rm=249379">SRM 315</A>
      </td>
      <td class="valueBlue">
      <span class="coderTextBlue">1417</span
      </td>
      <td class="valueYellow">
      <span class="coderTextYellow">1525</span
      </td>
   </tr>
<% even = !even; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <tc-webtag:handle coderId="7504863" context="algorithm"/>
      </td>
      <td class="value">
      <A href="/stat?c=coder_room_stats&cr=7504863&rd=9995&rm=249379">SRM 315</A>
      </td>
      <td class="valueBlue">
      <span class="coderTextBlue">1417</span
      </td>
      <td class="valueYellow">
      <span class="coderTextYellow">1525</span
      </td>
   </tr>
<% even = !even; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <tc-webtag:handle coderId="7504863" context="algorithm"/>
      </td>
      <td class="value">
      <A href="/stat?c=coder_room_stats&cr=7504863&rd=9995&rm=249379">SRM 315</A>
      </td>
      <td class="valueBlue">
      <span class="coderTextBlue">1417</span
      </td>
      <td class="valueYellow">
      <span class="coderTextYellow">1525</span
      </td>
   </tr>
<% even = !even; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <tc-webtag:handle coderId="7504863" context="algorithm"/>
      </td>
      <td class="value">
      <A href="/stat?c=coder_room_stats&cr=7504863&rd=9995&rm=249379">SRM 315</A>
      </td>
      <td class="valueBlue">
      <span class="coderTextBlue">1417</span
      </td>
      <td class="valueYellow">
      <span class="coderTextYellow">1525</span
      </td>
   </tr>
</tbody>   
</table>
 

</TD>
       <td WIDTH="180" VALIGN="top">
         <jsp:include page="../public_right.jsp" >
             <jsp:param name="level1" value="profile"/>
         </jsp:include>
       </TD>
    <!-- Gutter -->
    <td WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" border="0"/></TD>
    <!-- Gutter Ends -->
     </tr>
   </TABLE>
   <jsp:include page="../foot.jsp" />
 </BODY>
</HTML>