package com.topcoder.web.render.ejb;

import java.io.Serializable;
import java.sql.Date;

public class WebMenuTypeObject
        implements Serializable {
    public Integer menu_type_id;
    public String menu_type_desc;
    public Integer modify_by;
    public Date modify_date;
}
