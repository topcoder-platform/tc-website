/*
 * CatalogBean.java
 * 26 August 2002
 * 1.0
 *
 * Copyright (c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.catalog;

import com.topcoder.dde.catalog.*;
import com.topcoder.dde.*;
import com.topcoder.dde.forum.*;
import com.topcoder.dde.user.*;
import com.topcoder.forum.*;
import com.topcoder.dde.persistencelayer.interfaces.*;
import com.topcoder.util.config.*;
import com.topcoder.file.render.*;
import com.topcoder.message.email.*;
import com.topcoder.search.*;
import com.topcoder.security.*;
import com.topcoder.security.admin.*;
import com.topcoder.security.policy.*;
import com.topcoder.apps.review.projecttracker.ProjectTracker;
import com.topcoder.apps.review.projecttracker.ProjectTrackerHome;
import com.topcoder.apps.review.document.DocumentManager;
import com.topcoder.apps.review.document.DocumentManagerHome;

import java.util.*;
import java.util.Date;
import java.io.*;
import java.sql.*;
import javax.ejb.*;
import javax.naming.*;
import javax.rmi.PortableRemoteObject;
import java.rmi.RemoteException;
import javax.xml.transform.*;
import javax.xml.transform.stream.*;
import javax.sql.DataSource;


/**
 * The implementation of the methods of CatalogEJB.
 *
 * @version 1.0, 26 August 2002
 * @author  Albert Mao
 * @see     Catalog
 * @see     CatalogHome
 */
public class CatalogBean implements SessionBean, ConfigManagerInterface {

    private static org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(CatalogBean.class);

    private static final String
        CONFIG_NAMESPACE = "com.topcoder.dde.catalog.CatalogBean";

    private SessionContext ejbContext;
    private LocalDDECompCatalogHome catalogHome;
    private LocalDDECompVersionsHome versionsHome;
    private LocalDDECompCategoriesHome compcatsHome;
    private LocalDDECompKeywordsHome keywordsHome;
    private LocalDDECompTechnologyHome comptechHome;
    private LocalDDECompForumXrefHome compforumHome;
    private LocalDDECategoriesHome categoriesHome;
    private LocalDDETechnologyTypesHome technologiesHome;
    private LocalDDERolesHome rolesHome;
    private LocalDDELicenseLevelHome licenseHome;
    private LocalDDECompDocumentationHome docHome;
    private LocalDDECompDownloadHome downloadHome;
    private LocalDDEUserRoleHome userroleHome;
    private LocalDDEUserMasterHome userHome;
    private ForumAdminLocalHome forumadminHome;
    private UserManagerLocalHome usermanHome;
    private PrincipalMgrRemoteHome principalmgrHome;
    private PolicyMgrRemoteHome policymgrHome;
    private ProjectTrackerHome projectTrackerHome;
    private DocumentManagerHome documentManagerHome;
    private PolicyRemoteHome policyHome;

    public CatalogBean() {}


    private static Connection getConnection() throws SQLException, NamingException {

        return getDataSource().getConnection();
    }

    private static DataSource getDataSource() throws NamingException {

        return (DataSource) (new InitialContext()).lookup("java:comp/env/jdbc/DefaultDS");
    }

    public void ejbCreate() {
        try {
            Context homeBindings = new InitialContext();

            catalogHome = (LocalDDECompCatalogHome)
                homeBindings.lookup(LocalDDECompCatalogHome.EJB_REF_NAME);
            versionsHome = (LocalDDECompVersionsHome)
                homeBindings.lookup(LocalDDECompVersionsHome.EJB_REF_NAME);
            compcatsHome = (LocalDDECompCategoriesHome)
                homeBindings.lookup(LocalDDECompCategoriesHome.EJB_REF_NAME);
            keywordsHome = (LocalDDECompKeywordsHome)
                homeBindings.lookup(LocalDDECompKeywordsHome.EJB_REF_NAME);
            comptechHome = (LocalDDECompTechnologyHome)
                homeBindings.lookup(LocalDDECompTechnologyHome.EJB_REF_NAME);
            compforumHome = (LocalDDECompForumXrefHome)
                homeBindings.lookup(LocalDDECompForumXrefHome.EJB_REF_NAME);
            categoriesHome = (LocalDDECategoriesHome)
                homeBindings.lookup(LocalDDECategoriesHome.EJB_REF_NAME);
            technologiesHome = (LocalDDETechnologyTypesHome)
                homeBindings.lookup(LocalDDETechnologyTypesHome.EJB_REF_NAME);
            rolesHome = (LocalDDERolesHome)
                homeBindings.lookup(LocalDDERolesHome.EJB_REF_NAME);
            licenseHome = (LocalDDELicenseLevelHome)
                homeBindings.lookup(LocalDDELicenseLevelHome.EJB_REF_NAME);
            docHome = (LocalDDECompDocumentationHome)
                homeBindings.lookup(LocalDDECompDocumentationHome.EJB_REF_NAME);
            downloadHome = (LocalDDECompDownloadHome)
                homeBindings.lookup(LocalDDECompDownloadHome.EJB_REF_NAME);
            userroleHome = (LocalDDEUserRoleHome)
                homeBindings.lookup(LocalDDEUserRoleHome.EJB_REF_NAME);
            userHome = (LocalDDEUserMasterHome)
                homeBindings.lookup(LocalDDEUserMasterHome.EJB_REF_NAME);
            forumadminHome = (ForumAdminLocalHome)
                homeBindings.lookup(ForumAdminLocalHome.EJB_REF_NAME);
            usermanHome = (UserManagerLocalHome)
                homeBindings.lookup(UserManagerLocalHome.EJB_REF_NAME);
/*
            /** SECURITY MANAGER
    		Hashtable principalMgrEnvironment=new Hashtable();
    		principalMgrEnvironment.put(Context.INITIAL_CONTEXT_FACTORY, "org.jnp.interfaces.NamingContextFactory");
    		principalMgrEnvironment.put(Context.PROVIDER_URL, getConfigValue("securitymanagerip"));
    		Context principalMgrContext = new InitialContext(principalMgrEnvironment);
*/

            principalmgrHome = (PrincipalMgrRemoteHome) PortableRemoteObject.
                narrow(homeBindings.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME),
                PrincipalMgrRemoteHome.class);
            policymgrHome = (PolicyMgrRemoteHome) PortableRemoteObject.narrow(
                homeBindings.lookup(PolicyMgrRemoteHome.EJB_REF_NAME),
                PolicyMgrRemoteHome.class);
            policyHome = (PolicyRemoteHome)
                   PortableRemoteObject.narrow(
                       homeBindings.lookup(PolicyRemoteHome.EJB_REF_NAME),
                       PolicyRemoteHome.class);

            // Online Review
            projectTrackerHome = (ProjectTrackerHome) PortableRemoteObject.narrow(
                    homeBindings.lookup(ProjectTrackerHome.EJB_REF_NAME),
                    ProjectTrackerHome.class);
            documentManagerHome = (DocumentManagerHome) PortableRemoteObject.narrow(
                    homeBindings.lookup(DocumentManagerHome.EJB_REF_NAME),
                    DocumentManagerHome.class);
        } catch(NamingException exception) {
            throw new EJBException(
            "Unable to access persistence layer: " + exception.toString());
        }

    }

    // Convenience method to generate a ComponentSummary from beans
    public static ComponentSummary generateSummary(LocalDDECompCatalog comp,
            LocalDDECompVersions ver) {
        /*
         * The version text must be trim()ed because the database currently
         * stores it as a fixed-length string.  The trim() should be removed
         * once this is corrected.
         */
        return new ComponentSummary(
            ((Long) comp.getPrimaryKey()).longValue(),
            ((Long) ver.getPrimaryKey()).longValue(),
            ver.getVersion(), comp.getComponentName(),
            ver.getVersionText().trim(),
            ver.getComments(), comp.getShortDesc(), comp.getDescription(),
            ver.getPhaseId(), new Date(ver.getPhaseTime().getTime()),
            ver.getPrice(), comp.getStatusId(), comp.getRootCategory());
    }

    public CatalogSearchView search(String searchtext, Map options)
           throws CatalogException {
        if (searchtext == null) {
            throw new CatalogException("Null specified for search text");
        }
        int buffer = 0;
        if (options != null && options.containsKey("buffer")) {
            Object value = options.get("buffer");
            if (value instanceof Integer) {
                buffer = ((Integer) value).intValue();
            } else {
                throw new CatalogException(
                "Value mapped to \"buffer\" option must be of type Integer");
            }
            if (buffer <= 0) {
                throw new CatalogException(
                "Negative number or zero specified for buffer size");
            }
        }
        SearchIterator matches =
            CatalogSearchEngine.getInstance().search(searchtext, buffer);
        List results = new ArrayList();
        try {
            while (matches.hasNext()) {
                long componentId = matches.next();
                LocalDDECompCatalog foundComp;
                try {
                    foundComp =
                        catalogHome.findByPrimaryKey(new Long(componentId));
                } catch(ObjectNotFoundException exception) {
                    throw new CatalogException(
                    "Component returned by search does not exist in catalog: "
                    + exception.toString());
                } catch(FinderException exception) {
                    throw new CatalogException(exception.toString());
                }
                LocalDDECompVersions currentVer;
                try {
                    currentVer = versionsHome.findByComponentIdAndVersion(
                        componentId, foundComp.getCurrentVersion());
                } catch(FinderException exception) {
                    throw new CatalogException(exception.toString());
                }
                results.add(generateSummary(foundComp, currentVer));
            }
        } finally {
            matches.close();
        }
        return new CatalogSearchView(results);
    }

    public CatalogSearchView searchComponents(String searchtext, long[] phase, long[] catalog, long[] technology, String[] category)
           throws RemoteException, CatalogException, NamingException, SQLException {

        if (searchtext == null) {
            throw new CatalogException("Null specified for search text");
        } else if (phase == null) {
            throw new CatalogException("Null specified for phase");
        } else if (catalog == null) {
            throw new CatalogException("Null specified for catalog");
        } else if (technology == null) {
            throw new CatalogException("Null specified for technology");
        } else if (category == null) {
            throw new CatalogException("Null specified for category");
        }

        searchtext = searchtext.toLowerCase();
        if (searchtext.equals("")) searchtext = "*";

        SearchIterator matches = CatalogSearchEngine.getInstance().search(searchtext, 0);

        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        StringBuffer query = new StringBuffer(2000);
        query.append("SELECT UNIQUE comp.component_id, comp.short_desc, ");
        query.append("       comp.component_name, comp.description,     ");
        query.append("       comp.status_id, v.comp_vers_id,            ");
        query.append("       v.version, v.version_text, v.phase_id,     ");
        query.append("       v.phase_time, v.price, v.comments,         ");
        query.append("       comp.root_category_id                      ");
        query.append("  FROM comp_categories x, comp_versions v,        ");
        query.append("       comp_catalog comp, categories cat          ");
        query.append(" WHERE v.component_id = comp.component_id         ");
        query.append("   AND comp.current_version = v.version           ");
        query.append("   AND comp.status_id = ?                         ");
        query.append("   AND ( NOT ( cat.status_id = ? ) )              ");
        query.append("   AND x.component_id = comp.component_id         ");
        query.append("   AND x.category_id = cat.category_id            ");

        ArrayList elements = new ArrayList();
        elements.add(new Long(ComponentInfo.APPROVED));
        elements.add(new Long(Category.DELETED));

        if (phase.length > 0) {
            query.append(" AND ( ");
            for (int i = 0; i < phase.length; i++) {
                query.append(" v.phase_id = ? ");
                elements.add(new Long(phase[i]));
                if (i + 1 < phase.length) query.append(" OR ");
            }
            query.append(" ) ");
        }

        if (catalog.length > 0) {
            query.append(" AND ( ");
            for (int i = 0; i < catalog.length; i++) {
                query.append(" comp.root_category_id = ? ");
                elements.add(new Long(catalog[i]));
                if (i + 1 < catalog.length) query.append(" OR ");
            }
            query.append(" ) ");
        }

        if (technology.length > 0) {
            query.append(" AND ( ");
            for (int i = 0; i < technology.length; i++) {
                query.append(" EXISTS ( SELECT comp_tech_id FROM comp_technology ");
                query.append("           WHERE comp_vers_id = v.comp_vers_id    ");
                query.append("             AND technology_type_id = ? ) ");
                elements.add(new Long(technology[i]));
                if (i + 1 < technology.length) query.append(" OR ");
            }
            query.append(" ) ");
        }

        if (category.length > 0) {
            query.append(" AND ( ");
            for (int i = 0; i < category.length; i++) {
                query.append(" cat.category_name = ? ");
                elements.add(category[i]);
                if (i + 1 < category.length) query.append(" OR ");
            }
            query.append(" ) ");
        }
        List matchesCopy = new ArrayList();
        if (matches.hasNext()) {
            Long id = new Long(matches.next());
            matchesCopy.add(id);
            query.append(" AND ( comp.component_id = ? ");
            elements.add(id);
            while (matches.hasNext()) {
                id = new Long(matches.next());
                matchesCopy.add(id);
                query.append(" OR comp.component_id = ? ");
                elements.add(id);
            }
            query.append(" ) ");
        }

        Map hashedResults = new HashMap();

        try {

            c = getConnection();
            ps = c.prepareStatement(query.toString());

            for (int i = 0; i < elements.size(); i++) {
                Object o = elements.get(i);
                if (o instanceof Long) {
                    ps.setLong(i+1, ((Long) o).longValue());
                } else if (o instanceof String) {
                    ps.setString(i+1, (String) o);
                }
            }

            rs = ps.executeQuery();
            while (rs.next()) {
                hashedResults.put(new Long(rs.getLong(1)), new ComponentSummary(rs.getLong(1),
                        rs.getLong(6), rs.getLong(7), rs.getString(3), rs.getString(8),
                        rs.getString(12), rs.getString(2), rs.getString(4), rs.getLong(9),
                        rs.getDate(10), rs.getDouble(11), rs.getLong(5), rs.getLong(13)));
            }

            rs.close();
            rs = null;

            ps.close();
            ps = null;

            c.close();
            c = null;
        } finally {
            try { if (rs != null) { rs.close(); rs = null; } } catch (SQLException e) {}
            try { if (ps != null) { ps.close(); ps = null; } } catch (SQLException e) {}
            try { if (c  != null) {  c.close();  c = null; } } catch (SQLException e) {}
            try { matches.close(); } catch (Exception e) {}
        }

        List results = new ArrayList();
        for (int i = 0; i < matchesCopy.size(); i++) {
            Object o = hashedResults.get(matchesCopy.get(i));
            if (o != null) results.add(o);
        }
        return new CatalogSearchView(results);
    }

