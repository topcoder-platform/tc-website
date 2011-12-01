<%
    String currMonth = request.getParameter("currMonth")==null?"":request.getParameter("currMonth");
%>
<form><select name="month" size="1" onchange="window.location='/tc?module=Static&amp;d1=calendar&amp;d2='+this.options[this.selectedIndex].value">

  
   <option value="thisMonth">-------- 2011 --------</option>
   <option value="dec_11"<% if (currMonth.equals("dec_11")) { %> selected<% } %>>December</option>
   <option value="thisMonth">-------- 2012 --------</option>
   <option value="jan_11"<% if (currMonth.equals("jan_12")) { %> selected<% } %>>January</option>
   <option value="feb_11"<% if (currMonth.equals("feb_12")) { %> selected<% } %>>February</option>
   <option value="mar_11"<% if (currMonth.equals("mar_12")) { %> selected<% } %>>March</option>
   <option value="apr_11"<% if (currMonth.equals("apr_12")) { %> selected<% } %>>April</option>
   <option value="may_11"<% if (currMonth.equals("may_12")) { %> selected<% } %>>May</option>
   <option value="jun_11"<% if (currMonth.equals("jun_12")) { %> selected<% } %>>June</option>
  
</select></form>
