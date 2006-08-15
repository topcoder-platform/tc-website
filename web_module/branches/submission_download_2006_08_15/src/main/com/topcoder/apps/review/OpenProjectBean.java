/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.ProjectType;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;

import java.util.ArrayList;
import java.util.List;

/**
 * Helper class to render the open projects list.
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class OpenProjectBean {

    // --------------------------------------------------- Instance Variables

    /**
     * The project list.
     */
    private List list = new ArrayList();

    /**
     * The project type.
     */
    private ProjectType type = null;

    // --------------------------------------------------------- Constructor

    /**
     * <p>
     * Creates the instance.
     * </p>
     *
     * @param type The project type.
     * @param list The open project list.
     */
    public OpenProjectBean(ProjectType type, UserProjectInfo[] list) {
        // Get the projects belong to this type
        for (int i = 0; i < list.length; i++) {
            if (list[i].getProjectType().getId() == type.getId()) {
                this.list.add(list[i]);
            }
        }

        this.type = type;
    }

    // --------------------------------------------------------- Public Methods

    /**
     * <p>
     * Return the project list information.
     * </p>
     *
     * @return the project list information.
     */
    public List getProjectList() {
        return list;
    } // end getProject

    /**
     * <p>
     * Return the type name.
     * </p>
     *
     * @return the type name.
     */
    public String getTypeName() {
        return type.getName();
    }

    /**
     * <p>
     * Return the type id.
     * </p>
     *
     * @return the type id.
     */
    public long getTypeId() {
        return type.getId();
    }

    /**
     * <p>
     * Return the number of projects in this type.
     * </p>
     *
     * @return the number of projects in this type.
     */
    public int getSize() {
        return list.size();
    }

} // end OpenProjectBean



