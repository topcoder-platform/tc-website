package com.topcoder.web.query.servlet.jsp.tag;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtil;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

public class ResultSetItemTag extends TagSupport {

    private static Logger log = Logger.getLogger(ResultSetItemTag.class);
    private ResultSetContainer.ResultSetRow row;
    private String name;
    private boolean escapeHTML;

    public void setRow(ResultSetContainer.ResultSetRow row) {
        this.row = row;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEscapeHTML(boolean escapeHTML) {
        this.escapeHTML = escapeHTML;
    }

    public int doStartTag() throws JspException {
        try {
            String text = escapeHTML? StringUtil.htmlEncode(row.getItem(name).toString()) : row.getItem(name).toString();
            pageContext.getOut().print(text);
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }
        return SKIP_BODY;
    }

}

