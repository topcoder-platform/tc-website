/*
 * PageObject
 *
 * A class for encapsulatign a WebPageObject and providing appropriate
 * toString(), hashCode(), and equals() methods.
 *
 * By John C. Bollinger
 * Copyright 2002, Topcoder, Inc.
 *
 */

package com.topcoder.web.render.bean;

import com.topcoder.web.render.ejb.WebPageObject;

class PageObject extends WebPageObject {
    PageObject() {
    }

    PageObject(WebPageObject wpo) {
        page_id = wpo.page_id;
        language_cd = wpo.language_cd;
        page_name = wpo.page_name;
        status_id = wpo.status_id;
        page_title = wpo.page_title;
        page_path = wpo.page_path;
        sort_number = wpo.sort_number;
        site_hdr_id = wpo.site_hdr_id;
        country_code = wpo.country_code;
        modify_by = wpo.modify_by;
        modify_date = wpo.modify_date;
    }

    Integer getId() {
        return page_id;
    }

    public String toString() {
        return page_name;
    }

    public int hashCode() {
        return page_id.intValue();
    }

    public boolean equals(Object o) {
        return page_id.equals(o);
    }
}
