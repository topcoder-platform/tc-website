package com.topcoder.web.query.servlet.jsp.tag;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.servlet.jsp.JspException;

/**
 *
 * @author  George Dean
 */
public class RowIteratorTag extends IteratorTag {

    private static Logger log = Logger.getLogger(RowIteratorTag.class);

    ResultSetContainer rsc;

    public void setRowList(ResultSetContainer rsc) {
        this.rsc = rsc;
    }

    public int doStartTag()throws JspException {
        setCollection(rsc);
       return super.doStartTag();
    }

}
