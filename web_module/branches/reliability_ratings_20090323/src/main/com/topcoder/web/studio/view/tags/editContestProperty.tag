<%-- Renders the text area for editing the contest proeprty of specified name.
     The title is used as label for the text area. --%>
<%@ tag body-content="empty" %>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%@ attribute name="title" required="true" type="java.lang.String" %>
<%@ attribute name="name" required="true" type="java.lang.String" %>

<tr>
    <td colspan="2">
        <p>
            <tc-webtag:errorIterator id="err" name="${name}">
                <span class="bigRed">${err}<br/></span>
            </tc-webtag:errorIterator>
            <strong>${title}</strong><span id="defaultSpan_${name}"></span>:<br/><br/>
            <tc-webtag:textArea id="${name}" name="${name}" rows="2" cols="80" styleClass="resizable"/>
        </p>
    </td>
</tr>
