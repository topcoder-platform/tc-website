package com.topcoder.web.common.tag;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.util.Map;

public class HandleTag extends TagSupport {
    private int coderId;
    private String link = "";
    private String cssclass = "";
    private boolean darkBG = true;
    private boolean alogrithm = false;
    private boolean design = false;
    private boolean development = false;

    public final static String DEFAULT_LINK = "/stat?c=member_profile&cr=";
    public final static String ALGORITHM = "algorithm";
    public final static String DESIGN = "design";
    public final static String DEVELOPMENT = "development";

    private static final String[] lightStyles =
            {"coderTextOrange", "coderTextBlack", "coderTextGray",
             "coderTextGreen", "coderTextBlue", "coderTextYellow", "coderTextRed"};

    private static final String[] darkStyles =
            {"coderTextOrange", "coderTextWhite", "coderTextGray",
             "coderTextGreen", "coderTextBlue", "coderTextYellow", "coderTextRed"};

    public void setCoderId(int coderId) {
        this.coderId = coderId;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public void setClass(String cssclass) {
        this.cssclass = cssclass;
    }

    public void setDarkBG(String s) {
        this.darkBG = (s.toLowerCase().trim().equals("true"));
    }

    public void setContext(String s) {
        if (s.toLowerCase().trim().equals(ALGORITHM)) alogrithm = true;
        if (s.toLowerCase().trim().equals(DESIGN)) design = true;
        if (s.toLowerCase().trim().equals(DEVELOPMENT)) development = true;
    }

    public int doStartTag() throws JspException {

        try {
            //lookup ratings from cache
            CachedDataAccess da = new CachedDataAccess(DBMS.DW_DATASOURCE_NAME);
            da.setExpireTime(24 * 60 * 60 * 1000);

            Request r = new Request();
            r.setContentHandle("coder_all_ratings");
            r.setProperty("cr", String.valueOf(coderId));

            Map m = da.getData(r);

            ResultSetContainer rsc = (ResultSetContainer) m.get("coder_all_ratings");

            //check for css override
            boolean bCSSOverride = false;
            if (cssclass != null && !cssclass.equals("")) {
                bCSSOverride = true;
            }

            StringBuffer output = new StringBuffer();
            output.append("<");

            output.append("a href=\"");
            if (link.equals(""))
                link = DEFAULT_LINK + coderId;
            output.append(link);
            output.append("\" class=\"");

            if (bCSSOverride) {
                output.append(cssclass);
            } else {
                int rating = 0;
                if (alogrithm)
                    rating = rsc.getIntItem(0, "algorithm_rating");
                else if (design)
                    rating = rsc.getIntItem(0, "design_rating");
                else if (development)
                    rating = rsc.getIntItem(0, "development_rating");
                else
                    rating = max(rsc.getIntItem(0, "algorithm_rating"),
                            rsc.getIntItem(0, "design_rating"),
                            rsc.getIntItem(0, "development_rating"));
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
            return darkBG ? lightStyles[0] : darkStyles[0];
        else if (rating == 0)
            return darkBG ? lightStyles[1] : darkStyles[1];
        else if (rating > 0 && rating < 900)
            return darkBG ? lightStyles[2] : darkStyles[2];
        else if (rating > 899 && rating < 1200)
            return darkBG ? lightStyles[3] : darkStyles[3];
        else if (rating > 1199 && rating < 1500)
            return darkBG ? lightStyles[4] : darkStyles[4];
        else if (rating > 1499 && rating < 2200)
            return darkBG ? lightStyles[5] : darkStyles[5];
        else if (rating > 2199) return darkBG ? lightStyles[6] : darkStyles[6];
        return "";
    }

    private int max(int a, int b, int c) {
        return max(max(a, b), c);
    }

    private int max(int a, int b) {
        if (a >= b) return a;
        return b;
    }
}
