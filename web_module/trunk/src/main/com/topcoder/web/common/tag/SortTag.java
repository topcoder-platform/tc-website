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

    private int column;

    public void setColumn(int column) {
        this.column = column;
    }

    public int doStartTag() throws JspException {
        String currCol = StringUtils.checkNull(pageContext.getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        String currDir = StringUtils.checkNull(pageContext.getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        SortInfo defaults = (SortInfo)pageContext.getRequest().getAttribute(SortInfo.REQUEST_KEY);
        String sortDir = defaults.getDefault(column);
        if (sortDir==null) sortDir = "asc";

        if (!(currCol.equals("") || currDir.equals(""))) {
            if (Integer.parseInt(currCol)==column) {
                if (currDir.equals("desc")) {
                    sortDir = "asc";
                } else {
                    sortDir = "desc";
                }
            }
        }

        StringBuffer buf = new StringBuffer(100);
        buf.append("&");
        buf.append(DataAccessConstants.SORT_COLUMN);
        buf.append("=");
        buf.append(column);
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

}
