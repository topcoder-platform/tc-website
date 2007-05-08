package com.topcoder.web.csf.view.tag;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.CachedDataAccess;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.util.Map;

public class HandleTag extends TagSupport {
    private static final Logger log = Logger.getLogger(HandleTag.class);
    private long coderId = 0;
    private String cssclass = "coderText";

    public void setCoderId(long coderId) {
        this.coderId = coderId;
    }

    public void setStyleClass(String cssclass) {
        this.cssclass = cssclass;
    }

    public int doStartTag() throws JspException {
        try {

            StringBuffer output = new StringBuffer();
            //lookup ratings from cache
            CachedDataAccess da = new CachedDataAccess(DBMS.CSF_DATASOURCE_NAME);

            Request r = new Request();
            r.setContentHandle("coder_all_ratings");
            r.setProperty("cr", String.valueOf(coderId));

            Map m = da.getData(r);


            ResultSetContainer rsc = (ResultSetContainer) m.get("coder_all_ratings");
            if (rsc.isEmpty()) {
                output.append("UNKNOWN USER");
            } else if (rsc.getItem(0, "coder_id").getResultData() == null) {
                output.append(rsc.getStringItem(0, "handle"));
            } else {
                output.append("<span class=\"");
                if (rsc.getIntItem(0, "algorithm_rating") == -1) {
                    output.append("coderTextOrange");
                } else {
                    output.append(cssclass);
                }
                output.append("\">");
                output.append(rsc.getStringItem(0, "handle"));
                output.append("</span>");
            }
            pageContext.getOut().print(output.toString());
        } catch (Exception e) {
            log.error("on coder id " + coderId);
            throw new JspException(e);
        }
        return SKIP_BODY;
    }

    /**
     * Because the app server (JBoss) is caching the tag,
     * we have to clear out all the instance variables at the
     * end of execution.
     */
    public int doEndTag() throws JspException {
        coderId = 0;
        cssclass = "coderText";
        return super.doEndTag();
    }


}