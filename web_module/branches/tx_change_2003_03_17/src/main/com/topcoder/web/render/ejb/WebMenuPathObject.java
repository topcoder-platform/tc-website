package com.topcoder.web.render.ejb;

import java.io.Serializable;
import java.sql.Date;

public class WebMenuPathObject
        implements Serializable {
    public Integer menu_hdr_id;
    public Integer menu_id;
    public Integer parent_id;
    public Integer menu_order;
    public Integer modify_by;
    public Date modify_date;
}
