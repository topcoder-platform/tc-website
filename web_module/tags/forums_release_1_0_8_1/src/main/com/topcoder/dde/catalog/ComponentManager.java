/*
 * ComponentManager.java
 * 26 August 2002
 * 1.0
 *
 * Copyright(c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.catalog;

import com.topcoder.security.TCSubject;

import java.rmi.RemoteException;
import java.util.Collection;


/**
 * <p>The remote interface of the ComponentManager Enterprise Java Bean (EJB).
 * ComponentManagerEJB and CatalogEJB constitute the Component Catalog of the
 * Distributed Development Environment. ComponentManagerEJB contains the methods
 * that a client can use to query and modify the properties of individual
 * components and their versions.</p>
 *
 * <p>ComponentManagerEJB is a stateful session bean and supports the concept of
 * an Active Version. The Active version must not be confused with the Current
 * version of a component, which refers to the latest completed version (or the
 * first version if no versions have been completed), or the Latest version,
 * which refers to the version with the highest version number (which
 * may still be in collaboration, specification, or development). The active
 * version refers to the state of an instance of ComponentManager, and can also
 * be thought of as the "selected" version. Each instance of ComponentManager
 * can only be used to work with a single version (the active version) of a
 * single component at a time. The component and active version are specified
 * when the instance is created, but the active version can be changed by
 * calling the <code>setVersion</code> method. To work with a different
 * component, a separate instance of ComponentManager must be created.</p>
 *
 * @version 1.0, 26 August 2002
 * @author  Albert Mao
 * @see     ComponentManagerHome
 * @see     Catalog
 */
public interface ComponentManager extends javax.ejb.EJBObject {


    /**
     * Sets the "root category" that is managed by this instance of
     * ComponentManager.
     *
     * @param rootCategory the new root category id
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the specified version of the component
     * managed by this instance cannot be found
     */
    public void setRootCategory(long rootCategory)
            throws RemoteException, CatalogException;

    /**
     * Gets the "root category" that is managed by this instance of
     * ComponentManager.
     *
     * @return root category
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the specified version of the component
     * managed by this instance cannot be found
     */
    public long getRootCategory()
            throws RemoteException, CatalogException;

    /**
     * Sets the "active version" that is managed by this instance of
     * ComponentManager.
     *
     * Note that the current active version that is being managed can be
     * obtained by calling <code>getVersion()</code> on the
     * <code>ComponentVersionInfo</code> object returned by
     * <code>getVersionInfo</code>.
     *
     * @param version the new active version number
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the specified version of the component
     * managed by this instance cannot be found
     */
    public void setVersion(long version)
            throws RemoteException, CatalogException;

    /**
     * Returns the number of versions for the component managed by this
     * instance.
     *
     * @return the total number of versions
     * @throws CatalogException if the version information cannot be retrieved
     */
    public long getNumVersions()
            throws RemoteException, CatalogException;

    /**
     * Returns the attributes of the component managed by this instance.
     *
     * @return a <code>ComponentInfo</code> object that contains the attributes
     * of the component
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the component information cannot be retrieved
     */
    public ComponentInfo getComponentInfo()
            throws RemoteException, CatalogException;

    /**
     * Returns the attributes of the active version of the component managed by
     * this instance.
     *
     * @return a <code>ComponentVersionInfo</code> object that contains the
     * attributes of the active version
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the version information cannot be retrieved
     */
    public ComponentVersionInfo getVersionInfo()
            throws RemoteException, CatalogException;

    public VersionDateInfo getVersionDateInfo(long componentVersionId, long phaseId)
            throws RemoteException, CatalogException;

    public void updateVersionDatesInfo(VersionDateInfo versionDateInfo)
            throws RemoteException, CatalogException;

    /**
     * Returns the attributes of all the versions of the component managed by
     * this instance. The versions are returned in descending order by version
     * number.
     *
     * @return a <code>Collection</code> of <code>ComponentVersionInfo</code>
     * objects that contain the attributes of all the versions
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the version information cannot be retrieved
     */
    public Collection getAllVersionInfo()
            throws RemoteException, CatalogException;