//    public CatalogSearchView searchForums(String searchtext) throws CatalogException, NamingException, SQLException {
//
//        if (searchtext == null) {
//            throw new CatalogException("Null specified for search text");
//        }
//
//        StringBuffer query = new StringBuffer(1000);
//        query.append("SELECT f.forum_id, f.create_time, f.closed_time, ")
//
//        Connection c = null;
//        PreparedStatement ps = null;
//        ResultSet rs = null;
//        ArrayList results = new ArrayList();
//
//        try {
//
//            c = getConnection();
//
//            ps = c.prepareStatement(query.toString());
//            ps.executeQuery();
//
//            while (rs.next()) {
//                results.add(new Forum(rs.getLong(1), rs.getDate(2), rs.getDate(3), rs.getLong(4), rs.getLong(5), rs.getString(6)));
//            }
//        }
//    }

    public String[] getUniqueCategoryNames(boolean includeBaseCategories) throws RemoteException, NamingException, SQLException {

        StringBuffer query = new StringBuffer(200);
        query.append("SELECT UNIQUE category_name FROM categories ");
        query.append(" WHERE ( NOT ( status_id = ? ) )              ");
        if (!includeBaseCategories) query.append(" AND ( NOT ( parent_category_id IS NULL ) ) ");
        query.append(" ORDER BY 1 ");

        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList results = new ArrayList();

        try {

            c = getConnection();

            ps = c.prepareStatement(query.toString());
            ps.setLong(1, Category.DELETED);

            rs = ps.executeQuery();
            while (rs.next()) results.add(rs.getString(1));
        } finally {
            try { if (rs != null) { rs.close(); rs = null; } } catch (SQLException e) {}
            try { if (ps != null) { ps.close(); ps = null; } } catch (SQLException e) {}
            try { if (c  != null) {  c.close();  c = null; } } catch (SQLException e) {}
        }

        return (String[]) results.toArray(new String[0]);
    }

    public Category[] getBaseCategories() throws RemoteException, NamingException, SQLException {

        StringBuffer query = new StringBuffer(200);
        query.append("SELECT category_id, category_name, description FROM categories ");
        query.append(" WHERE ( NOT ( status_id = ? ) )                               ");
        query.append("   AND parent_category_id IS NULL                   ORDER BY 2 ");

        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList results = new ArrayList();

        try {

            c = getConnection();

            ps = c.prepareStatement(query.toString());
            ps.setLong(1, Category.DELETED);

            rs = ps.executeQuery();
            while (rs.next()) results.add(new Category(rs.getLong(1), rs.getString(2), rs.getString(3), null));
        } finally {
            try { if (rs != null) { rs.close(); rs = null; } } catch (SQLException e) {}
            try { if (ps != null) { ps.close(); ps = null; } } catch (SQLException e) {}
            try { if (c  != null) {  c.close();  c = null; } } catch (SQLException e) {}
        }

        return (Category[]) results.toArray(new Category[0]);
    }

    public Technology[] getAllTechnologies() throws RemoteException, NamingException, SQLException {

        StringBuffer query = new StringBuffer(200);
        query.append("SELECT technology_type_id, technology_name, description ");
        query.append("  FROM technology_types                                 ");
        query.append(" WHERE ( NOT ( status_id = ? ) )             ORDER BY 2 ");

        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList results = new ArrayList();

        try {

            c = getConnection();

            ps = c.prepareStatement(query.toString());
            ps.setLong(1, Technology.DELETED);

            rs = ps.executeQuery();
            while (rs.next()) results.add(new Technology(rs.getLong(1), rs.getString(2), rs.getString(3)));
        } finally {
            try { if (rs != null) { rs.close(); rs = null; } } catch (SQLException e) {}
            try { if (ps != null) { ps.close(); ps = null; } } catch (SQLException e) {}
            try { if (c  != null) {  c.close();  c = null; } } catch (SQLException e) {}
        }

        return (Technology[]) results.toArray(new Technology[0]);
    }

    public Collection getCategoryComponents(long categoryId)
           throws CatalogException {
        List summaries = new ArrayList();
        Iterator compIterator;
        try {
            compIterator = compcatsHome.findByCategoryId(categoryId).iterator();
        } catch(ObjectNotFoundException exception) {
            throw new CatalogException(
            "Specified category does not exist in the catalog: "
            + exception.toString());
        } catch(FinderException exception) {
            throw new CatalogException(exception.toString());
        }
        while (compIterator.hasNext()) {
            LocalDDECompCatalog comp = ((LocalDDECompCategories)
                compIterator.next()).getCompCatalog();
            LocalDDECompVersions ver;
            try {
                ver = versionsHome.findByComponentIdAndVersion(
                    ((Long) comp.getPrimaryKey()).longValue(),
                    comp.getCurrentVersion());
            } catch(FinderException exception) {
                throw new CatalogException(
                "Failed to retrieve current version information for component "
                + comp.getPrimaryKey() + ": " + exception.toString());
            }
            summaries.add(generateSummary(comp, ver));
        }
        Collections.sort(summaries, new Comparators.ComponentSummarySorter());
        return summaries;
    }

    public CategorySummary getCategorySummary(long categoryId)
            throws RemoteException, CatalogException,
                   NamingException, SQLException {

            Connection c = null;
            c = getConnection();
            try {
                return getCategorySummary(categoryId, c);
            } finally {
                try { if (c != null) { c.close(); c = null; } } catch (SQLException e) {}
            }
    }

    private CategorySummary getCategorySummary(long categoryId, Connection c)
                throws RemoteException, CatalogException, SQLException {

        PreparedStatement ps = null;
        ResultSet rs = null;
        String name = null;
        String description = null;
        List components = new ArrayList();
        List cats = new ArrayList();
        CategorySummary[] categories;

        StringBuffer query = new StringBuffer(200);
        query.append("SELECT category_name, description ");
        query.append("  FROM categories ");
        query.append(" WHERE category_id = ? ");

        try {

            ps = c.prepareStatement(query.toString());
            ps.setLong(1, categoryId);
            rs = ps.executeQuery();

            if (!rs.next()) throw new CatalogException("Category Not Found");
            else {
                name = rs.getString(1);
                description = rs.getString(2);
            }

        } finally {
            try { if (rs != null) { rs.close(); rs = null; } } catch (SQLException e) {}
            try { if (ps != null) { ps.close(); ps = null; } } catch (SQLException e) {}
        }

        query = new StringBuffer(200);
        query.append("SELECT category_id, category_name ");
        query.append("  FROM categories                 ");
        query.append(" WHERE parent_category_id = ?     ");
        query.append("   AND status_id = ?   ORDER BY 2 ");

        try {

            ps = c.prepareStatement(query.toString());
            ps.setLong(1, categoryId);
            ps.setLong(2, Category.ACTIVE);
            rs = ps.executeQuery();

            while (rs.next()) {
                cats.add(new Long(rs.getLong(1)));
            }

        } finally {
            try { if (rs != null) { rs.close(); rs = null; } } catch (SQLException e) {}
            try { if (ps != null) { ps.close(); ps = null; } } catch (SQLException e) {}
        }

        categories = new CategorySummary[cats.size()];
        for (int i = 0; i < cats.size(); i++) {
            categories[i] = getCategorySummary(((Long) cats.get(i)).longValue(), c);
        }

        query = new StringBuffer(600);
        query.append("SELECT comp.component_id, comp.short_desc,    ");
        query.append("       comp.component_name, comp.description, ");
        query.append("       comp.status_id, v.comp_vers_id,        ");
        query.append("       v.version, v.version_text, v.phase_id, ");
        query.append("       v.phase_time, v.price, v.comments,     ");
        query.append("       comp.root_category_id                  ");
        query.append("  FROM comp_categories x, comp_versions v,    ");
        query.append("       comp_catalog comp                      ");
        query.append(" WHERE x.component_id = comp.component_id     ");
        query.append("   AND v.version = comp.current_version       ");
        query.append("   AND v.component_id = comp.component_id     ");
        query.append("   AND comp.status_id = ?                     ");
        query.append("   AND x.category_id  = ?          ORDER BY 3 ");

        try {

            ps = c.prepareStatement(query.toString());
            ps.setLong(1, ComponentInfo.APPROVED);
            ps.setLong(2, categoryId);
            rs = ps.executeQuery();

            while (rs.next()) {
                components.add(new ComponentSummary(rs.getLong(1), rs.getLong(6),
                        rs.getLong(7), rs.getString(3), rs.getString(8), rs.getString(12),
                        rs.getString(2), rs.getString(4), rs.getLong(9), rs.getDate(10),
                        rs.getDouble(11), rs.getLong(5), rs.getLong(13)));
            }

        } finally {
            try { if (rs != null) { rs.close(); rs = null; } } catch (SQLException e) {}
            try { if (ps != null) { ps.close(); ps = null; } } catch (SQLException e) {}
        }

        return new CategorySummary(categoryId, name, description, (ComponentSummary[]) components.toArray(new ComponentSummary [0]), categories);
    }

    public ComponentSummary[] getAllComponents()
                throws RemoteException, CatalogException, SQLException, NamingException {

	    Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List components = new ArrayList();

        StringBuffer query = new StringBuffer(600);
        query.append("SELECT comp.component_id, comp.short_desc,    ");
        query.append("       comp.component_name, comp.description, ");
        query.append("       comp.status_id, v.comp_vers_id,        ");
        query.append("       v.version, v.version_text, v.phase_id, ");
        query.append("       v.phase_time, v.price, v.comments,     ");
        query.append("       comp.root_category_id                  ");
        query.append("  FROM comp_versions v, comp_catalog comp     ");
        query.append(" WHERE v.version = comp.current_version       ");
        query.append("   AND v.component_id = comp.component_id     ");
        query.append("   AND comp.status_id = ?          ORDER BY 3 ");

        try {

            c = getConnection();

            ps = c.prepareStatement(query.toString());
            ps.setLong(1, ComponentInfo.APPROVED);
            rs = ps.executeQuery();

            while (rs.next()) {
                components.add(new ComponentSummary(rs.getLong(1), rs.getLong(6),
                        rs.getLong(7), rs.getString(3), rs.getString(8), rs.getString(12),
                        rs.getString(2), rs.getString(4), rs.getLong(9), rs.getDate(10),
                        rs.getDouble(11), rs.getLong(5), rs.getLong(13)));
            }

        } finally {
            try { if (rs != null) { rs.close(); rs = null; } } catch (SQLException e) {}
            try { if (ps != null) { ps.close(); ps = null; } } catch (SQLException e) {}
            try { if (c  != null) {  c.close();  c = null; } } catch (SQLException e) {}
        }

        return (ComponentSummary[]) components.toArray(new ComponentSummary[0]);
    }

    public ComponentDetail getComponentDetail(long componentId)
            throws RemoteException, CatalogException, SQLException, NamingException {

        return getComponentDetail(componentId, -1);
    }

    public ComponentDetail getComponentDetail(long componentId, long version)
            throws RemoteException, CatalogException, SQLException, NamingException {

        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ComponentInfo info = null;
        ComponentSummary summary = null;
        ComponentVersionInfo versionInfo = null;
        Document[] docs = null;
        Technology[] techs = null;
        Forum[] forums = null;
        TeamMemberRole[] members = null;
        ComponentSummary[] dependencies = null;
        StringBuffer keywords = new StringBuffer(100);

        try {

            c = getConnection();

            StringBuffer query = new StringBuffer(100);
            query.append("SELECT keyword FROM comp_keywords WHERE component_id = ? ");

            try {

                ps = c.prepareStatement(query.toString());
                ps.setLong(1, componentId);
                rs = ps.executeQuery();

                List keys = new ArrayList();
                while (rs.next()) keys.add(rs.getString(1));

                for (int i = 0; i < keys.size(); i++) {
                    keywords.append(keys.get(i));
                    if (i + 1 < keys.size()) keywords.append(", ");
                }

            } finally {
                try { if (rs != null) { rs.close(); rs = null; } } catch (Exception e) {}
                try { if (ps != null) { ps.close(); ps = null; } } catch (Exception e) {}
            }


            query = new StringBuffer(600);
            query.append("SELECT c.component_id, c.short_desc, c.component_name, ");
            query.append("       c.description, c.function_desc, c.status_id,    ");
            query.append("       v.comp_vers_id, v.version, v.version_text,      ");
            query.append("       v.phase_id, v.phase_time, v.price, v.comments,  ");
            query.append("       c.root_category_id                              ");
            query.append("  FROM comp_catalog c, comp_versions v                 ");
            query.append(" WHERE v.component_id = c.component_id                 ");
            query.append("   AND c.component_id = ?                              ");
            if (version < 0) query.append("   AND c.current_version = v.version ");
            else query.append("   AND ? = v.version ");
            try {

                ps = c.prepareStatement(query.toString());
                ps.setLong(1, componentId);
                if (version >= 0) ps.setLong(2, version);
                rs = ps.executeQuery();

                if (!rs.next()) throw new CatalogException("Component Not Found");
                else {
                    info = new ComponentInfo(rs.getLong(1), rs.getLong(7), rs.getString(3),
                            rs.getString(2), rs.getString(4), rs.getString(5),
                            keywords.toString(), rs.getLong(6));
                    summary = new ComponentSummary(rs.getLong(1), rs.getLong(7),
                            rs.getLong(8), rs.getString(3), rs.getString(9),
                            rs.getString(13), rs.getString(2), rs.getString(4),
                            rs.getLong(10), rs.getDate(11), rs.getDouble(12),
                            rs.getLong(6), rs.getLong(14));
                    versionInfo = new ComponentVersionInfo(rs.getLong(7), rs.getLong(8),
                            rs.getString(9), rs.getString(13), rs.getLong(10),
                            rs.getDate(11), rs.getDouble(12));
                }

            } finally {
                try { if (rs != null) { rs.close(); rs = null; } } catch (Exception e) {}
                try { if (ps != null) { ps.close(); ps = null; } } catch (Exception e) {}
            }


            query = new StringBuffer(500);
            query.append("SELECT f.forum_id, f.create_time, f.closed_time, ");
            query.append("       f.status_id, v.version, v.version_text    ");
            query.append("  FROM forum_master f, comp_versions v,          ");
            query.append("       comp_forum_xref x, comp_catalog c         ");
            query.append(" WHERE x.forum_id = f.forum_id                   ");
            query.append("   AND x.comp_vers_id = v.comp_vers_id           ");
            query.append("   AND c.component_id = ?                        ");
            query.append("   AND c.component_id = v.component_id           ");
            query.append("   AND ( NOT ( f.status_id = ? ) )               ");
            if (version < 0) query.append("   AND c.current_version = v.version ");
            else query.append("   AND ? = v.version ");

            try {

                ps = c.prepareStatement(query.toString());
                ps.setLong(1, componentId);
                ps.setLong(2, Forum.DELETED);
                if (version >= 0) ps.setLong(3, version);
                rs = ps.executeQuery();

                List list = new ArrayList();
                while (rs.next()) list.add(new Forum(rs.getLong(1), rs.getDate(2),
                        rs.getDate(3), rs.getLong(4), rs.getLong(5), rs.getString(6)));

                forums = (Forum[]) list.toArray(new Forum[0]);

            } finally {
                try { if (rs != null) { rs.close(); rs = null; } } catch (Exception e) {}
                try { if (ps != null) { ps.close(); ps = null; } } catch (Exception e) {}
            }


            query = new StringBuffer(500);
            query.append("SELECT t.technology_type_id, t.technology_name,    ");
            query.append("       t.description                               ");
            query.append("  FROM technology_types t, comp_technology x,     ");
            query.append("       comp_versions v, comp_catalog c             ");
            query.append(" WHERE t.technology_type_id = x.technology_type_id ");
            query.append("   AND v.comp_vers_id = x.comp_vers_id             ");
            query.append("   AND c.component_id = ?                          ");
            query.append("   AND c.component_id = v.component_id             ");
            query.append("   AND ( NOT ( t.status_id = ? ) )                 ");
            if (version < 0) query.append("   AND c.current_version = v.version    ORDER BY 2 ");
            else query.append("   AND ? = v.version    ORDER BY 2 ");

            try {

                ps = c.prepareStatement(query.toString());
                ps.setLong(1, componentId);
                ps.setLong(2, Technology.DELETED);
                if (version >= 0) ps.setLong(3, version);
                rs = ps.executeQuery();

                List list = new ArrayList();
                while (rs.next()) list.add(new Technology(rs.getLong(1),
                        rs.getString(2), rs.getString(3)));

                techs = (Technology[]) list.toArray(new Technology[0]);

            } finally {
                try { if (rs != null) { rs.close(); rs = null; } } catch (Exception e) {}
                try { if (ps != null) { ps.close(); ps = null; } } catch (Exception e) {}
            }


            query = new StringBuffer(500);
            query.append("SELECT d.document_id, d.document_name,        ");
            query.append("       d.url, d.document_type_id              ");
            query.append("  FROM comp_documentation d, comp_versions v, ");
            query.append("       comp_catalog c                         ");
            query.append(" WHERE d.comp_vers_id = v.comp_vers_id        ");
            query.append("   AND c.component_id = v.component_id        ");
            query.append("   AND c.component_id = ?                     ");
            if (version < 0) query.append("   AND c.current_version = v.version  ORDER BY 4, 2 ");
            else query.append("   AND ? = v.version     ORDER BY 4, 2 ");

            try {

                ps = c.prepareStatement(query.toString());
                ps.setLong(1, componentId);
                if (version >= 0) ps.setLong(2, version);
                rs = ps.executeQuery();

                List list = new ArrayList();
                while (rs.next()) list.add(new Document(rs.getLong(1), rs.getString(2),
                        rs.getString(3), rs.getLong(4)));

                long compVersId = versionInfo.getVersionId();
                if (isAggregated(1, compVersId)) {
                    list.add(new Document("Aggregate Design Scorecard",
                                          "/review/publicaggregation.do?id=" + getProjectId(1, compVersId),
                                          Document.OTHER));
                }
                if (isAggregated(2, compVersId)) {
                    list.add(new Document("Aggregate Development Scorecard",
                                          "/review/publicaggregation.do?id=" + getProjectId(2, compVersId),
                                          Document.OTHER));
                }

                docs = (Document[]) list.toArray(new Document[0]);

            } finally {
                try { if (rs != null) { rs.close(); rs = null; } } catch (Exception e) {}
                try { if (ps != null) { ps.close(); ps = null; } } catch (Exception e) {}
            }


            query = new StringBuffer(500);
            query.append("SELECT ur.user_role_id, ur.login_id, s.user_id,                ");
            query.append("       r.role_id, r.role_name, r.description, ur.tcs_rating    ");
            query.append("  FROM user_role ur, roles r, comp_catalog c, comp_versions v,  ");
            query.append("       security_user s                                         ");
            query.append(" WHERE r.role_id = ur.role_id                                  ");
            query.append("   AND c.component_id = ? AND c.component_id = v.component_id  ");
            query.append("   AND s.login_id = ur.login_id                                ");
            if (version < 0) query.append("   AND c.current_version = v.version          ");
            else query.append("   AND ? = v.version                          ");
            query.append("   AND ur.comp_vers_id = v.comp_vers_id            ORDER BY 3 ");

            try {

                ps = c.prepareStatement(query.toString());
                ps.setLong(1, componentId);
                if (version >= 0) ps.setLong(2, version);
                rs = ps.executeQuery();

                List list = new ArrayList();
                while (rs.next()) list.add(new TeamMemberRole(rs.getLong(1),
                        rs.getLong(2), rs.getString(3), rs.getLong(4),
                        rs.getString(5), rs.getString(6), rs.getInt(7)));

                members = (TeamMemberRole[]) list.toArray(new TeamMemberRole[0]);

            /**************************
             * remove the below (to the next comment) after move to production
             * (on dev db, table security_user is actually called security_user_tmp)
             */
            } catch (SQLException sqle) {
                try { if (rs != null) { rs.close(); rs = null; } } catch (Exception e) {}
                try { if (ps != null) { ps.close(); ps = null; } } catch (Exception e) {}

                query = new StringBuffer(500);
                query.append("SELECT ur.user_role_id, ur.login_id, s.user_id,                ");
                query.append("       r.role_id, r.role_name, r.description, ur.tcs_rating    ");
                query.append("       s.user_id                                               ");
                query.append("  FROM user_role ur, roles r, comp_catalog c, comp_versions v, ");
                query.append("       security_user_tmp s                                     ");
                query.append(" WHERE r.role_id = ur.role_id                                  ");
                query.append("   AND c.component_id = ? AND c.component_id = v.component_id  ");
                query.append("   AND s.login_id = ur.login_id                                ");
                if (version < 0) query.append("   AND c.current_version = v.version          ");
                else query.append("   AND ? = v.version                          ");
                query.append("   AND ur.comp_vers_id = v.comp_vers_id            ORDER BY 3 ");

                try {

                    ps = c.prepareStatement(query.toString());
                    ps.setLong(1, componentId);
                    if (version >= 0) ps.setLong(2, version);
                    rs = ps.executeQuery();

                    List list = new ArrayList();
                    while (rs.next()) list.add(new TeamMemberRole(rs.getLong(1),
                            rs.getLong(2), rs.getString(3), rs.getLong(4),
                            rs.getString(5), rs.getString(6), rs.getInt(7)));

                    members = (TeamMemberRole[]) list.toArray(new TeamMemberRole[0]);

                } finally {
                    try { if (rs != null) { rs.close(); rs = null; } } catch (Exception e) {}
                    try { if (ps != null) { ps.close(); ps = null; } } catch (Exception e) {}
                }
            /**********************
             * remove the above (to the pervious comment) after move to production
             */

            } finally {
                try { if (rs != null) { rs.close(); rs = null; } } catch (Exception e) {}
                try { if (ps != null) { ps.close(); ps = null; } } catch (Exception e) {}
            }


            query = new StringBuffer(500);
            query.append("SELECT c2.component_id, v2.comp_vers_id, v2.version,    ");
            query.append("       c2.component_name, v2.version_text, v2.comments, ");
            query.append("       c2.short_desc, c2.description, v2.phase_id,      ");
            query.append("       v2.phase_time, v2.price, c2.status_id,           ");
            query.append("       c2.root_category_id                              ");
            query.append("  FROM comp_dependencies d, comp_catalog c1,            ");
            query.append("       comp_catalog c2, comp_versions v1,               ");
            query.append("       comp_versions v2                                 ");
            query.append(" WHERE c1.component_id = v1.component_id                ");
            query.append("   AND v1.comp_vers_id = d.comp_vers_id                 ");
            query.append("   AND v2.comp_vers_id = d.child_comp_vers_id           ");
            query.append("   AND c2.component_id = v2.component_id                ");
            query.append("   AND c1.component_id = ?                              ");
            if (version < 0) query.append("   AND c1.current_version = v1.version    ORDER BY 4 ");
            else query.append("   AND ? = v1.version    ORDER BY 4 ");

            try {

                ps = c.prepareStatement(query.toString());
                ps.setLong(1, componentId);
                if (version >= 0) ps.setLong(2, version);
                rs = ps.executeQuery();

                List list = new ArrayList();
                while (rs.next()) list.add(new ComponentSummary(rs.getLong(1),
                        rs.getLong(2), rs.getLong(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getLong(9), rs.getDate(10),
                        rs.getDouble(11), rs.getLong(12), rs.getLong(13)));

                dependencies = (ComponentSummary[]) list.toArray(new ComponentSummary[0]);

            } finally {
                try { if (rs != null) { rs.close(); rs = null; } } catch (Exception e) {}
                try { if (ps != null) { ps.close(); ps = null; } } catch (Exception e) {}
            }

        } finally {
            try { if (c  != null) { c.close();  c = null;  } } catch (Exception e) {}
        }

        return new ComponentDetail(info, summary, versionInfo, docs, techs, forums, members, dependencies);
    }

    public Collection getComponentsByStatus(long status)
           throws CatalogException {
        List summaries = new ArrayList();
        Iterator compIterator;
        try {
            compIterator = catalogHome.findByStatusId(status).iterator();
        } catch(FinderException exception) {
            throw new CatalogException(exception.toString());
        }
        while (compIterator.hasNext()) {
            LocalDDECompCatalog comp =
                (LocalDDECompCatalog) compIterator.next();
            LocalDDECompVersions ver;
            try {
                ver = versionsHome.findByComponentIdAndVersion(
                    ((Long) comp.getPrimaryKey()).longValue(),
                    comp.getCurrentVersion());
            } catch(FinderException exception) {
                throw new CatalogException(
                "Failed to retrieve current version information for component "
                + comp.getPrimaryKey() + ": " + exception.toString());
            }
            summaries.add(generateSummary(comp, ver));
        }
        Collections.sort(summaries, new Comparators.ComponentSummarySorter());
        return summaries;
    }


    public Collection getComponentsByStatusAndCatalog(long status, long catalogId)
           throws CatalogException {
        List summaries = new ArrayList();
        Iterator compIterator;
        try {
            compIterator = catalogHome.findByCatalogAndStatus(catalogId, status).iterator();
        } catch(FinderException exception) {
            throw new CatalogException(exception.toString());
        }
        while (compIterator.hasNext()) {
            LocalDDECompCatalog comp =
                (LocalDDECompCatalog) compIterator.next();
            LocalDDECompVersions ver;
            try {
                ver = versionsHome.findByComponentIdAndVersion(
                    ((Long) comp.getPrimaryKey()).longValue(),
                    comp.getCurrentVersion());
            } catch(FinderException exception) {
                throw new CatalogException(
                "Failed to retrieve current version information for component "
                + comp.getPrimaryKey() + ": " + exception.toString());
            }
            summaries.add(generateSummary(comp, ver));
        }
        Collections.sort(summaries, new Comparators.ComponentSummarySorter());
        return summaries;
    }

    public ComponentSummary getComponent(long componentId)
           throws CatalogException {
        LocalDDECompCatalog comp;
        try {
            comp = catalogHome.findByPrimaryKey(new Long(componentId));
        } catch(ObjectNotFoundException exception) {
            throw new CatalogException(
            "Specified component does not exist in the catalog: "
            + exception.toString());
        } catch(FinderException exception) {
            throw new CatalogException(exception.toString());
        }
        LocalDDECompVersions ver;
        try {
            ver = versionsHome.findByComponentIdAndVersion(
                ((Long) comp.getPrimaryKey()).longValue(),
                comp.getCurrentVersion());
        } catch(FinderException exception) {
            throw new CatalogException(
            "Failed to retrieve current version information for component "
            + comp.getPrimaryKey() + ": " + exception.toString());
        }
        return generateSummary(comp, ver);
    }

    private void createComponentRole(long componentId)
            throws CatalogException {
        /*
         * This is a convenience method to create the security roles for
         * components. Currently, it has to call createRoles with null for the
         * requestor. This only works because createRoles has not implemented
         * permission checking  yet. This functionality does not really belong
         * in the component catalog.
         */
        PermissionCollection perms = null;
        RolePrincipal role = null;
        RolePrincipal adminRole = null;
        //RolePrincipal downloadRole = null;
        RolePrincipal subscriptionDownloadRole = null;
        try {
            PrincipalMgrRemote principalManager = principalmgrHome.create();
            PolicyMgrRemote policyManager = policymgrHome.create();

            adminRole = principalManager.getRole(Long.parseLong(getConfigValue("administrator_role")));
            //downloadRole = principalManager.getRole(Long.parseLong(getConfigValue("download_role")));
            subscriptionDownloadRole = principalManager.getRole(Long.parseLong(getConfigValue("component_subscription_role")));
            role = principalManager.createRole("DDEComponentDownload " + componentId, null);
            perms = new PermissionCollection();
            perms.addPermission(new DownloadPermission(componentId));
            policyManager.addPermissions(role, perms, null);
            policyManager.addPermissions(adminRole, perms, null);
            policyManager.addPermissions(subscriptionDownloadRole, perms, null);

        } catch(ConfigManagerException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(
            "Failed to obtain configuration data: " + exception.toString());
        } catch(CreateException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(
            "Failed to create security role for component: "
            + exception.toString());
        } catch(GeneralSecurityException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(
            "Failed to create security role for component: "
            + exception.toString());
        } catch(RemoteException exception) {
            throw new EJBException(exception.toString());
        }
    }

    private void createForumRoles(long forumId, long forumType)
            throws CatalogException {
        /*
         * This is a convenience method to create the security roles for forums.
         * Currently, it has to call createRoles with null for the requestor.
         * This only works because createRoles has not implemented permission
         * checking  yet. This functionality does not really belong in the
         * component catalog.
         */
        PermissionCollection perms = null;
        RolePrincipal role = null;
        RolePrincipal adminRole = null;
        RolePrincipal collabModeratorRole = null;
        RolePrincipal specUserRole = null;
        RolePrincipal specModeratorRole = null;
        try {
            PrincipalMgrRemote principalManager = principalmgrHome.create();
            PolicyMgrRemote policyManager = policymgrHome.create();

            adminRole = principalManager.getRole(Long.parseLong(getConfigValue("administrator_role")));
            collabModeratorRole = principalManager.getRole(Long.parseLong(getConfigValue("collaboration_moderator_role")));
            specUserRole = principalManager.getRole(Long.parseLong(getConfigValue("specification_user_role")));
            specModeratorRole = principalManager.getRole(Long.parseLong(getConfigValue("specification_moderator_role")));
            if (forumType == Forum.SPECIFICATION) {
                role = principalManager.createRole("ForumUser " + forumId, null);
                perms = new PermissionCollection();
                perms.addPermission(new ForumPostPermission(forumId));
                policyManager.addPermissions(role, perms, null);
                policyManager.addPermissions(adminRole, perms, null);
                policyManager.addPermissions(specUserRole, perms, null);
            }

            role = principalManager.createRole("ForumModerator " + forumId, null);
            perms = new PermissionCollection();
            perms.addPermission(new ForumModeratePermission(forumId));
            policyManager.addPermissions(role, perms, null);
            policyManager.addPermissions(adminRole, perms, null);
            if (forumType == Forum.SPECIFICATION) {
                policyManager.addPermissions(specModeratorRole, perms, null);
            } else {
                policyManager.addPermissions(collabModeratorRole, perms, null);
            }

        } catch(ConfigManagerException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(
            "Failed to obtain configuration data: " + exception.toString());
        } catch(CreateException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(
            "Failed to create security roles for forum: "
            + exception.toString());
        } catch(GeneralSecurityException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(
            "Failed to create security roles for forum: "
            + exception.toString());
        } catch(RemoteException exception) {
            throw new EJBException(exception.toString());
        }
    }

    public ComponentSummary requestComponent(ComponentRequest request)
           throws CatalogException {
        if (request == null) {
            throw new CatalogException(
            "Null specified for component request");
        }

        Timestamp currentTime = new Timestamp((new Date()).getTime());
        LocalDDECompCatalog newComponent;
        try {
            newComponent = catalogHome.create(1,
                request.getName(), request.getDescription(),
                currentTime, ComponentInfo.REQUESTED,
                request.getShortDescription(),
                request.getFunctionalDescription(), 0);
        } catch(CreateException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException("Failed to create component: "
                + exception.toString());
        }
        Iterator catIterator = request.getCategories().iterator();
        try {
            while (catIterator.hasNext()) {
                compcatsHome.create(newComponent,
                    categoriesHome.findByPrimaryKey((Long) catIterator.next()));
            }
        } catch(ObjectNotFoundException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(
            "Specified category does not exist in the catalog: "
            + exception.toString());
        } catch(FinderException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(exception.toString());
        } catch(CreateException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(
            "Failed to associate new component with category: "
            + exception.toString());
        }
        StringTokenizer keywords = new StringTokenizer(request.getKeywords(),
                ComponentInfo.KEYWORD_DELIMITER);
        try {
            while (keywords.hasMoreTokens()) {
                keywordsHome.create(keywords.nextToken(), newComponent);
            }
        } catch(CreateException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(
            "Failed to associate new component with keyword: "
            + exception.toString());
        }

        LocalDDECompVersions newVersion;
        try {
            newVersion = versionsHome.create(1,
                currentTime, ComponentVersionInfo.COLLABORATION, currentTime,
                0.00, request.getComments(), newComponent,
                request.getVersionLabel());
        } catch(CreateException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(
            "Failed to create initial version of component: "
            + exception.toString());
        }
        Iterator techIterator = request.getTechnologies().iterator();
        try {
            while (techIterator.hasNext()) {
                comptechHome.create(newVersion, technologiesHome.
                    findByPrimaryKey((Long) techIterator.next()));
            }
        } catch(ObjectNotFoundException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(
            "Specified technology does not exist in the catalog: "
            + exception.toString());
        } catch(FinderException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(exception.toString());
        } catch(CreateException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(
            "Failed to associate new version with technology: "
            + exception.toString());
        }

        long newForum;
        try {
            com.topcoder.forum.Forum forum = new com.topcoder.forum.Forum();
            try {
                forum = forumadminHome.create().createForum(forum,
                            Long.parseLong(getConfigValue("collab_forum_template")));
            } catch(ConfigManagerException cme) {
                log.warn("Encountered a configuration manager exception reading collab_forum_template property");
                forum = forumadminHome.create().createForum(forum);
            } catch(NumberFormatException nfe) {
                log.warn("Failed to parse the collab_forum_template property");
                forum = forumadminHome.create().createForum(forum);
            }
            newForum = forum.getId();
            compforumHome.create(newForum, Forum.COLLABORATION, newVersion);
            createForumRoles(newForum, Forum.COLLABORATION);

        } catch(ForumException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(
            "Failed to create new collaboration forum for component: "
            + exception.toString());
        } catch(CreateException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(
            "Failed to create new collaboration forum for component: "
            + exception.toString());
        }

        createComponentRole(((Long) newComponent.getPrimaryKey()).longValue());

        try {
            LocalDDEUserMaster user = userHome.findByPrimaryKey(
                new Long(request.getUserId()));
            LocalDDERoles roleBean = rolesHome.findByPrimaryKey(
                new Long(Long.parseLong(getConfigValue("requestor_role_id"))));
            userroleHome.create(0, user, newVersion, roleBean);
        } catch(ConfigManagerException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(
            "Failed to obtain configuration data: " + exception.toString());
        } catch(FinderException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(exception.toString());
        } catch(CreateException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(
            "Failed to create Requestor development role: "
            + exception.toString());
        }

        try {
            sendConfirmationEmail(request.getUserId());
        } catch(DDEException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(exception.toString());
        }

        return generateSummary(newComponent, newVersion);
    }

    private void indexComponent(LocalDDECompCatalog comp)
            throws CatalogException {
        StringBuffer indexDigest = new StringBuffer();
        long componentId = ((Long) comp.getPrimaryKey()).longValue();
        indexDigest.append(comp.getComponentName());
        indexDigest.append(CatalogSearchEngine.DELIMITER);
        indexDigest.append(comp.getShortDesc());
        indexDigest.append(CatalogSearchEngine.DELIMITER);
        indexDigest.append(comp.getDescription());
        indexDigest.append(CatalogSearchEngine.DELIMITER);
        indexDigest.append(comp.getFunctionDesc());
        indexDigest.append(CatalogSearchEngine.DELIMITER);
        try {
            Iterator keywordIterator =
                keywordsHome.findByComponentId(componentId).iterator();
            while (keywordIterator.hasNext()) {
                LocalDDECompKeywords keyword =
                    (LocalDDECompKeywords) keywordIterator.next();
                indexDigest.append(keyword.getKeyword());
                indexDigest.append(CatalogSearchEngine.DELIMITER);
            }
            Long versionId = (Long) versionsHome.findByComponentIdAndVersion(
                componentId, comp.getCurrentVersion()).getPrimaryKey();
            Iterator techIterator = comptechHome.findByCompVersId(
                versionId.longValue()).iterator();
            while (techIterator.hasNext()) {
                LocalDDETechnologyTypes tech = ((LocalDDECompTechnology)
                    techIterator.next()).getTechnologyTypes();
                indexDigest.append(tech.getName());
                indexDigest.append(CatalogSearchEngine.DELIMITER);
            }
        } catch(FinderException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(
            "Could not index component: " + exception.toString());
        }
        CatalogSearchEngine.getInstance().index(
            componentId, indexDigest.toString());
    }

    public void approveComponent(long componentId) throws CatalogException {
        if (componentId < 0) {
            throw new CatalogException(
            "Negative number specified for primary key of component");
        }
        LocalDDECompCatalog compBean;
        try {
            compBean = catalogHome.findByPrimaryKey(new Long(componentId));
        } catch(ObjectNotFoundException exception) {
            throw new CatalogException(
            "Specified component does not exist in the catalog: "
            + exception.toString());
        } catch(FinderException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(exception.toString());
        }
        if (compBean.getStatusId() != ComponentInfo.APPROVED) {
            compBean.setStatusId(ComponentInfo.APPROVED);
            indexComponent(compBean);
        }
    }

    public void declineComponent(long componentId, boolean isDuplicate)
           throws CatalogException {
        if (componentId < 0) {
            throw new CatalogException(
            "Negative number specified for primary key of component");
        }
        try {
            catalogHome.findByPrimaryKey(new Long(componentId)).setStatusId(
                isDuplicate ? ComponentInfo.DUPLICATE : ComponentInfo.DECLINED);
        } catch(ObjectNotFoundException exception) {
            throw new CatalogException(
            "Specified component does not exist in the catalog: "
            + exception.toString());
        } catch(FinderException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(exception.toString());
        }
        CatalogSearchEngine.getInstance().unIndex(componentId);
    }

    public void removeComponent(long componentId) throws CatalogException {
        if (componentId < 0) {
            throw new CatalogException(
            "Negative number specified for primary key of component");
        }
        try {
            catalogHome.findByPrimaryKey(new Long(componentId)).setStatusId(
                ComponentInfo.DELETED);
        } catch(ObjectNotFoundException exception) {
            throw new CatalogException(
            "Specified component does not exist in the catalog: "
            + exception.toString());
        } catch(FinderException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(exception.toString());
        }
        CatalogSearchEngine.getInstance().unIndex(componentId);
    }

    public Collection getCategories() throws CatalogException {
        /*
         * This implementation assumes that there are no loops in the category
         * hierarchy (categories will not have themselves as a parent or
         * ancestor).
         */

        List categories = new ArrayList();
        Comparator sorter = new Comparators.CategorySorter();

        /*
         * A mapping of categories to Collection objects that contain their
         * subcategories. It is necessary because the navigability of the
         * category hierarchy is reversed: In the database, each category has a
         * field that indicates its parent category (child -> parent); however,
         * the Category classes that are returned contain information on
         * subcategories (parent ->child).
         */
        Map subcategoryMap = new HashMap();

        Iterator beanIterator;
        try {
            beanIterator = categoriesHome.findAllActive().iterator();
        } catch(FinderException impossible) {
            throw new CatalogException(impossible.toString());
        }

        while (beanIterator.hasNext()) {
            LocalDDECategories categoryBean =
                (LocalDDECategories) beanIterator.next();
            Long key = (Long) categoryBean.getPrimaryKey();
            Long parentKey = categoryBean.getParentCategoryId();
            List subcategories;

            /*
             * If other categories have already placed themselves in this
             * category's subcategory list, use that existing list. Otherwise,
             * start a new list.
             */
            if (subcategoryMap.containsKey(key)) {
                subcategories = (List) subcategoryMap.get(key);
            } else {
                subcategories = new ArrayList();
                subcategoryMap.put(key, subcategories);
            }
            Category category = new Category(key.longValue(),
                categoryBean.getName(), categoryBean.getDescription(),
                subcategories);

            /*
             * Only return this category if it is a top-level category (in other
             * words, if it has no parent)
             */
            if (parentKey == null) {
                categories.add(category);
            }

            /*
             * If this category's parent already has a subcategory list, add to
             * it. Otherwise, start a new list and add to it.
             */
            List parentSubs;
            if (subcategoryMap.containsKey(parentKey)) {
                parentSubs = (List) subcategoryMap.get(parentKey);
            } else {
                parentSubs = new ArrayList();
                subcategoryMap.put(parentKey, parentSubs);
            }
            int insertPoint =
                Collections.binarySearch(parentSubs, category, sorter);
            // See Java API documentation on binarySearch for clarification
            if (insertPoint < 0) {
                insertPoint = -insertPoint - 1;
            }
            // Keeps subcategory list in sorted order
            parentSubs.add(insertPoint, category);
        }
        Collections.sort(categories, sorter);
        return categories;
    }

    public Category getCategory(long categoryId) throws CatalogException {
        if (categoryId < 0) {
            throw new CatalogException(
            "Negative number specified for primary key of category");
        }
        LocalDDECategories categoryBean;
        try {
            categoryBean =
                categoriesHome.findByPrimaryKey(new Long(categoryId));
        } catch(ObjectNotFoundException exception) {
            throw new CatalogException(
            "Specified category does not exist in the catalog: "
            + exception.toString());
        } catch(FinderException exception) {
            throw new CatalogException(exception.toString());
        }
        Collection subcategories = new HashSet();
        Category result = new Category(categoryId, categoryBean.getName(),
            categoryBean.getDescription(), subcategories);
        Iterator subIterator;
        try {
            subIterator =
                categoriesHome.findByParentCategoryId(new Long(categoryId)).
                iterator();
        } catch(FinderException impossible) {
            throw new CatalogException(impossible.toString());
        }
        while (subIterator.hasNext()) {
            Long subId = (Long)
                ((LocalDDECategories) subIterator.next()).getPrimaryKey();
            subcategories.add(getCategory(subId.longValue()));
        }
        return result;
    }

    public Collection getCategoryPath(long categoryId) throws CatalogException {
        /*
         * This implementation assumes that there are no loops in the category
         * hierarchy (categories will not have themselves as a parent or
         * ancestor).
         */
        if (categoryId < 0) {
            throw new CatalogException(
            "Negative number specified for primary key of category");
        }
        LocalDDECategories categoryBean;
        List categoryPath = new ArrayList();
        Long target = new Long(categoryId);
        do {
            try {
                categoryBean = categoriesHome.findByPrimaryKey(target);
            } catch(ObjectNotFoundException exception) {
                throw new CatalogException(
                "Category does not exist in the catalog: "
                + exception.toString());
            } catch(FinderException exception) {
                throw new CatalogException(exception.toString());
            }
            categoryPath.add(new Category(
                ((Long) categoryBean.getPrimaryKey()).longValue(),
                categoryBean.getName(), categoryBean.getDescription(), null));
            target = categoryBean.getParentCategoryId();
        } while (target != null);
        Collections.reverse(categoryPath);
        return categoryPath;
    }

    public Collection getRoles() throws CatalogException {
        List roles = new ArrayList();
        Iterator beanIterator;
        try {
            beanIterator = rolesHome.findAllActive().iterator();
        } catch(FinderException impossible) {
            throw new CatalogException(impossible.toString());
        }
        while (beanIterator.hasNext()) {
            LocalDDERoles roleBean = (LocalDDERoles) beanIterator.next();
            roles.add(new Role(
                ((Long) roleBean.getPrimaryKey()).longValue(),
                roleBean.getName(), roleBean.getDescription()));
        }
        Collections.sort(roles, new Comparators.RoleSorter());
        return roles;
    }

    public Role getRole(long roleId) throws CatalogException {
        if (roleId < 0) {
            throw new CatalogException(
            "Negative number specified for primary key of role");
        }
        LocalDDERoles roleBean;
        try {
            roleBean = rolesHome.findByPrimaryKey(new Long(roleId));
        } catch(ObjectNotFoundException exception) {
            throw new CatalogException(
            "Specified role does not exist in the catalog: "
            + exception.toString());
        } catch(FinderException exception) {
            throw new CatalogException(exception.toString());
        }
        return new Role(roleId, roleBean.getName(),
            roleBean.getDescription());
    }

    public Collection getTechnologies() throws CatalogException {
        List techs = new ArrayList();
        Iterator beanIterator;
        try {
            beanIterator = technologiesHome.findAllActive().iterator();
        } catch(FinderException impossible) {
            throw new CatalogException(impossible.toString());
        }
        while (beanIterator.hasNext()) {
            LocalDDETechnologyTypes techBean =
                (LocalDDETechnologyTypes) beanIterator.next();
            techs.add(new Technology(
                ((Long) techBean.getPrimaryKey()).longValue(),
                techBean.getName(), techBean.getDescription()));
        }
        Collections.sort(techs, new Comparators.TechnologySorter());
        return techs;
    }

    public Technology getTechnology(long technologyId) throws CatalogException {
        if (technologyId < 0) {
            throw new CatalogException(
            "Negative number specified for primary key of technology");
        }
        LocalDDETechnologyTypes techBean;
        try {
            techBean =
                technologiesHome.findByPrimaryKey(new Long(technologyId));
        } catch(ObjectNotFoundException exception) {
            throw new CatalogException(
            "Specified technology does not exist in catalog: "
            + exception.toString());
        } catch(FinderException exception) {
            throw new CatalogException(exception.toString());
        }
        return new Technology(technologyId, techBean.getName(),
            techBean.getDescription());
    }

    public Collection getLicenseLevels() throws CatalogException {
        List licenses = new ArrayList();
        Iterator beanIterator;
        try {
            beanIterator = licenseHome.findAllActive().iterator();
        } catch(FinderException impossible) {
            throw new CatalogException(impossible.toString());
        }
        double pricePerUnit;
        try {
            pricePerUnit = Double.parseDouble(getConfigValue("price_per_unit"));
        } catch(ConfigManagerException exception) {
            throw new CatalogException(
            "Failed to obtain configuration data: " + exception.toString());
        }
        while (beanIterator.hasNext()) {
            LocalDDELicenseLevel licBean =
                (LocalDDELicenseLevel) beanIterator.next();
            licenses.add(new LicenseLevel(
                ((Long) licBean.getPrimaryKey()).longValue(),
                licBean.getDescription(), licBean.getPriceMultiplier(),
                pricePerUnit));
        }
        Collections.sort(licenses, new Comparators.LicenseLevelSorter());
        return licenses;
    }

    public LicenseLevel getLicenseLevel(long licenseId)
           throws CatalogException {
        if (licenseId < 0) {
            throw new CatalogException(
            "Negative number specified for primary key of license level");
        }
        LocalDDELicenseLevel licBean;
        try {
            licBean =
                licenseHome.findByPrimaryKey(new Long(licenseId));
        } catch(ObjectNotFoundException exception) {
            throw new CatalogException(
            "Specified license level does not exist in catalog: "
            + exception.toString());
        } catch(FinderException exception) {
            throw new CatalogException(exception.toString());
        }
        double pricePerUnit;
        try {
            pricePerUnit = Double.parseDouble(getConfigValue("price_per_unit"));
        } catch(ConfigManagerException exception) {
            throw new CatalogException(
            "Failed to obtain configuration data: " + exception.toString());
        }
        return new LicenseLevel(licenseId, licBean.getDescription(),
            licBean.getPriceMultiplier(), pricePerUnit);
    }

    public Document getDocument(long documentId) throws CatalogException {
        if (documentId < 0) {
            throw new CatalogException(
            "Negative number specified for primary key of document");
        }
        LocalDDECompDocumentation docBean;
        try {
            docBean =
                docHome.findByPrimaryKey(new Long(documentId));
        } catch(ObjectNotFoundException exception) {
            throw new CatalogException(
            "Specified document does not exist in catalog: "
            + exception.toString());
        } catch(FinderException exception) {
            throw new CatalogException(exception.toString());
        }
        return new Document(
                ((Long) docBean.getPrimaryKey()).longValue(),
                docBean.getDocumentName(), docBean.getUrl(),
                docBean.getDocumentTypeId());
    }

    public Download getDownload(long downloadId) throws CatalogException {
        if (downloadId < 0) {
            throw new CatalogException(
            "Negative number specified for primary key of download location");
        }
        LocalDDECompDownload downBean;
        try {
            downBean =
                downloadHome.findByPrimaryKey(new Long(downloadId));
        } catch(ObjectNotFoundException exception) {
            throw new CatalogException(
            "Specified download location does not exist in catalog: "
            + exception.toString());
        } catch(FinderException exception) {
            throw new CatalogException(exception.toString());
        }
        return new Download(downloadId, downBean.getDescription(),
            downBean.getUrl());
    }

    public Category addCategory(long parentId, Category category)
            throws CatalogException {
        if (parentId < -1) {
            throw new CatalogException(
            "Invalid key specified for parent category");
        }
        if (category == null ) {
            throw new CatalogException(
            "Null specified for category description");
        }
        if (category.getId() != -1) {
            throw new CatalogException(
            "Specified category may already exist in the catalog");
        }
        try {
            if (parentId != -1) {
                categoriesHome.findByPrimaryKey(new Long(parentId));
            }
        } catch(ObjectNotFoundException exception) {
            throw new CatalogException(
            "Specified parent category does not exist in the catalog");
        } catch(FinderException exception) {
            throw new CatalogException(exception.toString());
        }
        try {
            LocalDDECategories newCategory = categoriesHome.create(
                (parentId == -1) ? null : new Long(parentId),
                category.getName(), category.getDescription(),
                Category.ACTIVE);
            return
                getCategory(((Long) newCategory.getPrimaryKey()).longValue());
        } catch(CreateException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(exception.toString());
        }
    }

    public Category addCategory(Category category) throws CatalogException {
        return addCategory(-1, category);
    }

    public Role addRole(Role role) throws CatalogException {
        if (role == null) {
            throw new CatalogException(
            "Null specified for role description");
        }
        if (role.getId() != -1) {
            throw new CatalogException(
            "Specified role may already exist in the catalog");
        }
        try {
            LocalDDERoles newRole = rolesHome.create(role.getName(),
                role.getDescription(), Role.ACTIVE);
            return getRole(((Long) newRole.getPrimaryKey()).longValue());
        } catch(CreateException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(exception.toString());
        }
    }

    public Technology addTechnology(Technology technology)
           throws CatalogException {
        if (technology == null) {
            throw new CatalogException(
            "Null specified for new technology");
        }
        if (technology.getId() != -1) {
            throw new CatalogException(
            "Specified technology may already exist in the catalog");
        }
        try {
            LocalDDETechnologyTypes newTechnology = technologiesHome.create(
                technology.getName(), technology.getDescription(),
                Technology.ACTIVE);
            return getTechnology(
                ((Long) newTechnology.getPrimaryKey()).longValue());
        } catch(CreateException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(exception.toString());
        }
    }

    public LicenseLevel addLicenseLevel(LicenseLevel license)
           throws CatalogException {
        if (license == null) {
            throw new CatalogException(
            "Null specified for new license level");
        }
        if (license.getId() != -1) {
            throw new CatalogException(
            "Specified license level may already exist in the catalog");
        }
        try {
            LocalDDELicenseLevel newLicense = licenseHome.create(
                license.getPriceMultiplier(), license.getDescription(),
                LicenseLevel.ACTIVE);
            return getLicenseLevel(
                ((Long) newLicense.getPrimaryKey()).longValue());
        } catch(CreateException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(exception.toString());
        }
    }

    public void updateCategory(Category category) throws CatalogException {
        if (category == null) {
            throw new CatalogException(
            "Null specified for category");
        }
        if (category.getId() == -1) {
            throw new CatalogException(
            "Specified category does not exist in the catalog");
        }
        try {
            LocalDDECategories targetCat =
                categoriesHome.findByPrimaryKey(new Long(category.getId()));
            targetCat.setName(category.getName());
            targetCat.setDescription(category.getDescription());
        } catch(FinderException exception) {
            throw new CatalogException(exception.toString());
        }
    }

    public void updateRole(Role role) throws CatalogException {
        if (role == null) {
            throw new CatalogException(
            "Null specified for role");
        }
        if (role.getId() == -1) {
            throw new CatalogException(
            "Specified role does not exist in the catalog");
        }
        try {
            LocalDDERoles targetRole =
                rolesHome.findByPrimaryKey(new Long(role.getId()));
            targetRole.setName(role.getName());
            targetRole.setDescription(role.getDescription());
        } catch(FinderException exception) {
            throw new CatalogException(exception.toString());
        }
    }

    public void updateTechnology(Technology technology) throws CatalogException{
        if (technology == null) {
            throw new CatalogException(
            "Null specified for technology");
        }
        if (technology.getId() == -1) {
            throw new CatalogException(
            "Specified technology does not exist in the catalog");
        }
        try {
            LocalDDETechnologyTypes targetTech =
                technologiesHome.findByPrimaryKey(new Long(technology.getId()));
            targetTech.setName(technology.getName());
            targetTech.setDescription(technology.getDescription());
        } catch(FinderException exception) {
            throw new CatalogException(exception.toString());
        }
    }

    public void updateLicenseLevel(LicenseLevel license)
           throws CatalogException{
        if (license == null) {
            throw new CatalogException(
            "Null specified for license level");
        }
        if (license.getId() == -1) {
            throw new CatalogException(
            "Specified license level does not exist in the catalog");
        }
        try {
            LocalDDELicenseLevel targetLic =
                licenseHome.findByPrimaryKey(new Long(license.getId()));
            targetLic.setDescription(license.getDescription());
            targetLic.setPriceMultiplier(license.getPriceMultiplier());
        } catch(FinderException exception) {
            throw new CatalogException(exception.toString());
        }
    }

    public void removeCategory(long categoryId) throws CatalogException {
        if (categoryId < 0) {
            throw new CatalogException(
            "Negative number specified for primary key of category");
        }
        Iterator subIterator;
        try {
            subIterator =
                categoriesHome.findByParentCategoryId(new Long(categoryId)).
                iterator();
        } catch(FinderException impossible) {
            throw new CatalogException(impossible.toString());
        }
        while (subIterator.hasNext()) {
            Long subId = (Long)
                ((LocalDDECategories) subIterator.next()).getPrimaryKey();
            removeCategory(subId.longValue());
        }
        try {
            categoriesHome.findByPrimaryKey(new Long(categoryId)).setStatusId(
                Category.DELETED);
        } catch(ObjectNotFoundException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(
            "Specified category does not exist in the catalog: " +
            exception.toString());
        } catch(FinderException exception) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(exception.toString());
        }
    }

    public void removeRole(long roleId) throws CatalogException {
        if (roleId < 0) {
            throw new CatalogException(
            "Negative number specified for primary key of role");
        }
        try {
            rolesHome.findByPrimaryKey(new Long(roleId)).setStatusId(
                Role.DELETED);
        } catch(ObjectNotFoundException exception) {
            throw new CatalogException(
            "Specified role does not exist in the catalog: " +
            exception.toString());
        } catch(FinderException exception) {
            throw new CatalogException(exception.toString());
        }
    }

    public void removeTechnology(long technologyId) throws CatalogException {
        if (technologyId < 0) {
            throw new CatalogException(
            "Negative number specified for primary key of technology");
        }
        try {
            technologiesHome.findByPrimaryKey(new Long(technologyId)).
                setStatusId(Technology.DELETED);
        } catch(ObjectNotFoundException exception) {
            throw new CatalogException(
            "Specified technology does not exist in the catalog: " +
            exception.toString());
        } catch(FinderException exception) {
            throw new CatalogException(exception.toString());
        }
    }

    public void removeLicenseLevel(long licenseId) throws CatalogException {
        if (licenseId < 0) {
            throw new CatalogException(
            "Negative number specified for primary key of license level");
        }
        try {
            licenseHome.findByPrimaryKey(new Long(licenseId)).
                setStatusId(LicenseLevel.DELETED);
        } catch(ObjectNotFoundException exception) {
            throw new CatalogException(
            "Specified license level does not exist in the catalog: " +
            exception.toString());
        } catch(FinderException exception) {
            throw new CatalogException(exception.toString());
        }
    }

    private String getConfigValue(String name)
            throws ConfigManagerException {
        ConfigManager config = ConfigManager.getInstance();
        if (config.existsNamespace(CONFIG_NAMESPACE)) {
            config.refresh(CONFIG_NAMESPACE);
        } else {
            config.add(CONFIG_NAMESPACE,
                ConfigManager.CONFIG_PROPERTIES_FORMAT);
        }

        /*
         * This section is necessary because the Email Engine component does not
         * properly initialize its namespace with ConfigManager. Once this
         * problem with Email Engine has been corrected, the following section
         * can and should be removed.
         */
        String EMAIL_NAMESPACE="com.topcoder.message.email.EmailEngine";
        if (config.existsNamespace(EMAIL_NAMESPACE)) {
            config.refresh(EMAIL_NAMESPACE);
        } else {
            config.add(EMAIL_NAMESPACE, ConfigManager.CONFIG_XML_FORMAT);
        }
        /*
         * End of removable section.
         */

        return config.getString(CONFIG_NAMESPACE, name);
    }

    private void sendConfirmationEmail(long recipientId) throws DDEException {
        try {
            RegistrationInfo requestorInfo = usermanHome.create().
                getUser(recipientId).getRegInfo();
            TCSEmailMessage confirmation = new TCSEmailMessage();
            confirmation.setFromAddress(getConfigValue("confirmation_from"));
            confirmation.setSubject(getConfigValue("confirmation_subject"));
            confirmation.setToAddress(requestorInfo.getEmail(),
                TCSEmailMessage.TO);

            XMLDocument data = new XMLDocument("confirmation");
            data.addTag(
                new ValueTag("firstname", requestorInfo.getFirstName()));
            Transformer transformer = TransformerFactory.newInstance().
                newTransformer(new StreamSource(
                    new File(getConfigValue("confirmation_template"))));
            StringWriter body = new StringWriter();
            transformer.transform(
                new StreamSource(new StringReader(data.getXML())),
                new StreamResult(body));
            confirmation.setBody(body.toString());

            EmailEngine.send(confirmation);
        } catch(Exception exception) {
            throw new DDEException(
            "Failed to send confirmation email: " + exception.toString());
        }
    }

    public String getNamespace() {
        return CONFIG_NAMESPACE;
    }

    public Enumeration getConfigPropNames() {
        Vector propNames = new Vector();
        propNames.add("price_per_unit");
        propNames.add("requestor_role_id");
        propNames.add("confirmation_from");
        propNames.add("confirmation_subject");
        propNames.add("confirmation_template");
        propNames.add("collab_forum_template");
        propNames.add("spec_forum_template");
        propNames.add("administrator_role");
        propNames.add("user_role");
        propNames.add("download_role");
        propNames.add("collaboration_moderator_role");
        propNames.add("specification_user_role");
        propNames.add("specification_moderator_role");
        return propNames.elements();
    }

    public void ejbActivate() {}

    public void ejbPassivate() {
        /*
         * All fields are either home interfaces of other enterprise beans or
         * instances of <code>SessionContext</code>, so nothing needs to be done
         * to enable serialization.
         */
     }

    public void ejbRemove() {}

    public void setSessionContext(SessionContext context) {
        ejbContext = context;
    }

    /**
     * Gets the project id for the project of the given type associated with this component version
     * @param projectType design or development
     * @return the project id or -1 if no project was found
     * @throws CatalogException
     */
    private long getProjectId(long projectType, long compVersId) throws CatalogException {
        try {
            ProjectTracker pt = projectTrackerHome.create();
            return pt.getProjectIdByComponentVersionId(compVersId, projectType);
        } catch(RemoteException e) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(e.toString());
        } catch (CreateException e) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(e.toString());
        }
    }

    /**
     * Determines whether or not the project of the given type for this component version has yielded a
     * publicly readable aggregation worksheet
     * @param projectType design or development
     * @return true if there is an aggregation worksheet for the given type, false otherwise
     * @throws CatalogException
     */
    private boolean isAggregated(long projectType, long compVersId) throws CatalogException {

        long projectId = getProjectId(projectType, compVersId);
        if (projectId < 0) return false;
        try {
            DocumentManager dm = documentManagerHome.create();
            return dm.isProjectAggregated(projectId);
        } catch(RemoteException e) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(e.toString());
        } catch (CreateException e) {
            ejbContext.setRollbackOnly();
            throw new CatalogException(e.toString());
        }
    }
}





