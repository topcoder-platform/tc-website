package com.topcoder.web.render.ejb;

import java.io.Serializable;
import java.sql.Date;

public class WebSiteHdrObject
        implements Serializable {
    public Integer site_hdr_id;
    public String site_hdr_name;
    public String site_hdr_desc;
    public Date created;
    public Date modify_date;
    public Integer modify_by;
}
