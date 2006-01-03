/*
 * MyProject.java 1.0 7/2/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests.mockups;

import java.net.URL;

import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.Phase;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.UserRole;
import com.topcoder.apps.review.projecttracker.ProjectType;
import com.topcoder.apps.review.projecttracker.PhaseInstance;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;

/**
 * <p>An implementation of Project used for testing.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class MyProject extends Project {
    /**
     * <p>Count of projects created, used for id's.</p>
     */
    private static long count = 0;

    /**
     * <p>The project manager.</p>
     */
    private static User projectManager = new User(
            -1, "kolanovic", "Chris", "Kolanovic", "ckolanovic@yahoo.com") {
        public long getId() {
            return (-1);
        }

        public String getHandle() {
            return ("kolanovic");
        }

        public String getFirstName() {
            return ("Chris");
        }

        public String getLastName() {
            return ("Kolanovic");
        }

        public String getEmail() {
            return ("ckolanovic@yahoo.com");
        }
    };

    /**
     * <p>The id of this project</p>
     */
    private long id;

    /**
     * <p>The name of this project</p>
     */
    private String name;

    /**
     * <p>The current phase of this project.</p>
     */
    private Phase currentPhase = null;

    /**
     * <p>Constructs a new instance of MyProject with the
     * given project name and registers this project with
     * the ProjectTracker.</p>
     *
     * @param name the name of this project
     */
    public MyProject(String name) {
        super(0, 0, name, "", null, null,
                null, null, null, null, null,
                null, null, false, 0, 0);
        this.id = count++;
        this.name = name;
        MyProjectTracker.addProject(this);
    }

    //Project methods

    public PhaseInstance[] getTimeline() {
        return (new PhaseInstance[0]);
    }

    public void setTimeline(PhaseInstance[] timeline) {
    }

    public User getProjectManager() {
        return (projectManager);
    }

    public String getName() {
        return (name);
    }

    public String getVersion() {
        return ("1.0");
    }

    public Phase getCurrentPhase() {
        return (currentPhase);
    }

    public void setCurrentPhase(Phase phase) {
        currentPhase = phase;
    }

    public User getWinner() {
        return (null);
    }

    public void setWinner(User submitter) {
    }

    public URL getProjectInformationURL() {
        return (null);
    }

    public void setProjectInformationURL(URL url) {
    }

    public UserRole[] getParticipants() {
        return (new UserRole[0]);
    }

    public void setParticipants(UserRole[] participants) {
    }

    public long getId() {
        return (id);
    }

    public ProjectType getProjectType() {
        return (null);
    }

    public void setProjectType(ProjectType type) {
    }

    public boolean isNotificationSent() {
        return (false);
    }

    public void setNotificationSent(boolean b) {
    }

    public String getNotes() {
        return (null);
    }

    public void setNotes(String notes) {
    }

    public String getOverview() {
        return (null);
    }
}
