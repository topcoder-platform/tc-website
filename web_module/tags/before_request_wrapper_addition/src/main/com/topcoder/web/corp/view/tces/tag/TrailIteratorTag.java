package com.topcoder.web.corp.view.tces.tag;

import com.topcoder.shared.util.logging.Logger;

import javax.servlet.jsp.JspException;
import java.util.List;

/**
 *
 * @author  Greg Paul
 */
public class TrailIteratorTag extends IteratorTag {

    private static Logger log = Logger.getLogger(RowIteratorTag.class);

    List trailList;

    public void setTrailList(List trailList) {
        this.trailList = trailList;
    }

    public int doStartTag()
            throws JspException {
        setCollection(trailList);

        return super.doStartTag();
    }

}
