package com.topcoder.web.common.tag;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.shared.dataAccess.DataAccessConstants;

import javax.servlet.jsp.JspException;
import java.io.IOException;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: May 26, 2005
 */
public class SortInputTag extends SortTag {

    public int doStartTag() throws JspException {
        String currCol = StringUtils.checkNull(pageContext.getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        String currDir = StringUtils.checkNull(pageContext.getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        SortInfo defaults = (SortInfo) pageContext.getRequest().getAttribute(SortInfo.REQUEST_KEY);
        String sortDir = defaults.getDefault(column);
        if (sortDir == null) sortDir = "asc";

        int finalColumn = column;

        if (!(currCol.equals("") || currDir.equals(""))) {
            int inputCol = Integer.parseInt(currCol);
            if (inputCol == column) {
                if (currDir.equals("desc")) {
                    if (ascColumn > -1) finalColumn = ascColumn;
                    sortDir = "asc";
                } else {
                    if (descColumn > -1) finalColumn = descColumn;
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
        buf.append("<input type=\"hidden\" name=\"").append(DataAccessConstants.SORT_COLUMN).append("\"");
        buf.append(" value=");
        buf.append(finalColumn);
        buf.append(" />\n");
        buf.append("<input type=\"hidden\" name=\"").append(DataAccessConstants.SORT_DIRECTION).append("\"");
        buf.append(" value=");
        buf.append(sortDir);
        buf.append(" />");

        try {
            pageContext.getOut().print(buf.toString());
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }
        return SKIP_BODY;
    }


}
