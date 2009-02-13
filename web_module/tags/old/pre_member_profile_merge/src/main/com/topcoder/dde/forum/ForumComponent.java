/*
 * ActiveForum.java
 *
 * Created on January 20, 2003, 2:31 AM
 */

package com.topcoder.dde.forum;



/**
 *
 * @author  jimmy
 */
public class ForumComponent {

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

    /** Holds value of property collabForumId. */
    private long collabForumId;

    /** Holds value of property collabForumId. */
    private long specForumId;

    /** Creates a new instance of ActiveForum */
    public ForumComponent() {
    }

    /** Creates a new copy of ActiveForum */
    public ForumComponent(ForumComponent forum) {
        this.componentId = forum.componentId;
        this.name = forum.name;
        this.shortDescription = forum.shortDescription;
        this.rootCategory = forum.rootCategory;
        this.versionId = forum.versionId;
        this.versionText = forum.versionText;
        this.versionPhase = forum.versionPhase;
        this.collabForumId = forum.collabForumId;
        this.specForumId = forum.specForumId;
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

    /** Getter for property collabForumId.
     * @return Value of property collabForumId.
     *
     */
    public long getCollabForumId() {
        return this.collabForumId;
    }

    /** Setter for property collabForumId.
     * @param collabForumId New value of property collabForumId.
     *
     */
    void setCollabForumId(long collabForumId) {
        this.collabForumId = collabForumId;
    }

    /** Getter for property specForumId.
     * @return Value of property specForumId.
     *
     */
    public long getSpecForumId() {
        return this.specForumId;
    }

    /** Setter for property specForumId.
     * @param collabForumId New value of property specForumId.
     *
     */
    void setSpecForumId(long specForumId) {
        this.specForumId = specForumId;
    }
}
