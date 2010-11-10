package com.topcoder.web.email.servlet.jsp.tag;

import com.topcoder.shared.util.logging.Logger;

import javax.servlet.jsp.JspException;
import java.util.List;

/**
 * ScheduledJobLogIteratorTag.java
 *
 * Description: Custom tag to iterate through the log of a scheduled job.
 *
 * @author    James Lee (jameslee@cs.stanford.edu)
 * @version    1.0
 *
 */


public class ScheduledJobLogIteratorTag
        extends IteratorTag {
    private static Logger log = Logger.getLogger(ScheduledJobLogIteratorTag.class);

    // list of log entries
    List logList;

    public void setLogList(List logList) {
        this.logList = logList;
    }

    public int doStartTag()
            throws JspException {
        setCollection(logList);

        return super.doStartTag();
    }
/*
    Object getElementAt(int index)
    {
        if (index < logResultSetContainer.size()) {
            TCResultItem status = logResultSetContainer.getItem(index, 0);
            TCResultItem reason = logResultSetContainer.getItem(index, 1);
            TCResultItem detail_id = logResultSetContainer.getItem(index, 2);

            JobLogEntry jobLogEntry = new JobLogEntry();
            jobLogEntry.setDetailStatus(String.valueOf(status));
            jobLogEntry.setDetailReason(String.valueOf(reason));
            jobLogEntry.setDetailId(String.valueOf(detail_id));

            return jobLogEntry;
        } else {
            return null;
        }
    }
*/
}
