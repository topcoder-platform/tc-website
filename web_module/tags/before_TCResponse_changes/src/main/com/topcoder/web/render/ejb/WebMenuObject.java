package com.topcoder.web.render.ejb;

import java.io.Serializable;

public class WebMenuObject
        implements Serializable {
    public Integer menu_id;
    public String menu_name;
    public Object menu_content;
    public String menu_isenabled;
}