    /**
     * Creates a new version of the component managed by this instance. The
     * newly created version is associated with the requested technologies and
     * given the requested version comments. It is assigned a version number
     * that is one greater than the number of the latest existing version (thus
     * becoming the latest version) and a default price of 0. The collaboration
     * forum is automatically created for the new version, which begins in the
     * <code>ComponentVersionInfo.COLLABORATION</code> phase. The user specified
     * as the requestor of the new version (usually an administrator) is
     * assigned the Requestor role with a default rating of 0.
     *
     * @param request a <code>ComponentVersionRequest</code> that contains the
     * requested attributes for the new version
     * @return the version number of the newly created version
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if <code>request</code> is <code>null</code>, if
     * any of the specified technologies cannot be found in the catalog, or if
     * the version cannot be created
     */
    public long createNewVersion(ComponentVersionRequest request)
            throws RemoteException, CatalogException;

    /**
     * Updates the attributes of the component managed by this instance.
     *
     * @param info a <code>ComponentInfo</code> object that contains the updated
     * attributes of the component
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if <code>info</code> is <code>null</code>, if
     * <code>info</code> represents a component that is not managed by this
     * instance, or if the information cannot be updated
     */
    public void updateComponentInfo(ComponentInfo info)
            throws RemoteException, CatalogException;

    /**
     * <p>Updates the attributes of the active version of the component managed
     * by this instance.</p>
     *
     * <p>Certain phase transitions have notable effects:<p>
     *
     * <ul><li>If the phase of the version is changed from anything to
     * <code>ComponentVersionInfo.COMPLETED</code>, all forums associated with
     * the version are closed. In addition, if the active version number is
     * greater than the current version number OR the current version number is
     * 1, the current version number of the component is updated to the active
     * version and the component is reindexed in the search engine.</li>
     *
     * <li>If the phase of the version is changed from
     * <code>ComponentVersionInfo.COLLABORATION</code> to
     * <code>ComponentVersionInfo.SPECIFICATION</code>, and the version does not
     * already have at least one specification forum, a new specification forum
     * is automatically created for the version</li></ul>
     *
     * @param info a <code>ComponentVersionInfo</code> object that contains the
     * updated attributes of the version
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if <code>info</code> is <code>null</code>, if
     * <code>info</code> represents a version that is not the active version of
     * the component managed by this instance, or if the information cannot be
     * updated
     */
    public void updateVersionInfo(ComponentVersionInfo info, TCSubject requestor, long levelId)
            throws RemoteException, CatalogException;

    /**
     * Returns the categories that are associated with the component managed by
     * this instance. Note that category associations apply to entire
     * components, not individual versions. The returned category objects will
     * <em>not</em> contain any subcategory information. The categories are
     * returned in alphabetical order by name.
     *
     * @return a <code>Collection</code> of <code>Category</code> objects that
     * represent the categories that are associated with the component
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the category information cannot be retrieved
     */
    public Collection getCategories()
            throws RemoteException, CatalogException;

    /**
     * Returns the technologies that are associated with the active version of
     * the component managed by this instance. Note that technology associations
     * apply to individual versions. The technologies are returned in
     * alphabetical order by name.
     *
     * @return a <code>Collection</code> of <code>Technology</code> objects that
     * represent the technologies that are associated with the active version
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the technology information cannot be
     * retrieved
     */
    public Collection getTechnologies()
            throws RemoteException, CatalogException;

    /**
     * Returns the development roles that are associated with the active version
     * of the component managed by this instance. Note that development roles
     * are associated with individual versions. The development roles are
     * returned in alphabetical order by username.
     *
     * @return a <code>Collection</code> of <code>TeamMemberRole</code> objects
     * that represent the development roles that are associated with the active
     * version
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the development role information cannot be
     * retrieved
     */
    public Collection getTeamMemberRoles()
            throws RemoteException, CatalogException;

    /**
     * Returns the documents that are associated with the active version of the
     * component managed by this instance. Note that documents are associated
     * with individual versions. The returned documents are sorted by type.
     * Documents with the same type are sorted alphabetically by name.
     *
     * @return a <code>Collection</code> of <code>Document</code> objects that
     * represent the documents that are associated with the active version
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the document information cannot be retrieved
     */
    public Collection getDocuments()
            throws RemoteException, CatalogException;

