package com.topcoder.web.screening.view.tag;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.screening.model.SessionInfo;

import javax.servlet.jsp.tagext.TagSupport;
import javax.servlet.jsp.JspException;
import java.util.Date;
import java.io.IOException;

public class SessionStatusLinkTag extends TagSupport {
    private ResultSetContainer.ResultSetRow row;

    public void setRow(ResultSetContainer.ResultSetRow row) {
        this.row = row;
    }

    public int doStartTag() throws JspException {
        try {
            Date curr = (Date) row.getItem("current_time").getResultData();
            Date sessBegin = (Date) row.getItem("begin_time").getResultData();
            Date segEnd = (Date) row.getItem("max_end_time").getResultData();
            Date sessEnd = (Date) row.getItem("end_time").getResultData();
            String link = "Details";
            if (sessBegin != null) {
                int statusFlag = SessionInfo.sessionStatus(curr, sessBegin, segEnd, sessEnd);
                if (statusFlag > 0) link = "Results";
            }
            pageContext.getOut().print(link);
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }
        return SKIP_BODY;
    }
}
