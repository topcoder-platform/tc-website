package com.topcoder.web.ejb.coder;

import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.web.common.RowNotFoundException;


/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Apr 6, 2005
 */
public class CoderImageBean extends BaseEJB {

    public void createCoderImage(long coderId, long imageId, boolean display, String dataSource) {
            insert("coder_image_xref",
                    new String[]{"coder_id", "image_id", "display_flag"},
                    new String[]{String.valueOf(coderId), String.valueOf(imageId), display?"1":"0"},
                    dataSource);
    }

    public void setDisplayFlag(long coderId, long imageId, boolean display, String dataSource) {
        update("coder_image_xref", new String[]{"display_flag"},
                new String[]{display?"1":"0"},
                new String[]{"coder_id", "image_id"},
                new String[]{String.valueOf(coderId), String.valueOf(imageId)},
                dataSource);
    }

    public boolean display(long coderId, long imageId, String dataSource) {
        try {
            Integer ret = selectInt("coder_image_xref", "display_flag", new String[]{"coder_id", "image_id"},
                    new String[]{String.valueOf(coderId), String.valueOf(imageId)}, dataSource);
            return ret.intValue()==1;
        } catch (RowNotFoundException e) {
            return false;
        }
    }
}
