
<html>

<head>

<title>Register for membership in TopCoder</title>

<jsp:include page="../script.jsp" />

</head>

<body>

  <jsp:include page="../top.jsp" >
    <jsp:param name="location" value="competition"/>
  </jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
            <jsp:include page="left.jsp" />
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1"></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="statTextBig" width="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br>
            <jsp:include page="../body_top.jsp" >  
                <jsp:param name="image" value="registration"/>  
                <jsp:param name="image1" value="steelblue"/>  
                <jsp:param name="title" value="Confirmation"/>  
            </jsp:include>
            
            <table border="0" cellspacing="0" cellpadding="10" bgcolor="#001B35" width="100%">
                <tr>
                    <td class="statText" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br>

                        <jsp:include page="confirm_center.jsp" />
                    
                    </td>
                </tr>
            </table>
            
            <p><br></p>
            
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
      <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"></td>
<!-- Right Column Ends -->

<!-- Gutter -->
      <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
