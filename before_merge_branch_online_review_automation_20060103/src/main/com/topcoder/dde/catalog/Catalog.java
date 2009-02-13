/*
 * Catalog.java
 * 26 August 2002
 * 1.0
 *
 * Copyright(c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.catalog;

import javax.naming.NamingException;
import java.rmi.RemoteException;
import java.sql.SQLException;
import java.util.Collection;


/**
 * The remote interface of the Catalog Enterprise Java Bean (EJB). CatalogEJB
 * and ComponentManagerEJB constitute the Component Catalog of the Distributed
 * Development Environment. CatalogEJB contains the methods that a client can
 * use to find, retrieve, request, and approve components. It also contains
 * methods that enable the administration of the universal categories, roles,
 * and technologies that components may be associated with. The actual
 * management of these associations and other properties of components is
 * accomplished through ComponentManagerEJB.
 *
 * @version 1.0, 26 August 2002
 * @author  Albert Mao
 * @see     CatalogHome
 * @see     ComponentManager
 */
public interface Catalog extends javax.ejb.EJBObject {

    long NET_CATALOG = 5801777;
    long JAVA_CATALOG = 5801776;
    long FLASH_CATALOG = 8459260;
    long NET_CUSTOM_CATALOG = 5801779;
    long JAVA_CUSTOM_CATALOG = 5801778;
    long APPLICATION_CATALOG = 9926572;

    /**
     * <p>Performs a search on the catalog. All options are represented by a
     * <code>String</code>, mapped to a value as appropriate.</p>
     * <p>Supported options:</p>
     * <dl><dt>buffer (<code>Integer</code>)</dt><dd>the size of the buffer for
     * the returned results</dd></dl>
     *
     * @param searchtext the search text
     * @param options the search options, or <code>null</code> for default
     * options
     * @return a <code>CatalogSearchView</code> object that reveals the matching
     * components
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if <code>searchtext</code> is <code>null</code>,
     * if an invalid value for an option is specified, or if the search cannot
     * be performed
     */
    public CatalogSearchView search(String searchtext, java.util.Map options)
            throws RemoteException, CatalogException;

    public CatalogSearchView searchComponents(String searchtext, long[] status, long[] catalog, long[] technology, String[] category)
            throws RemoteException, CatalogException, NamingException, SQLException;

    public String[] getUniqueCategoryNames(boolean includeBaseCategories) throws RemoteException, NamingException, SQLException;

    public Category[] getBaseCategories() throws RemoteException, NamingException, SQLException;

    public Technology[] getAllTechnologies() throws RemoteException, NamingException, SQLException;

    /**
     * Returns summary information for the current version of each components in
     * the specified category. The summaries are returned in alphabetical order
     * by component name.
     *
     * @param categoryId the primary key of the category
     * @return a <code>Collection</code> of <code>ComponentSummary</code>
     * objects
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the specified category does not exist in the
     * catalog, or if the summary information cannot be retrieved
     */
    public Collection getCategoryComponents(long categoryId)
            throws RemoteException, CatalogException;

    /**
     * Returns summary information for the current version of each components in
     * the specified category. The summaries are returned in alphabetical order
     * by component name.
     *
     * @param categoryId the primary key of the category
     * @return a CategorySummary containing all the ComponentSummaries of the specified category recursively.
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the specified category does not exist in the
     * catalog, or if the summary information cannot be retrieved
     */
    public CategorySummary getCategorySummary(long categoryId)
            throws RemoteException, CatalogException, SQLException, NamingException;

    public ComponentSummary[] getAllComponents()
            throws RemoteException, CatalogException, SQLException, NamingException;

    /**
     * Returns the summary information for the current version of each component
     * with the specified status. The status constants are defined in {@link
     * ComponentInfo ComponentInfo}. The summaries are returned in alphabetical
     * order by component name.
     *
     * @param status the status value to obtain components for
     * @return a <code>Collection</code> of <code>ComponentSummary</code>
     * objects
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the summary information cannot be retrieved
     */
    public Collection getComponentsByStatus(long status)
            throws RemoteException, CatalogException, SQLException, NamingException;

    /**
     * Returns the summary information for the current version of each component
     * with the specified status and catalog. The status constants are defined in {@link
     * ComponentInfo ComponentInfo}. The summaries are returned in alphabetical
     * order by component name.
     *
     * @param status the status value to obtain components for
     * @param catalogId the catalog value to obtain components for
     * @return a <code>Collection</code> of <code>ComponentSummary</code>
     * objects
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the summary information cannot be retrieved
     */
    public Collection getComponentsByStatusAndCatalog(long status, long catalogId)
            throws RemoteException, CatalogException, SQLException, NamingException;

