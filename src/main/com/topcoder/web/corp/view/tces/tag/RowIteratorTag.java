/*
 * RowIteratorTag.java
 *
 * Created on August 26, 2002, 1:48 PM
 */

package com.topcoder.web.corp.view.tces.tag;

import com.topcoder.shared.util.logging.Logger;

import javax.servlet.jsp.JspException;
import java.util.List;

/**
 *
 * @author  George Dean
 */
public class RowIteratorTag extends IteratorTag {

    private static Logger log = Logger.getLogger(RowIteratorTag.class);

    List rowList;

    public void setRowList(List rowList) {
        this.rowList = rowList;
    }

    public int doStartTag()
            throws JspException {
        setCollection(rowList);

        return super.doStartTag();
    }

    public void release() {
        rowList= null;
        super.release();
    }

}