    /**
     * Returns the documents of the specified Id
     *
     * @return a <code>Document</code> object that represent the document
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the document information cannot be retrieved
     */
    public Document getDocument(long documentId)
            throws RemoteException, CatalogException;

    /**
     * Returns the download locations for the active version of the component
     * managed by this instance. Note that download locations are associated
     * with individual versions. The download locations are returned in
     * alphabetical order by description.
     *
     * @return a <code>Collection</code> of <code>Download</code> objects that
     * represent the download locations that are associated with the active
     * version
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the download information cannot be retrieved
     */
    public Collection getDownloads()
            throws RemoteException, CatalogException;

    /**
     * Returns the download location for the specified Id
     *
     * @return <code>Download</code> objects that represent the download location
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the download information cannot be retrieved
     */
    public Download getDownload(long downloadId)
            throws RemoteException, CatalogException;


    /**
     * Returns the dependencies of the active version of the component managed
     * by this instance.  Note that individual versions of the same component can
     * have different dependencies.  The returned summaries are sorted in
     * alphabetical order by component name.
     *
     * @return a <code>Collection</code> of <code>ComponentSummary</code>
     * objects that represent the components and versions that the active
     * version depends on
     * @throws RemoteException if a system level failure causes the remote
     * method call to fail
     * @throws CatalogException if the dependency information cannot be
     * retrieved
     */
    public Collection getDependencies()
            throws RemoteException, CatalogException;


    /**
     * Returns the usage examples that are associated with the active version of
     * the component managed by this instance. Note that usage examples are
     * associated with individual versions. The examples are returned in
     * alphabetical order by description.
     *
     * @return a <code>Collection</code> of <code>Example</code> objects that
     * represent the examples that are associated with the active version
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the example information cannot be retrieved
     */
    public Collection getExamples()
            throws RemoteException, CatalogException;

    /**
     * Returns the reviews that are associated with the active version of the
     * component managed by this instance. Note that reviews are associated with
     * individual versions. The reviews are returned in ascending order by
     * review date.
     *
     * @return a <code>Collection</code> of <code>Review</code> objects that
     * represent the reviews for the active version
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the review information cannot be retrieved
     */
    public Collection getReviews()
            throws RemoteException, CatalogException;

    /**
     * Returns the forum of the specified type that is associated with
     * the active version of the component managed by this instance. The type
     * constants are defined in {@link Forum Forum}. Note that forums are
     * associated with individual versions.
     *
     * @param type the type of forum to retrieve
     * @return a <code>Forum</code> object that represents the forum, or
     * <code>null</code> if there are no forums of the specified type for the
     * active version
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if there are multiple forums of the specified
     * type for the active version, or if the forum information cannot be
     * retrieved
     */
    public Forum getForum(int type)
            throws RemoteException, CatalogException;

    /**
     * Returns the active forum of the specified type that is associated with
     * the component managed by this instance. The type constants are defined in
     * <code>Forum</code>. Note that this method pertains to the component as a
     * whole, so all versions are searched for an active forum. Under normal
     * circumstances, there should be either zero or one active forum for a
     * component, and it should always be associated with the latest version.
     *
     * @param type the type of forum to retrieve
     * @return a <code>Forum</code> object that represents the forum, or
     * <code>null</code> if there are no active forums of the specified type
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if there are multiple active forums of the
     * specified type, or if the forum information cannot be retrieved
     */
    public Forum getActiveForum(int type)
            throws RemoteException, CatalogException;

    /**
     * Returns all the closed forums of the specified type that are associated
     * with the component managed by this instance. The type constants are
     * defined in <code>Forum</code>. Note that this method pertains to the
     * component as a whole, so the closed forums associated with every version
     * of the component are returned. The forums are returned in descending
     * order by the date they were opened.
     *
     * @param type the type of forum to retrieve
     * @return a <code>Collection</code> of <code>Forum</code> objects that
     * represent the closed forums associated with all versions of the component
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the forum information cannot be retrieved
     */
    public Collection getClosedForums(int type)
            throws RemoteException, CatalogException;

    /**
     * Associates a category with the component managed by this instance.
     *
     * @param categoryId the primary key of the category
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the specified category cannot be found in the
     * catalog, or if the association cannot be created
     */
    public void addCategory(long categoryId)
            throws RemoteException, CatalogException;

