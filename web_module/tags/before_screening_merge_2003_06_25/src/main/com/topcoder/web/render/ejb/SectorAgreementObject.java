package com.topcoder.web.render.ejb;

import java.io.Serializable;
import java.sql.Date;

public class SectorAgreementObject
        implements Serializable {
    public Integer sector_id;
    public Integer user_id;
    public Date agree_date;
}
