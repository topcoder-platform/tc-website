<%
    String currMonth = request.getParameter("currMonth")==null?"":request.getParameter("currMonth");
%>
<form><select name="month" size="1" onchange="window.location='/tc?module=Static&amp;d1=calendar&amp;d2='+this.options[this.selectedIndex].value">

  
   <option value="thisMonth">-------- 2012 --------</option>
   <option value="may_12"<% if (currMonth.equals("may_12")) { %> selected<% } %>>May</option>
   <option value="jun_12"<% if (currMonth.equals("jun_12")) { %> selected<% } %>>June</option>
   <option value="jul_12"<% if (currMonth.equals("jul_12")) { %> selected<% } %>>July</option>
   <option value="aug_12"<% if (currMonth.equals("aug_12")) { %> selected<% } %>>August</option>
   <option value="sep_12"<% if (currMonth.equals("sep_12")) { %> selected<% } %>>September</option>
   <option value="oct_12"<% if (currMonth.equals("oct_12")) { %> selected<% } %>>October</option>
   <option value="nov_12"<% if (currMonth.equals("nov_12")) { %> selected<% } %>>November</option>
   <option value="dec_12"<% if (currMonth.equals("dec_12")) { %> selected<% } %>>December</option>

  
</select></form>
