/*
 * MyRole.java 1.0 7/2/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests.mockups;

import com.topcoder.apps.review.projecttracker.Role;
import com.topcoder.apps.review.document.AbstractSubmission;

/**
 * <p>An implementation of AbstractSubmission used for testing.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class MyRole extends Role {
    /**
     * <p>The name of this phase.</p>
     */
    private String name;

    /**
     * <p>The id of this phase.</p>
     */
    private int id;

    /**
     * <p>Constructs an new instance of MyRole with
     * the given name and id.</p>
     *
     * @param name the name of the phase
     * @param id the id of the phase
     */
    public MyRole(String name, int id) {
        super(id, name);
        this.name = name;
        this.id = id;
    }

    public String getName() {
        return (name);
    }

    public long getId() {
        return (id);
    }

    public boolean equals(Object o) {
        return ((o != null) && (o instanceof Role) &&
                ((Role) o).getId() == getId());
    }
}

