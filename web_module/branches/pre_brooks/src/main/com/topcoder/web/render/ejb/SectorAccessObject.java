package com.topcoder.web.render.ejb;

import java.io.Serializable;
import java.sql.Date;

public class SectorAccessObject
        implements Serializable {
    public Integer sector_id;
    public Integer user_id;
    public Date access;
    public String authorized;
}
