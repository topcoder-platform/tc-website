package com.topcoder.web.corp.view.tces.tag;

import com.topcoder.shared.util.logging.Logger;

import javax.servlet.jsp.JspException;
import java.util.List;

/**
 * MapIteratorTag.java
 *
 * Description: Custom tag to iterate through a list of maps.
 *
 */


public class MapIteratorTag
        extends IteratorTag {
    private static Logger log = Logger.getLogger(MapIteratorTag.class);

    List MapList;

    public void setMapList(List MapList) {
        this.MapList = MapList;
    }

    public int doStartTag()
            throws JspException {
        setCollection(MapList);

        return super.doStartTag();
    }

}
