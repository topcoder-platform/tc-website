package com.topcoder.web.render.ejb;

import java.io.Serializable;
import java.sql.Date;

public class WebPageObject
        implements Serializable {
    public Integer page_id;
    public String language_cd;
    public String page_name;
    public Integer status_id;
    public String page_title;
    public String page_path;
    public Integer sort_number;
    public Integer site_hdr_id;
    public String country_code;
    public Integer modify_by;
    public Date modify_date;
}
