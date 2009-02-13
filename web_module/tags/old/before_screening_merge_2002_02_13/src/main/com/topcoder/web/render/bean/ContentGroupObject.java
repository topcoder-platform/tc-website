/*
 * ContentGroupObject
 *
 * A class for encapsulating a WebContentGroupObject and providing appropriate
 * toString(), hashCode(), and equals() methods.
 *
 * By John C. Bollinger
 * Copyright 2002, Topcoder, Inc.
 *
 */

package com.topcoder.web.render.bean;

import com.topcoder.web.render.ejb.WebContentGroupObject;

class ContentGroupObject extends WebContentGroupObject {
    ContentGroupObject() {
    }

    ContentGroupObject(WebContentGroupObject wcgo) {
        content_group_id = wcgo.content_group_id;
        content_group_desc = wcgo.content_group_desc;
    }

    Integer getId() {
        return content_group_id;
    }

    public String toString() {
        return content_group_desc;
    }

    public int hashCode() {
        return content_group_id.intValue();
    }

    public boolean equals(Object o) {
        return content_group_id.equals(o);
    }
}
