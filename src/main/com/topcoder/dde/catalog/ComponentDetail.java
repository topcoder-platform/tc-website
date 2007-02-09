package com.topcoder.dde.catalog;

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: May 13, 2003
 * Time: 10:53:50 AM
 * To change this template use Options | File Templates.
 */
public class ComponentDetail implements Serializable {

    private ComponentInfo info;
    private ComponentSummary summary;
    private ComponentVersionInfo vers;
    private Document[] docs;
    private Technology[] techs;
    private ForumCategory[] forumCategories;
    private TeamMemberRole[] members;
    private ComponentSummary[] dependencies;

    public ComponentDetail(ComponentInfo info, ComponentSummary summary,
                           ComponentVersionInfo vers, Document[] docs,
                           Technology[] techs, ForumCategory[] forumCategories,
                           TeamMemberRole[] members,
                           ComponentSummary[] dependencies) {

        this.info = info;
        this.summary = summary;
        this.vers = vers;
        this.docs = docs;
        this.techs = techs;
        this.forumCategories = forumCategories;
        this.members = members;
        this.dependencies = dependencies;
    }

    public ComponentInfo getInfo() {
        return info;
    }

    public ComponentSummary getSummary() {
        return summary;
    }

    public ComponentVersionInfo getVers() {
        return vers;
    }

    public Document[] getDocs() {
        return docs;
    }

    public Technology[] getTechs() {
        return techs;
    }

    public ForumCategory[] getForumCategories() {
        return forumCategories;
    }

    public TeamMemberRole[] getMembers() {
        return members;
    }

    public ComponentSummary[] getDependencies() {
        return dependencies;
    }
}