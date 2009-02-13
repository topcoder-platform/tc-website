<%
    String currMonth = request.getParameter("currMonth")==null?"":request.getParameter("currMonth");
%>
<form><select name="month" size="1" onchange="window.location='/tc?module=Static&d1=calendar&d2='+this.options[this.selectedIndex].value">

   <option value="thisMonth">-------- 2007 --------</option>
   <option value="apr_07"<% if (currMonth.equals("apr_07")) { %> selected<% } %>>April</option>
   <option value="may_07"<% if (currMonth.equals("may_07")) { %> selected<% } %>>May</option>
   <option value="jun_07"<% if (currMonth.equals("jun_07")) { %> selected<% } %>>June</option>
   <option value="jul_07"<% if (currMonth.equals("jul_07")) { %> selected<% } %>>July</option>
   <option value="aug_07"<% if (currMonth.equals("aug_07")) { %> selected<% } %>>August</option>
   <option value="sep_07"<% if (currMonth.equals("sep_07")) { %> selected<% } %>>September</option>
   <option value="oct_07"<% if (currMonth.equals("oct_07")) { %> selected<% } %>>October</option>
   <option value="nov_07"<% if (currMonth.equals("nov_07")) { %> selected<% } %>>November</option>
   <option value="dec_07"<% if (currMonth.equals("dec_07")) { %> selected<% } %>>December</option>
   <option value="jan_08"<% if (currMonth.equals("jan_08")) { %> selected<% } %>>January</option>
   <option value="feb_08"<% if (currMonth.equals("feb_08")) { %> selected<% } %>>February</option>
   <option value="mar_08"<% if (currMonth.equals("mar_08")) { %> selected<% } %>>March</option>
  
</select></form>
