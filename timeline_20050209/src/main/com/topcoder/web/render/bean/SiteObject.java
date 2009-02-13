/*
 * SiteObject
 *
 * A class for encapsulating a WebSiteHdrObject and providing appropriate
 * toString(), hashCode(), and equals() methods.
 *
 * By John C. Bollinger
 * Copyright 2002, Topcoder, Inc.
 *
 */

package com.topcoder.web.render.bean;

import com.topcoder.web.render.ejb.WebSiteHdrObject;

class SiteObject extends WebSiteHdrObject {
    SiteObject() {
    }

    SiteObject(WebSiteHdrObject wsho) {
        site_hdr_id = wsho.site_hdr_id;
        site_hdr_name = wsho.site_hdr_name;
        site_hdr_desc = wsho.site_hdr_desc;
        created = wsho.created;
        modify_date = wsho.modify_date;
        modify_by = wsho.modify_by;
    }

    Integer getId() {
        return site_hdr_id;
    }

    public String toString() {
        return site_hdr_name;
    }

    public int hashCode() {
        return site_hdr_id.intValue();
    }

    public boolean equals(Object o) {
        return site_hdr_id.equals(o);
    }
}