    /**
     * Returns the summary information for the current version of the specified
     * component.
     *
     * @param componentId the primary key of the component
     * @return a <code>ComponentSummary</code> object
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the specified component cannot be found in
     * the catalog, or if the summary information cannot be retrieved
     */
    public ComponentSummary getComponent(long componentId)
            throws RemoteException, CatalogException, NamingException, SQLException;

    /**
     * Returns the detailed information for the current version of the specified
     * component.
     *
     * @param componentId the primary key of the component
     * @return a <code>ComponentSummary</code> object
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the specified component cannot be found in
     * the catalog, or if the summary information cannot be retrieved
     */
    public ComponentDetail getComponentDetail(long componentId)
            throws RemoteException, CatalogException, SQLException, NamingException;

    /**
     * Returns the detailed information for the given version of the specified
     * component.
     *
     * @param componentId the primary key of the component
     * @param version the version number to get
     * @return a <code>ComponentSummary</code> object
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the specified component cannot be found in
     * the catalog, or if the summary information cannot be retrieved
     */
    public ComponentDetail getComponentDetail(long componentId, long version)
            throws RemoteException, CatalogException, SQLException, NamingException;

    /**
     * Submits a request for a component. This method creates an entry for the
     * requested component in the component catalog database. The component will
     * have the status <code>ComponentInfo.REQUESTED</code> until it is
     * approved, declined, or deleted by an administrator. In addition, the
     * initial version of the component and a collaboration forum are also
     * created for the component, and the user that made the request is assigned
     * the Requestor role, with a default rating of 0, for the initial version.
     * The component and version are given the requested attributes and are
     * associated with the specified categories and technologies. The version is
     * given a default price of 0. Finally, a confirmation email is sent to the
     * user who requested the component.
     *
     * @param request a <code>ComponentRequest</code> object that contains the
     * requested attributes of the new component
     * @return a <code>ComponentSummary</code> object for the newly created
     * component and version (this is useful for obtaining the primary keys)
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if <code>request</code> is null, if any of the
     * specified categories or technologies cannot be found in the catalog, or
     * if the component could not be created
     */
    public ComponentSummary requestComponent(ComponentRequest request)
            throws RemoteException, CatalogException;

    /**
     * Approves the specified component. The component's status is set to
     * <code>ComponentInfo.APPROVED</code>. If the component's status was not
     * previously set to <code>ComponentInfo.APPROVED</code>, the component is
     * also indexed in the search engine.
     *
     * @param componentId the primary key of the component to be approved
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the specified component cannot be found in
     * the catalog
     */
    public void approveComponent(long componentId)
            throws RemoteException, CatalogException;

    /**
     * Declines the specified component. The component's status is set to
     * <code>ComponentInfo.DUPLICATE</code> if <code>isDuplicate</code> is
     * <code>true</code>; <code>ComponentInfo.DECLINED</code> otherwise. The
     * component is also deleted from the search engine index.
     *
     * @param componentId the primary key of the component to decline
     * @param isDuplicate whether or not the component is being declined because
     * it is a duplicate of another component
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the specified component cannot be found in
     * the catalog
     */
    public void declineComponent(long componentId, boolean isDuplicate)
            throws RemoteException, CatalogException;

    /**
     * Removes the specified component. The component's status is set to
     * <code>ComponentInfo.DELETED</code>. The component is also deleted from
     * the search engine index.
     *
     * @param componentId the primary key of the component to remove
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the specified component cannot be found in
     * the catalog
     */
    public void removeComponent(long componentId)
            throws RemoteException, CatalogException;

    /**
     * Returns all the active (non-deleted) top-level categories that are
     * defined in the catalog. A category is is a top-level category if no other
     * category contains it as a subdirectory. The categories are returned in
     * alphabetical order by name.
     *
     * @return a <code>Collection</code> of <code>Category</code> objects that
     * represent the categories in the catalog
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the category information cannot be retrieved
     */
    public Collection getCategories()
            throws RemoteException, CatalogException;

