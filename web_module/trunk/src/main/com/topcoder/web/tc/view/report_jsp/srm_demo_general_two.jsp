<jsp:include page="css.jsp" />
<jsp:include page="../script.jsp" />
<html>
  <head>
    <script language="JavaScript">
  <!--
    function goTo(selection){
      sel = selection.options[selection.selectedIndex].value;
      if (sel && sel != '#'){
        window.location=sel;
      }
    }
  // -->
  </script> 
    <title>TopCoder SRM Reports</title>
  </head>
  <body>
<table>
  <tr valign="top">
    <td width="10%"><jsp:include page="srm_nav.jsp" /></td>
    <td>
	  <table>
        <tr>
		  <td colspan=2><jsp:include page="srm_info.jsp" /></td>
		</tr>
        <tr>
          <td colspan=2><jsp:include page="srm_chooser.jsp" ><jsp:param name="link" value="srm_demo_general_two"/></jsp:include></td>
        </tr>
		<tr valign="top">
          <td>&nbsp;</td>
          <td><jsp:include page="srm_demo_time_online.jsp" /></td>
	    </tr>
        <tr valign="top">
          <td>&nbsp;</td>
          <td><jsp:include page="srm_demo_logged_in.jsp" /></td>
	    </tr>


      </table>
    </td>
  </tr>
</table>
 



  </body>
</html>
