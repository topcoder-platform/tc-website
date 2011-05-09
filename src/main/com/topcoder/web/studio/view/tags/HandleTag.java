/*
 * Copyright (C) 2008-2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.view.tags;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.CachedDataAccess;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.util.Map;
import java.net.URLEncoder;

/**
 * <p>A custom tag to be used for rendering the handles for the coders identified by the IDs passed to this tag.</p>
 *
 * <p>
 * Version 1.2 (Re-platforming Studio Release 4 Assembly 1.0) Change notes:
 *   <ol>
 *     <li>The generated link points to MemberProfile controller in TC appliaction.</li>
 *   </ol>
 * </p>
 *
 * @author dok, TCSDEVELOPER
 * @version 1.2
 * @since TopCoder Studio Website 1.0
 */
public class HandleTag extends TagSupport {

    /**
     * <p>A <code>Logger</code> to be used for logging various events encountered while executing the tag.</p>
     */
    private static final Logger log = Logger.getLogger(HandleTag.class);

    /**
     * <p>A <code>long</code> providing the ID of a coder to render the handle for.</p>
     */
    private long coderId = 0;

    /**
     * <p>A <code>String</code> providing optional CSS style to be used for rendering the coder handle.</p>
     */
    private String cssclass = "coderText";

    /**
     * <p>Sets the ID of a coder to render the handle for.</p>
     *
     * @param coderId a <code>long</code> providing the ID of a coder to render the handle for.
     */
    public void setCoderId(long coderId) {
        this.coderId = coderId;
    }

    /**
     * <p>Sets the CSS style class to be used for rendering the coder handle.</p>
     *
     * @param cssclass a <code>String</code> providing optional CSS style to be used for rendering the coder handle.
     */
    public void setStyleClass(String cssclass) {
        this.cssclass = cssclass;
    }

    /**
     * <p>Processes the <code>Start Tag</code> event.</p>
     *
     * <p>Gets the details for the requested coder from the backend datastore and generates <code>HTML</code> markup to
     * render the coder handle. If code is not found then plain <code>UNKNOWN USER</code> text is rendered; if coder is
     * not registered to <code>Studio</code> website then plain coder handle is rendered; otherwise a coder handle is
     * rendered as a hyperlink pointing to <code>Member Profile</code> page for the specified coder.</p>
     *
     * @return #SKIP_BODY always.
     * @throws JspException if an unexpected error occurs.
     */
    public int doStartTag() throws JspException {
        try {

            StringBuilder output = new StringBuilder();
            //lookup ratings from cache
            CachedDataAccess da = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);

            Request r = new Request();
            r.setContentHandle("coder_all_ratings");
            r.setProperty("cr", String.valueOf(this.coderId));

            Map m = da.getData(r);

            ResultSetContainer rsc = (ResultSetContainer) m.get("coder_all_ratings");
            if (rsc.isEmpty()) {
                output.append("UNKNOWN USER");
            } else if (rsc.getItem(0, "coder_id").getResultData() == null) {
                output.append(rsc.getStringItem(0, "handle"));
            } else {
                String handle = rsc.getStringItem(0, "handle");
                output.append("<a class=\"");
                if (rsc.getIntItem(0, "algorithm_rating") == -1) {
                    output.append("coderTextOrange");
                } else {
                    output.append(this.cssclass);
                }
                output.append("\" href=\"http://").append(ApplicationServer.SERVER_NAME);
                output.append("/tc?module=MemberProfile&cr=");
                output.append(this.coderId);
                output.append("\">");
                output.append(handle);
                output.append("</a>");
            }
            this.pageContext.getOut().print(output.toString());
        } catch (Exception e) {
            log.error("on coder id " + this.coderId);
            throw new JspException(e);
        }
        return SKIP_BODY;
    }

    /**
     * <p>Handles the <code>End Tag</code> event.</p>
     *
     * <p>Because the app server (JBoss) is caching the tags, we have to clear out all the instance variables at the
     * end of execution.</p>
     */
    public int doEndTag() throws JspException {
        this.coderId = 0;
        this.cssclass = "coderText";
        return super.doEndTag();
    }
}