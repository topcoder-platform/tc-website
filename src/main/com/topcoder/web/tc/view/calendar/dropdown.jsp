<%
    String currMonth = request.getParameter("currMonth")==null?"":request.getParameter("currMonth");
%>
<form><select name="month" size="1" onchange="window.location='/tc?module=Static&amp;d1=calendar&amp;d2='+this.options[this.selectedIndex].value">

  
   <option value="thisMonth">-------- 2014 --------</option>
   <option value="jan_14"<% if (currMonth.equals("jan_14")) { %> selected<% } %>>January</option>
   <option value="feb_14"<% if (currMonth.equals("feb_14")) { %> selected<% } %>>February</option>
   <option value="mar_14"<% if (currMonth.equals("mar_14")) { %> selected<% } %>>March</option>
   <option value="apr_14"<% if (currMonth.equals("apr_14")) { %> selected<% } %>>April</option>
   <option value="may_14"<% if (currMonth.equals("may_14")) { %> selected<% } %>>May</option>
   <option value="jun_14"<% if (currMonth.equals("jun_14")) { %> selected<% } %>>June</option>
   <option value="jul_14"<% if (currMonth.equals("jul_14")) { %> selected<% } %>>July</option>
   <option value="aug_14"<% if (currMonth.equals("aug_14")) { %> selected<% } %>>August</option>


  
</select></form>
