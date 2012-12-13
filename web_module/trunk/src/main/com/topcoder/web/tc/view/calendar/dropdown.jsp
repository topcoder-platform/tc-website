<%
    String currMonth = request.getParameter("currMonth")==null?"":request.getParameter("currMonth");
%>
<form><select name="month" size="1" onchange="window.location='/tc?module=Static&amp;d1=calendar&amp;d2='+this.options[this.selectedIndex].value">

  
   <option value="thisMonth">-------- 2012 --------</option>
   <option value="dec_12"<% if (currMonth.equals("dec_12")) { %> selected<% } %>>December</option>
   <option value="thisMonth">-------- 2013 --------</option>
   <option value="jan_13"<% if (currMonth.equals("jan_13")) { %> selected<% } %>>January</option>
   <option value="feb_13"<% if (currMonth.equals("feb_13")) { %> selected<% } %>>February</option>
   <option value="mar_13"<% if (currMonth.equals("mar_13")) { %> selected<% } %>>March</option>
   <option value="apr_13"<% if (currMonth.equals("apr_13")) { %> selected<% } %>>April</option>
   <option value="may_13"<% if (currMonth.equals("may_13")) { %> selected<% } %>>May</option>
   <option value="jun_13"<% if (currMonth.equals("jun_13")) { %> selected<% } %>>June</option>

  
</select></form>
