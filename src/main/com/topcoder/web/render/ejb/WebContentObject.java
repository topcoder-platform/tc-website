package com.topcoder.web.render.ejb;

import java.io.Serializable;
import java.sql.Date;

public class WebContentObject
        implements Serializable {
    public Integer content_id;
    public Integer content_group_id;
    public Object content;
    public String content_name;
    public Integer status_id;
    public String language_cd;
    public String country_code;
    public Integer modify_by;
    public Date modify_date;
}
