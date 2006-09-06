<%@ page language="java"
import="com.topcoder.dde.util.Constants" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<HTML>
<HEAD><TITLE>Upload</TITLE></HEAD>
    <TABLE WIDTH="100%" HEIGHT="100%">
      <TR>
        <TD class="statText">
          <form name="upload_form" enctype="multipart/form-data" method="POST" action="/tcs">
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="UploadApplicationSpecificationTask">                
            <br/>Upload file: <input type=file name=file1>
            <br/><input type="submit" value="Upload">
            </form>
        </TD>
      </TR>
      <TR>
        <TD class="statText">Uploaded specifications:</TD>
        <TD class="statText">
            <tr>
                <td>Date</td>
                <td>Filename</td>
                <td>Screening results</td>
            </tr>
            <c:forEach items="${old_specs}" var="specItem">
            <tr>
                <td><c:out value="${specItem.uploadDate}"/></td>
                <td><c:out value="${specItem.remoteFilename}"/></td>
                <c:choose>
                    <c:when test="${specItem.screened}">
                        <td>
                            <A href="/tcs?module=ViewUploadResults&<%=Constants.SPECIFICATION_KEY%>=<c:out value="${specItem.specificationId}"/>">
                                <c:choose>
                                    <c:when test="${specItem.passedAutoScreening == 1}">
                                        Passed screening
                                    </c:when>
                                    <c:otherwise>
                                        Failed screening
                                    </c:otherwise>
                                </c:choose>
                            </a>
                        </td>
                    </c:when>
                    <c:otherwise>
                        <td>N/A</td>
                    </c:otherwise>
                </c:choose>
            </tr>
            </c:forEach>
        </TD>
      </TR>
    </TABLE>
</HTML>