    /**
     * Associates a technology with the active version of the component managed
     * by this instance.
     *
     * @param technologyId the primary key of the technology
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the specified technology cannot be found in
     * the catalog, or if the association cannot be created
     */
    public void addTechnology(long technologyId)
            throws RemoteException, CatalogException;

    /**
     * Adds a development role to the active version of the component managed by
     * this instance.
     *
     * @param role a <code>TeamMemberRole</code> object that represents the role
     * to be added
     * @return a <code>TeamMemberRole</code> object that represents the newly
     * added role (this is useful for obtaining its primary key)
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if <code>role</code> is <code>null</code>, if
     * <code>role</code> represents a role that was returned by the catalog
     * (instead of constructed by the client), or if the role cannot be created
     */
    public TeamMemberRole addTeamMemberRole(TeamMemberRole role)
            throws RemoteException, CatalogException;

    /**
     * Adds a document to the active version of the component managed by this
     * instance.
     *
     * @param document a <code>Document</code> object that represents the
     * document to be added
     * @return a <code>Document</code> object that represents the newly added
     * document (this is useful for obtaining its primary key)
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if <code>document</code> is <code>null</code>,
     * if <code>document</code> represents a document that was returned by the
     * catalog (instead of constructed by the client), or if the document cannot
     * be created
     */
    public Document addDocument(Document document)
            throws RemoteException, CatalogException;

    /**
     * Adds an example to the active version of the component managed by this
     * instance.
     *
     * @param example a <code>Example</code> object that represents the example
     * to be added
     * @return a <code>Example</code> object that represents the newly added
     * example (this is useful for obtaining its primary key)
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if <code>example</code> is <code>null</code>, if
     * <code>example</code> represents an example that was returned by the
     * catalog (instead of constructed by the client), or if the example cannot
     * be created
     */
    public Example addExample(Example example)
            throws RemoteException, CatalogException;

    /**
     * Adds a download location to the active version of the component managed
     * by this instance.
     *
     * @param download a <code>Download</code> object that represents the
     * download location to be added
     * @return a <code>Download</code> object that represents the newly added
     * download location (this is useful for obtaining its primary key)
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if <code>download</code> is <code>null</code>,
     * if <code>download</code> represents a download location that was returned
     * by the catalog (instead of constructed by the client), or if the download
     * location cannot be created
     */
    public Download addDownload(Download download)
            throws RemoteException, CatalogException;

    /**
     * Declares a dependency relationship of the active version of the component
     * managed by this instance on another component version.
     *
     * @param dependeeVersionId the primary key of the dependee component
     * version
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the specified dependee cannot be found in the
     * catalog, or if the dependency relationship cannot be created
     */
    public void addDependency(long dependeeVersionId)
            throws RemoteException, CatalogException;

    /**
     * Adds a review to the active version of the component managed by this
     * instance.
     *
     * @param review a <code>Review</code> object that represents the review to
     * be added
     * @return a <code>Review</code> object that represents the newly added
     * review (this is useful for obtaining its primary key)
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if <code>review</code> is <code>null</code>, if
     * <code>review</code> represents a review that was returned by the catalog
     * (instead of constructed by the client), or if the review cannot be
     * created
     */
    public Review addReview(Review review)
            throws RemoteException, CatalogException;

    /**
     * Updates a document in the catalog.
     *
     * @param document the document to be updated
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if <code>document</code> is <code>null</code>,
     * or if <code>document</code> represents a document that cannot be found in
     * the catalog (the document must exist before it can be updated)
     */
    public void updateDocument(Document document)
            throws RemoteException, CatalogException;

    /**
     * Updates an example in the catalog.
     *
     * @param example the example to be updated
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if <code>example</code> is <code>null</code>, or
     * if <code>example</code> represents an example that cannot be found in the
     * catalog (the example must exist before it can be updated)
     */
    public void updateExample(Example example)
            throws RemoteException, CatalogException;

    /**
     * Updates a download location in the catalog.
     *
     * @param download the download location to be updated
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if <code>download</code> is <code>null</code>,
     * or if <code>download</code> represents a download location that cannot be
     * found in the catalog (the download location must exist before it can be
     * updated)
     */
    public void updateDownload(Download download)
            throws RemoteException, CatalogException;

