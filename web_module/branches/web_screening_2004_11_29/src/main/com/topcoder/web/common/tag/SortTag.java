package com.topcoder.web.common.tag;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.SortInfo;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

public class SortTag extends TagSupport {

    private static Logger log = Logger.getLogger(SortTag.class);

    private int column = -1;
    private int ascColumn = -1;
    private int descColumn = -1;

    public void setColumn(int column) {
        this.column = column;
    }

    public void setAscColumn(int ascColumn) {
        this.ascColumn = ascColumn;
    }

    public void setDescColumn(int descColumn) {
        this.descColumn = descColumn;
    }

    public int doStartTag() throws JspException {
        String currCol = StringUtils.checkNull(pageContext.getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        String currDir = StringUtils.checkNull(pageContext.getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        SortInfo defaults = (SortInfo)pageContext.getRequest().getAttribute(SortInfo.REQUEST_KEY);
        String sortDir = defaults.getDefault(column);
        if (sortDir==null) sortDir = "asc";

        int finalColumn = column;

        if (!(currCol.equals("") || currDir.equals(""))) {
            int inputCol = Integer.parseInt(currCol);
            if (inputCol==column) {
                if (currDir.equals("desc")) {
                    if (ascColumn >- 1) finalColumn = ascColumn;
                    sortDir = "asc";
                } else {
                    if (descColumn >- 1) finalColumn = descColumn;
                    sortDir = "desc";
                }
            } else if (inputCol == ascColumn) {
                finalColumn = descColumn;
                sortDir = "desc";
            } else if (inputCol == descColumn) {
                finalColumn = ascColumn;
                sortDir = "asc";
            }
        }

        StringBuffer buf = new StringBuffer(100);
        buf.append("&");
        buf.append(DataAccessConstants.SORT_COLUMN);
        buf.append("=");
        buf.append(finalColumn);
        buf.append("&");
        buf.append(DataAccessConstants.SORT_DIRECTION);
        buf.append("=");
        buf.append(sortDir);

        try {
            pageContext.getOut().print(buf.toString());
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }
        return SKIP_BODY;
    }

    /**
     * Just in case the app server is caching tag (jboss!!!)
     * we have to clear out all the instance variables at the
     * end of execution
     */
    public int doEndTag() throws JspException {
        this.column = -1;
        this.ascColumn = -1;
        this.descColumn = -1;
        return super.doEndTag();
    }

}
