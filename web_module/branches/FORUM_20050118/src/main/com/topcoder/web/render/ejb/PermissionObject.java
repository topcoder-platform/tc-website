package com.topcoder.web.render.ejb;

import java.io.Serializable;

public class PermissionObject
        implements Serializable {
    public Integer secure_object_id;
    public Integer sector_id;
    public Integer access_id;
}
