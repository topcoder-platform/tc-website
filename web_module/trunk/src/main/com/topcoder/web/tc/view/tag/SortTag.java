package com.topcoder.web.tc.view.tag;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.web.common.StringUtils;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

public class SortTag extends TagSupport {

    private int column;

    public void setColumn(int column) {
        this.column = column;
    }

    public int doStartTag() throws JspException {
        String currCol = StringUtils.checkNull(pageContext.getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        String currDir = StringUtils.checkNull(pageContext.getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        //perhaps there should be a bean in the request with default sort directions
        String sortDir = "asc";
        if (!(currCol.equals("") || currDir.equals(""))) {
            if (Integer.parseInt(currCol)==column) {
                if (currDir.equals(sortDir)) sortDir="desc";
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