    /**
     * Returns information on the specified category.
     *
     * @param categoryId the primary key of the category
     * @return a <code>Category</code> object that represents the specified
     * category
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the specified category cannot be found in the
     * catalog
     */
    public Category getCategory(long categoryId)
            throws RemoteException, CatalogException;

    /**
     * Returns the path of the specified category. The path begins with the
     * top-level container of the specified category, and ends with the category
     * itself.
     *
     * @param categoryId the primary key of the category
     * @return a <code>Collection</code> of <code>Category</code> objects that
     * represent the path in the category hierarchy ending with the specified
     * category
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the specified category cannot be found in
     * the catalog, or if the category information cannot be retrieved
     */
    public Collection getCategoryPath(long categoryId)
            throws RemoteException, CatalogException;

    /**
     * Returns all the active (non-deleted) roles that are defined in the
     * catalog. The roles are returned in alphabetical order by name.
     *
     * @return a <code>Collection</code> of <code>Role</code> objects that
     * represent the roles defined in the catalog
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the role information cannot be retrieved
     */
    public Collection getRoles()
            throws RemoteException, CatalogException;

    /**
     * Returns information on the specified role.
     *
     * @param roleId the primary key of the role
     * @return a <code>Role</code> object that represents the specified role
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the specified role cannot be found in the
     * catalog
     */
    public Role getRole(long roleId)
            throws RemoteException, CatalogException;

    /**
     * Returns all the active (non-deleted) technologies that are defined in the
     * catalog. The technologies are returned in alphabetical order by name.
     *
     * @return a <code>Collection</code> of <code>Technology</code> objects that
     * represent the technologies defined in the catalog
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the technology information cannot be
     * retrieved
     */
    public Collection getTechnologies()
            throws RemoteException, CatalogException;

    /**
     * Returns information on the specified technology.
     *
     * @param technologyId the primary key of the technology
     * @return a <code>Technology</code> object that represents the specified
     * technology
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the specified technology cannot be found in
     * the catalog
     */
    public Technology getTechnology(long technologyId)
            throws RemoteException, CatalogException;

    /**
     * Returns all the active (non-deleted) license levels that are defined in
     * the catalog. The license levels are returned in order of ascending price
     * multiplier.
     *
     * @return a <code>Collection</code> of <code>LicenseLevel</code> objects
     * that represent the license levels defined in the catalog
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the license level information cannot be
     * retrieved
     */
    public Collection getLicenseLevels()
            throws RemoteException, CatalogException;

    /**
     * Returns information on the specified license level.
     *
     * @param licenseId the primary key of the license level
     * @return a <code>LicenseLevel</code> object that represents the specified
     * license level
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the specified license level cannot be found
     * in the catalog
     */
    public LicenseLevel getLicenseLevel(long licenseId)
            throws RemoteException, CatalogException;

    /**
     * Returns information on the specified document.
     *
     * @param documentId the primary key of the document
     * @return a <code>Document</code> object that represents the specified
     * document
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the specified document cannot be found in the
     * catalog, or if the document information cannot be retrieved
     */
    public Document getDocument(long documentId)
            throws RemoteException, CatalogException;

    /**
     * Returns information on the specified download location.
     *
     * @param downloadId the primary key of the download location
     * @return a <code>Download</code> object that represents the specified
     * download location
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the specified download cannot be found in the
     * catalog, or if the download information cannot be retrieved
     */
    public Download getDownload(long downloadId)
            throws RemoteException, CatalogException;

    /**
     * Adds a subcategory to the catalog.
     *
     * @param parentId the primary key of the parent category, or -1 to indicate
     * that the category should be a top-level category
     * @param category a <code>Category</code> object that represents the
     * category to be added
     * @return a <code>Category</code> object that represents the newly added
     * category (this is useful for obtaining its primary key)
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if <code>category</code> is <code>null</code>,
     * if <code>category</code> represents a category that was returned by the
     * catalog (instead of constructed by the client), or if the specified
     * parent category cannot be found in the
     * catalog
     */
    public Category addCategory(long parentId, Category category)
            throws RemoteException, CatalogException;

    /**
     * Addes a category to the catalog. Equivalent to <code>addCategory(-1,
     * category</code>.
     *
     * @param category a <code>Category</code> object that represents the
     * category to be added
     * @return a <code>Category</code> object that represents the newly added
     * category (this is useful for obtaining its primary key)
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if <code>category</code> is <code>null</code>,
     * or if <code>category</code> represents a category that was returned by
     * the catalog (instead of constructed by the client)
     */
    public Category addCategory(Category category)
            throws RemoteException, CatalogException;

