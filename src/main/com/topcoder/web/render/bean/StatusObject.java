/*
 * StatusObject
 *
 * A class for encapsulating a WebStatusObject and providing appropriate
 * toString(), hashCode(), and equals() methods.
 *
 * By John C. Bollinger
 * Copyright 2002, Topcoder, Inc.
 *
 */

package com.topcoder.web.render.bean;

import com.topcoder.web.render.ejb.WebStatusObject;

class StatusObject extends WebStatusObject {
    StatusObject() {
    }

    StatusObject(WebStatusObject wso) {
        status_id = wso.status_id;
        status_desc = wso.status_desc;
    }

    Integer getId() {
        return status_id;
    }

    public String toString() {
        return status_desc;
    }

    public int hashCode() {
        return status_id.intValue();
    }

    public boolean equals(Object o) {
        return status_id.equals(o);
    }
}

