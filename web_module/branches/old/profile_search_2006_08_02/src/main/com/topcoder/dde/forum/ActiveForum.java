/*
 * ActiveForum.java
 *
 * Created on January 20, 2003, 2:31 AM
 */

package com.topcoder.dde.forum;

import java.util.Date;

/**
 *
 * @author  jimmy
 */
public class ActiveForum {

    /** Holds value of property componentId. */
    private long componentId;

    /** Holds value of property name. */
    private String name;

    /** Holds value of property shortDescription. */
    private String shortDescription;

    /** Holds value of property rootCategory. */
    private long rootCategory;

    /** Holds value of property versionId. */
    private long versionId;

    /** Holds value of property versionText. */
    private String versionText;

    /** Holds value of property versionPhase. */
    private long versionPhase;

    /** Holds value of property forumId. */
    private long forumId;

    /** Holds value of property totalTopics. */
    private long totalTopics;

    /** Holds value of property totalThreads. */
    private long totalThreads;

    /** Holds value of property totalPosts. */
    private long totalPosts;

    /** Holds value of property lastPostTime. */
    private Date lastPostTime;

    /** Holds value of property lastPostUsername. */
    private String lastPostUsername;

    /** Creates a new instance of ActiveForum */
    public ActiveForum() {
    }

    /** Creates a new copy of ActiveForum */
    public ActiveForum(ActiveForum forum) {
        this.componentId = forum.componentId;
        this.name = forum.name;
        this.shortDescription = forum.shortDescription;
        this.rootCategory = forum.rootCategory;
        this.versionId = forum.versionId;
        this.versionText = forum.versionText;
        this.versionPhase = forum.versionPhase;
        this.forumId = forum.forumId;
        this.totalTopics = forum.totalTopics;
        this.totalThreads = forum.totalThreads;
        this.totalPosts = forum.totalPosts;
        this.lastPostTime = forum.lastPostTime;
        this.lastPostUsername = forum.lastPostUsername;
    }

    /** Getter for property componentId.
     * @return Value of property componentId.
     *
     */
    public long getComponentId() {
        return this.componentId;
    }

    /** Setter for property componentId.
     * @param componentId New value of property componentId.
     *
     */
    void setComponentId(long componentId) {
        this.componentId = componentId;
    }

    /** Getter for property componentName.
     * @return Value of property componentName.
     *
     */
    public String getName() {
        return this.name;
    }

    /** Setter for property componentName.
     * @param componentName New value of property componentName.
     *
     */
    void setName(String name) {
        this.name = name;
    }

    /** Getter for property shortDescription.
     * @return Value of property shortDescription.
     *
     */
    public String getShortDescription() {
        return this.shortDescription;
    }

    /** Setter for property shortDescription.
     * @param shortDescription New value of property shortDescription.
     *
     */
    void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    /** Getter for property rootCategory.
     * @return Value of property rootCategory.
     *
     */
    public long getRootCategory() {
        return this.rootCategory;
    }

    /** Setter for property rootCategory.
     * @param rootCategory New value of property rootCategory.
     *
     */
    void setRootCategory(long rootCategory) {
        this.rootCategory = rootCategory;
    }

    /** Getter for property versionId.
     * @return Value of property versionId.
     *
     */
    public long getVersionId() {
        return this.versionId;
    }

    /** Setter for property versionId.
     * @param versionId New value of property versionId.
     *
     */
    void setVersionId(long versionId) {
        this.versionId = versionId;
    }

    /** Getter for property versionText.
     * @return Value of property versionText.
     *
     */
    public String getVersionText() {
        return this.versionText;
    }

    /** Setter for property versionText.
     * @param versionText New value of property versionText.
     *
     */
    void setVersionText(String versionText) {
        this.versionText = versionText;
    }

    /** Getter for property versionPhase.
     * @return Value of property versionPhase.
     *
     */
    public long getVersionPhase() {
        return this.versionPhase;
    }

    /** Setter for property versionPhase.
     * @param versionPhase New value of property versionPhase.
     *
     */
    void setVersionPhase(long versionPhase) {
        this.versionPhase = versionPhase;
    }

    /** Getter for property forumId.
     * @return Value of property forumId.
     *
     */
    public long getForumId() {
        return this.forumId;
    }

    /** Setter for property forumId.
     * @param forumId New value of property forumId.
     *
     */
    void setForumId(long forumId) {
        this.forumId = forumId;
    }

    /** Getter for property totalTopics.
     * @return Value of property totalTopics.
     *
     */
    public long getTotalTopics() {
        return this.totalTopics;
    }

    /** Setter for property totalTopics.
     * @param totalThreads New value of property totalTopics.
     *
     */
    void setTotalTopics(long totalTopics) {
        this.totalTopics = totalTopics;
    }

    /** Getter for property totalThreads.
     * @return Value of property totalThreads.
     *
     */
    public long getTotalThreads() {
        return this.totalThreads;
    }

    /** Setter for property totalThreads.
     * @param totalThreads New value of property totalThreads.
     *
     */
    void setTotalThreads(long totalThreads) {
        this.totalThreads = totalThreads;
    }

    /** Getter for property totalPosts.
     * @return Value of property totalPosts.
     *
     */
    public long getTotalPosts() {
        return this.totalPosts;
    }

    /** Setter for property totalPosts.
     * @param totalPosts New value of property totalPosts.
     *
     */
    void setTotalPosts(long totalPosts) {
        this.totalPosts = totalPosts;
    }

    /** Getter for property lastPostTime.
     * @return Value of property lastPostTime.
     *
     */
    public Date getLastPostTime() {
        return this.lastPostTime;
    }

    /** Setter for property lastPostTime.
     * @param lastPostTime New value of property lastPostTime.
     *
     */
    void setLastPostTime(Date lastPostTime) {
        this.lastPostTime = lastPostTime;
    }

    /** Getter for property lastPostUserId.
     * @return Value of property lastPostUserId.
     *
     */
    public String getLastPostUsername() {
        return this.lastPostUsername;
    }

    /** Setter for property lastPostUserId.
     * @param lastPostUserId New value of property lastPostUserId.
     *
     */
    void setLastPostUsername(String lastPostUsername) {
        this.lastPostUsername = lastPostUsername;
    }

}
