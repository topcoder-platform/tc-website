<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<html>
    <head><title>JSP Page</title></head>
    <body>

        <%-- <jsp:useBean id="beanInstanceName" scope="session" class="beanPackage.BeanClassName" /> --%>
        <%-- <jsp:getProperty name="beanInstanceName"  property="propertyName" /> --%>
        <form name=frmUpload method=post enctype="multipart/form-data" action="/tc">
        <input type="hidden" name="module" value="DOCConversionProcessing"/>
        <input type="upload" name="file"/>
        </form>
    </body>
</html>
