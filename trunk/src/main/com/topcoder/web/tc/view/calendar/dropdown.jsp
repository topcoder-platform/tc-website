<%
    String currMonth = request.getParameter("currMonth")==null?"":request.getParameter("currMonth");
%>
<form><select name="month" size="1" onchange="window.location='/tc?module=Static&amp;d1=calendar&amp;d2='+this.options[this.selectedIndex].value">

  
   <option value="thisMonth">-------- 2011 --------</option>
   <option value="jan_11"<% if (currMonth.equals("jan_11")) { %> selected<% } %>>January</option>
   <option value="feb_11"<% if (currMonth.equals("feb_11")) { %> selected<% } %>>February</option>
   <option value="mar_11"<% if (currMonth.equals("mar_11")) { %> selected<% } %>>March</option>
   <option value="apr_11"<% if (currMonth.equals("apr_11")) { %> selected<% } %>>April</option>
   <option value="may_11"<% if (currMonth.equals("may_11")) { %> selected<% } %>>May</option>
   <option value="jun_11"<% if (currMonth.equals("jun_11")) { %> selected<% } %>>June</option>
   <option value="jul_11"<% if (currMonth.equals("jul_11")) { %> selected<% } %>>July</option>
   <option value="aug_11"<% if (currMonth.equals("aug_11")) { %> selected<% } %>>August</option>
   <option value="sep_11"<% if (currMonth.equals("sep_11")) { %> selected<% } %>>September</option>
   <option value="oct_11"<% if (currMonth.equals("oct_11")) { %> selected<% } %>>October</option>
   <option value="nov_11"<% if (currMonth.equals("nov_11")) { %> selected<% } %>>November</option>
   <option value="dec_11"<% if (currMonth.equals("dec_11")) { %> selected<% } %>>December</option>
  
</select></form>
