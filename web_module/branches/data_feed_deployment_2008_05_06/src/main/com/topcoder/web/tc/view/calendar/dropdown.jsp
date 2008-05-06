<%
    String currMonth = request.getParameter("currMonth")==null?"":request.getParameter("currMonth");
%>
<form><select name="month" size="1" onchange="window.location='/tc?module=Static&amp;d1=calendar&amp;d2='+this.options[this.selectedIndex].value">

   <option value="thisMonth">-------- 2007 --------</option>
   <option value="aug_07"<% if (currMonth.equals("aug_07")) { %> selected<% } %>>August</option>
   <option value="sep_07"<% if (currMonth.equals("sep_07")) { %> selected<% } %>>September</option>
   <option value="oct_07"<% if (currMonth.equals("oct_07")) { %> selected<% } %>>October</option>
   <option value="nov_07"<% if (currMonth.equals("nov_07")) { %> selected<% } %>>November</option>
   <option value="dec_07"<% if (currMonth.equals("dec_07")) { %> selected<% } %>>December</option>
   <option value="thisMonth">-------- 2008 --------</option>
   <option value="jan_08"<% if (currMonth.equals("jan_08")) { %> selected<% } %>>January</option>
   <option value="feb_08"<% if (currMonth.equals("feb_08")) { %> selected<% } %>>February</option>
   <option value="mar_08"<% if (currMonth.equals("mar_08")) { %> selected<% } %>>March</option>
   <option value="apr_08"<% if (currMonth.equals("apr_08")) { %> selected<% } %>>April</option>
   <option value="may_08"<% if (currMonth.equals("may_08")) { %> selected<% } %>>May</option>
   <option value="jun_08"<% if (currMonth.equals("jun_08")) { %> selected<% } %>>June</option>
   <option value="jul_08"<% if (currMonth.equals("jul_08")) { %> selected<% } %>>July</option>
  
</select></form>
