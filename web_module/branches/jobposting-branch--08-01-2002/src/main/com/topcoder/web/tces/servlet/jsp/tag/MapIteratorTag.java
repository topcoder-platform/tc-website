package com.topcoder.web.tces.servlet.jsp.tag;

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

    List CampaignInfoList;

    public void setCampaignInfoList(List CampaignInfoList) {
        this.CampaignInfoList = CampaignInfoList;
    }

    public int doStartTag()
            throws JspException {
        setCollection(CampaignInfoList);

        return super.doStartTag();
    }

}
