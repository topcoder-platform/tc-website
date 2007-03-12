<!doctype html public "-//w3c//dtd html 4.0 transitional//en">

<%@ page language="java"%>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<HTML>
<HEAD>
<TITLE>TopCoder - PACTs</TITLE>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css" />
<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
    <jsp:param name="key" value="tc_main" />
</jsp:include>
<script language="JavaScript">
</script>
</HEAD>
<BODY>
<c:set var="assignment_document"
    value="<%= request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT) %>" />
<c:set var="ASSIGNMENT_DOCUMENT_ID"
    value="<%= PactsConstants.ASSIGNMENT_DOCUMENT_ID + "" %>" />

<jsp:include page="../../top.jsp" />
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR>
        <TD WIDTH="170" VALIGN="top"><jsp:include
            page="/includes/global_left.jsp">
            <jsp:param name="node" value="assignment_documents" />
        </jsp:include></TD>
        <td class="assignmentDocumentCell" width="100%" align="center">

        <jsp:include page="../../page_title.jsp">
            <jsp:param name="image" value="pact_s" />
            <jsp:param name="title" value="Assignment Document Details" />
        </jsp:include>

        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
            <TR>
                <TD CLASS="affidavitText" COLSPAN="2" VALIGN="top"
                    WIDTH="100%"><IMG SRC="/i/clear.gif" ALT=""
                    WIDTH="240" HEIGHT="1" BORDER="0" /><BR />


                <center>
    
                    <p><a
                        href="/PactsMemberServlet?module=ViewAssignmentDocumentText&${ASSIGNMENT_DOCUMENT_ID}=${assignment_document.id}">click
                    here for a printer friendly version of the affidavit</a></p>
    
                    <p><iframe  width="90%" height="300" marginWidth="5"
                        src="/tc?module=Static&d1=pacts&d2=client&d3=viewAssignmentDocumentText&${ASSIGNMENT_DOCUMENT_ID}=${assignment_document.id}"></iframe>
                    </p>

                    <table>
                        <tr>
                            <td class="bodyText">
                                <form action="/PactsMemberServlet" method="post">
                                    <input type="hidden" name="<%=PactsConstants.ASSIGNMENT_DOCUMENT_ID%>" value="${assignmentDocumentId}"/>
                                    <input type="hidden" name="module" value="AffirmAssignmentDocument"/> 
                                    <input type="submit" value="affirm affidavit"/>
                                </form>
                            </td>
                            <td>
                                <form action="/reg/?nrg=false"><input
                                    type="submit"
                                    value="Edit Personal Information">"
                                </form>
                            </td>
                        </tr>
                    </table>
                </center>

                </TD>
                <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif"
                    ALT="" WIDTH="10" HEIGHT="1" BORDER="0" /></TD>
            </TR>
        </TABLE>
        </TD>
        <TD WIDTH="170" VALIGN="top"><IMG SRC="/i/clear.gif"
            WIDTH="170" HEIGHT="1" BORDER="0"> <jsp:include
            page="/public_right.jsp" /></TD>
        <!-- Gutter -->
        <TD WIDTH="25"><IMG SRC="/i/clear.gif" WIDTH="25"
            HEIGHT="1" BORDER="0" /></TD>
        <!-- Gutter Ends -->
    </TR>
</TABLE>
<jsp:include page="/foot.jsp" />
</BODY>
</HTML>
