<%
    String currMonth = request.getParameter("currMonth")==null?"":request.getParameter("currMonth");
%>
<form><select name="month" size="1" onchange="window.location='/tc?module=Static&d1=calendar&d2='+this.options[this.selectedIndex].value">
   <option value="thisMonth">-------- 2005 --------</option>
   <option value="jun_05"<% if (currMonth.equals("jun_05")) { %> selected<% } %>>June</option>
   <option value="jul_05"<% if (currMonth.equals("jul_05")) { %> selected<% } %>>July</option>
   <option value="aug_05"<% if (currMonth.equals("aug_05")) { %> selected<% } %>>August</option>
   <option value="sep_05"<% if (currMonth.equals("sep_05")) { %> selected<% } %>>September</option>
   <option value="oct_05"<% if (currMonth.equals("oct_05")) { %> selected<% } %>>October</option>
   <option value="nov_05"<% if (currMonth.equals("nov_05")) { %> selected<% } %>>November</option>
   <option value="dec_05"<% if (currMonth.equals("dec_05")) { %> selected<% } %>>December</option>
   <option value="thisMonth">-------- 2006 --------</option>
   <option value="jan_06"<% if (currMonth.equals("jan_06")) { %> selected<% } %>>January</option>
   <option value="feb_06"<% if (currMonth.equals("feb_06")) { %> selected<% } %>>February</option>
   <option value="mar_06"<% if (currMonth.equals("mar_06")) { %> selected<% } %>>March</option>
   <option value="apr_06"<% if (currMonth.equals("apr_06")) { %> selected<% } %>>April</option>
   <option value="may_06"<% if (currMonth.equals("may_06")) { %> selected<% } %>>May</option>

</select></form>
