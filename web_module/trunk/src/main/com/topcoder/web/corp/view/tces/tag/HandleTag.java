package com.topcoder.web.corp.view.tces.tag;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.corp.common.TCESConstants;

import javax.servlet.jsp.tagext.TagSupport;
import javax.servlet.jsp.JspException;
import java.util.Map;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Aug 11, 2005
 */

public class HandleTag extends TagSupport {
    private long coderId;
    private String link = "";
    private String styleClass = "";
    private boolean algorithm = false;
    private boolean design = false;
    private boolean development = false;
    private boolean component = false;
    private long companyId;
    private long campaignId;
    private long jobId;
    private String db = "";

    public final static String ALGORITHM = "algorithm";
    public final static String DESIGN = "design";
    public final static String DEVELOPMENT = "development";
    public final static String COMPONENT = "component";

    private static final String[] darkStyles =
            {"coderTextOrange", "coderTextBlack", "coderTextGray",
             "coderTextGreen", "coderTextBlue", "coderTextYellow", "coderTextRed"};

    public void setCoderId(long coderId) {
        this.coderId = coderId;
    }

    public void setCompanyId(long companyId) {
        this.companyId = companyId;
    }

    public void setJobId(long jobId) {
        this.jobId = jobId;
    }

    public void setCampaignId(long campaignId) {
        this.campaignId = campaignId;
    }

    public void setCoderId(int coderId) {
        this.coderId = coderId;
    }

    public void setCoderId(String coderId) {
        this.coderId = Long.parseLong(coderId);
    }

    public void setLink(String link) {
        this.link = link;
    }

    public void setStyleClass(String styleClass) {
        this.styleClass = styleClass;
    }

    public void setDb(String db) {
        this.db = db;
    }

    public void setContext(String s) {
        if (s.toLowerCase().trim().equals(ALGORITHM)) algorithm = true;
        if (s.toLowerCase().trim().equals(DESIGN)) design = true;
        if (s.toLowerCase().trim().equals(DEVELOPMENT)) development = true;
        if (s.toLowerCase().trim().equals(COMPONENT)) component = true;
    }

    public int doStartTag() throws JspException {

        try {

            if ("".equals(db)) {
                CachedDataAccess da1 = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
                da1.setExpireTime(24 * 60 * 60 * 1000);
                Request r1 = new Request();
                r1.setContentHandle("company_datasource");
                r1.setProperty("cm", String.valueOf(companyId));
                r1.setProperty("dstid", "2");//transactional datasource
                Map m1 = da1.getData(r1);
                ResultSetContainer rsc1 = (ResultSetContainer) m1.get("company_datasource");
                if (rsc1 == null || rsc1.isEmpty()) {
                    db = DBMS.OLTP_DATASOURCE_NAME;
                } else {
                    db = rsc1.getStringItem(0, "datasource_name");
                }
            }

            //we're assuming here that a coder will only have 1 rating per company
            Request r = new Request();
            r.setContentHandle("tces_coder_all_ratings");
            r.setProperty("mid", String.valueOf(coderId));
            r.setProperty("cm", String.valueOf(companyId));
            CachedDataAccess da = new CachedDataAccess(db);
            Map m = da.getData(r);
            ResultSetContainer rsc = (ResultSetContainer) m.get("tces_coder_all_ratings");

            //check for css override
            boolean bCSSOverride = false;
            if (styleClass != null && !styleClass.equals("")) {
                bCSSOverride = true;
            }

            StringBuffer output = new StringBuffer();
            output.append("<a href=\"");
            if (link.equals("")) {
                StringBuffer buf = new StringBuffer(200);
                buf.append("http://");
                buf.append(ApplicationServer.CORP_SERVER_NAME);
                //todo change this from /tces/ to /tces when we go to jboss
                buf.append("/tces/?task=MemberProfileTask");
                buf.append("&");
                buf.append(TCESConstants.MEMBER_ID_PARAM);
                buf.append("=");
                buf.append(coderId);
                buf.append("&");
                buf.append(TCESConstants.CAMPAIGN_ID_PARAM);
                buf.append("=");
                buf.append(campaignId);
                buf.append("&");
                buf.append(TCESConstants.JOB_ID_PARAM);
                buf.append("=");
                buf.append(jobId);
                link = buf.toString();
            }
            output.append(link);
            output.append("\" class=\"");

            if (bCSSOverride) {
                output.append(styleClass);
            } else {
                int rating = 0;
                if (algorithm) {
                    rating = rsc.getIntItem(0, "algorithm_rating");
                } else if (design) {
                    rating = rsc.getIntItem(0, "design_rating");
                } else if (development) {
                    rating = rsc.getIntItem(0, "development_rating");
                } else if (component) {
                    rating = max(rsc.getIntItem(0, "design_rating"),
                            rsc.getIntItem(0, "development_rating"));
                } else {
                    // special case for admins
                    if (rsc.getIntItem(0, "algorithm_rating") < 0)
                        rating = rsc.getIntItem(0, "algorithm_rating");
                    else
                        rating = max(rsc.getIntItem(0, "algorithm_rating"),
                                rsc.getIntItem(0, "design_rating"),
                                rsc.getIntItem(0, "development_rating"));
                }
                output.append(getRatingCSS(rating));
            }

            output.append("\">");

            output.append(rsc.getStringItem(0, "handle"));

            output.append("</a>");

            pageContext.getOut().print(output.toString());
        } catch (Exception e) {
            throw new JspException(e.getMessage());
        }
        return SKIP_BODY;
    }

    private String getRatingCSS(int rating) {
        if (rating < 0)
            return darkStyles[0];
        else if (rating == 0)
            return darkStyles[1];
        else if (rating > 0 && rating < 900)
            return darkStyles[2];
        else if (rating > 899 && rating < 1200)
            return darkStyles[3];
        else if (rating > 1199 && rating < 1500)
            return darkStyles[4];
        else if (rating > 1499 && rating < 2200)
            return darkStyles[5];
        else if (rating > 2199) return darkStyles[6];
        return "";
    }

    private int max(int a, int b, int c) {
        return max(max(a, b), c);
    }

    private int max(int a, int b) {
        if (a >= b) return a;
        return b;
    }

    /**
     * Because the app server (JBoss) is caching the tag,
     * we have to clear out all the instance variables at the
     * end of execution.
     */
    public int doEndTag() throws JspException {
        coderId = 0;
        link = "";
        styleClass = "";
        algorithm = false;
        design = false;
        development = false;
        component = false;
        companyId = 0;
        campaignId = 0;
        jobId = 0;
        db = "";
        return super.doEndTag();
    }


}
