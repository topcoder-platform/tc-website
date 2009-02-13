package com.topcoder.web.render.ejb;

import java.io.Serializable;
import java.sql.Date;

public class WebPagePathObject
        implements Serializable {
    public Integer site_hdr_id;
    public Integer page_id;
    public Integer parent_id;
    public Integer page_order;
    public Integer modify_by;
    public Date modify_date;
}