    /**
     * Adds a role to the catalog.
     *
     * @param role a <code>Role</code> object that represents the role to be
     * added
     * @return a <code>Role</code> object that represents the newly added role
     * (this is useful for obtaining its primary key)
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if <code>role</code> is <code>null</code>, or if
     * <code>role</code> represents a role that was returned by the catalog
     * (instead of constructed by the client)
     */
    public Role addRole(Role role)
            throws RemoteException, CatalogException;

    /**
     * Adds a technology to the catalog.
     *
     * @param technology a <code>Technology</code> object that represents the
     * technology to be added
     * @return a <code>Technology</code> object that represents the newly added
     * technology (this is useful for obtaining its primary key)
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if <code>technology</code> is <code>null</code>,
     * or if <code>technology</code> represents a technology that was returned
     * by the catalog (instead of constructed by the client)
     */
    public Technology addTechnology(Technology technology)
            throws RemoteException, CatalogException;

    /**
     * Adds a license level to the catalog.
     *
     * @param license a <code>LicenseLevel</code> object that represents the
     * license level to be added
     * @return a <code>LicenseLevel</code> object that represents the newly
     * added
     * license level (this is useful for obtaining its primary key)
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if <code>license</code> is <code>null</code>,
     * or if <code>license</code> represents a license level that was returned
     * by the catalog (instead of constructed by the client)
     */
    public LicenseLevel addLicenseLevel(LicenseLevel license)
            throws RemoteException, CatalogException;

    /**
     * Updates a category in the catalog. Only the properties of the specified
     * category are affected; this method cannot be used to modify the
     * properties or locations of any subcategories.
     *
     * @param category the <code>Category</code> object to be updated
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if <code>category</code> is <code>null</code>,
     * or if <code>category</code> represents a category that cannot be found in
     * the catalog (the category must exist before it can be updated)
     */
    public void updateCategory(Category category)
            throws RemoteException, CatalogException;

    /**
     * Updates a role in the catalog.
     *
     * @param role the <code>Role</code> object to be updated
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if <code>role</code> is <code>null</code>, or if
     * <code>role</code> represents a role that cannot be found in the catalog
     * (the role must exist before it can be updated)
     */
    public void updateRole(Role role)
            throws RemoteException, CatalogException;

    /**
     * Updates a technology in the catalog.
     *
     * @param technology the <code>Technology</code> object to be updated
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if <code>technology</code> is <code>null</code>,
     * or if <code>technology</code> represents a technology that cannot be
     * found in the catalog (the technology must exist before it can be updated)
     */
    public void updateTechnology(Technology technology)
            throws RemoteException, CatalogException;

    /**
     * Updates a license level in the catalog.
     *
     * @param license level the <code>LicenseLevel</code> object to be updated
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if <code>license</code> is <code>null</code>,
     * or if <code>license</code> represents a license level that cannot be
     * found in the catalog (the license level must exist before it can be
     * updated)
     */
    public void updateLicenseLevel(LicenseLevel license)
            throws RemoteException, CatalogException;

    /**
     * Removes a category and all its subcategories from the catalog. The
     * categories' stati are set to <code>Category.DELETED</code>.
     *
     * @param categoryId the primary key of the category to be removed
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the specified category cannot be found in the
     * catalog
     */
    public void removeCategory(long categoryId)
            throws RemoteException, CatalogException;

    /**
     * Removes a role from the catalog. The role's status is set to
     * <code>Role.DELETED</code>.
     *
     * @param roleId the primary key of the role to be removed
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the specified role cannot be found in the
     * catalog
     */
    public void removeRole(long roleId)
            throws RemoteException, CatalogException;

    /**
     * Removes a technology from the catalog. The technology's status is set to
     * <code>Technology.DELETED</code>.
     *
     * @param technologyId the primary key of the technology to be removed
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the specified technology cannot be found in
     * the catalog
     */
    public void removeTechnology(long technologyId)
            throws RemoteException, CatalogException;

    /**
     * Removes a license level from the catalog. The license level's status is
     * set to <code>LicenseLevel.DELETED</code>.
     *
     * @param licenseId the primary key of the license level to be removed
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CatalogException if the specified license level cannot be found
     * in the catalog
     */
    public void removeLicenseLevel(long licenseId)
            throws RemoteException, CatalogException;


}