    /**
     * Updates a review in the catalog.
     *
     * @param review the review to be updated
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if <code>review</code> is <code>null</code>, or
     * if <code>review</code> represents a review that cannot be found in the
     * catalog (the review must exist before it can be updated)
     */
    public void updateReview(Review review)
            throws RemoteException, CatalogException;

    /**
     * Disassociates a category from the component managed by this instance.
     *
     * @param categoryId the primary key of the category to be disassociated
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the specified category is not associated with
     * the component, or if the association cannot be removed
     */
    public void removeCategory(long categoryId)
            throws RemoteException, CatalogException;

    /**
     * Disassociates a technology from the active version of the component
     * managed by this instance.
     *
     * @param technologyId the primary key of the technology to be disassociated
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the specified technology is not associated
     * with the active version, or if the association cannot be removed
     */
    public void removeTechnology(long technologyId)
            throws RemoteException, CatalogException;

    /**
     * Removes a development role from the active version of the component
     * managed by this instance.
     *
     * @param memberRoleId the primary key of the development role to be removed
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the development role cannot be removed
     */
    public void removeTeamMemberRole(long memberRoleId)
            throws RemoteException, CatalogException;

    /**
     * Removes a dependency from the active version of the component managed by
     * this instance.
     *
     * @param dependeeId the primary key of the component version to remove the
     * dependence from
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the specified version is not a dependee, or
     * if the dependency cannot be removed
     */
    public void removeDependency(long dependeeId)
            throws RemoteException, CatalogException;

    /**
     * Removes a document from the active version of the component managed by
     * this instance.
     *
     * @param documentId the primary key of the document to be removed
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the document cannot be removed
     * @return the url of the document to remove
     */
    public String removeDocument(long documentId)
            throws RemoteException, CatalogException;

    /**
     * Removes an example from the active version of the component managed by
     * this instance.
     *
     * @param exampleId the primary key of the example to be removed
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the example cannot be removed
     */
    public void removeExample(long exampleId)
            throws RemoteException, CatalogException;

    /**
     * Removes a download location from the active version of the component
     * managed by this instance.
     *
     * @param downloadId the primary key of the download location to be removed
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the download location cannot be removed
     */
    public void removeDownload(long downloadId)
            throws RemoteException, CatalogException;

    /**
     * Removes a review from the active version of the component managed by this
     * instance.
     *
     * @param reviewId the primary key of the review to be removed
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the review cannot be removed
     */
    public void removeReview(long reviewId)
            throws RemoteException, CatalogException;

    /**
     * Checks if a subject has permission to download the component managed by
     * this instance.
     *
     * @param subject the <code>TCSubject</code> to check
     * @return <code>true</code> if the subject has permission to download the
     * component; <code>false</code> otherwise
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if <code>subject</code> is <code>null</code>, or
     * if the pemission cannot be checked
     */
    public boolean canDownload(TCSubject subject)
            throws RemoteException, CatalogException;

    /**
     * Tracks a download of the version of the component managed by this
     * instance.
     *
     * @param userId the primary key of the user downloading the component
     * @param downloadId the primary key of the download location
     * @param licenseId the primary key of the license level
     * @throws CatalogException if the specified user, download location, or
     * license level cannot be found in the catalog, or if the tracking
     * information cannot be created
     */
    public void trackDownload(long userId, long downloadId, long licenseId)
            throws RemoteException, CatalogException;

    public void updateDates()
            throws RemoteException, CatalogException;

    /**
     * Gets the project id for the project of the given type associated with this component version
     * @param projectType design or development
     * @return the project id or -1 if no project was found
     * @throws RemoteException
     * @throws CatalogException
     */
    public long getProjectId(long projectType) throws RemoteException, CatalogException;

    /**
     * Determines whether or not the project of the given type for this component version has yielded a
     * publicly readable aggregation worksheet
     * @param projectType design or development
     * @return true if there is an aggregation worksheet for the given type, false otherwise
     * @throws RemoteException
     * @throws CatalogException
     */
    public boolean isAggregated(long projectType) throws RemoteException, CatalogException;
}
