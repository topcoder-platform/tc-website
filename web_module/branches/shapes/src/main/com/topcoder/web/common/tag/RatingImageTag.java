package com.topcoder.web.common.tag;

import javax.servlet.jsp.tagext.TagSupport;
import javax.servlet.jsp.JspException;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.resultSet.*;

import java.util.Map;

public class RatingImageTag extends TagSupport {
    private int cid;
    private String link = "";
    private String cssclass = "";
    private String imagecssclass = "";
    private String bg;

    private static final String[] styles =
           {"coderTextOrange", "coderTextWhite", "coderTextGray", "coderTextGreen", "coderTextBlue", "coderTextYellow", "coderTextRed"};

    private static final String[] colors =
           {"o", "w", "g", "n", "b", "y", "r"};

    public void setCid(int cid) {
        this.cid = cid;
    }

    public void setBg(String bg) {
        this.bg = bg;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public void setCSSClass(String cssclass) {
        this.cssclass = cssclass;
    }

    public void setImageCSSClass(String imagecssclass) {
        this.imagecssclass = imagecssclass;
    }

    public int doStartTag() throws JspException {

        try {
            //lookup ratings from cache
            CachedDataAccess da = new CachedDataAccess(DBMS.DW_DATASOURCE_NAME);
            da.setExpireTime(24 * 60 * 60 * 1000);

            Request r = new Request();
            r.setContentHandle("coder_all_ratings");
            r.setProperty("cr", String.valueOf(cid));

            Map m = da.getData(r);

            ResultSetContainer rsc = (ResultSetContainer)m.get("coder_all_ratings");

            //check if link is in place, if so use a, otherwise use span
            boolean bLink = false;
            if(link != null && !link.equals("")) {
                bLink = true;
            }

            //check for css override
            boolean bCSSOverride = false;
            if(cssclass != null && !cssclass.equals("")) {
                bCSSOverride = true;
            }

            //check for css image override
            boolean bCSSImageOverride = false;
            if(imagecssclass != null && !imagecssclass.equals("")) {
                bCSSImageOverride = true;
            }

            StringBuffer output = new StringBuffer();
            output.append("<");

            if(bLink) {
                output.append("a href=\"");
                output.append(link);
                output.append("\" class=\"");
            } else {
                output.append("span class=\"");
            }

            if(bCSSOverride) {
                output.append(cssclass);
            } else {
                output.append(getRatingCSS(max(rsc.getIntItem(0, "algorithm_rating"),
                                                    rsc.getIntItem(0, "design_rating"),
                                                    rsc.getIntItem(0, "development_rating"))));
            }

            output.append("\">");

            output.append("<img src=\"/i/r/");

            output.append(getColorString(rsc.getIntItem(0, "algorithm_rating")));
            output.append(getColorString(rsc.getIntItem(0, "design_rating")));
            output.append(getColorString(rsc.getIntItem(0, "development_rating")));

            output.append(bg);
            output.append(".gif");

            output.append("\" class=\"");

            if(bCSSImageOverride) {
                output.append(imagecssclass);
            } else {
                output.append("rPic");
            }

            output.append("\"/>");
            output.append(rsc.getStringItem(0, "handle"));

            if(bLink) {
                output.append("</a>");
            } else {
                output.append("</span>");
            }

            pageContext.getOut().print(output.toString());
        } catch (Exception e) {
            throw new JspException(e.getMessage());
        }
        return SKIP_BODY;
    }

    private String getColorString(int rating) {
        if (rating < 0) return colors[0];
        else if (rating == 0) return colors[1];
        else if (rating > 0 && rating < 900) return colors[2];
        else if (rating > 899 && rating < 1200) return colors[3];
        else if (rating > 1199 && rating < 1500) return colors[4];
        else if (rating > 1499 && rating < 2200) return colors[5];
        else if (rating > 2199) return colors[6];
        return "";
    }

    private String getRatingCSS(int rating) {
        if (rating < 0) return styles[0];
        else if (rating == 0) return styles[1];
        else if (rating > 0 && rating < 900) return styles[2];
        else if (rating > 899 && rating < 1200) return styles[3];
        else if (rating > 1199 && rating < 1500) return styles[4];
        else if (rating > 1499 && rating < 2200) return styles[5];
        else if (rating > 2199) return styles[6];
        return "";
    }

    private int max(int a, int b, int c) {
        return max(max(a,b),c);
    }

    private int max(int a, int b) {
        if (a>=b) return a;
        return b;
    }
}
