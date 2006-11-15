<%@page contentType="text/html"%>
<html>
    <head><title>JSP Page</title></head>
    <body>

        <%-- <jsp:useBean id="beanInstanceName" scope="session" class="beanPackage.BeanClassName" /> --%>
        <%-- <jsp:getProperty name="beanInstanceName"  property="propertyName" /> --%>
        <form name=frmUpload method=post enctype="multipart/form-data" action="/tc">
        <input type="hidden" name="module" value="DOCConversionProcessing"/>
        <input type="file" name="file"/>
        <input type="submit"/>
        </form>
    </body>
</html>
