/*
 * DDEForumBean.java
 * 6 September 2002
 * 1.0
 *
 * Copyright (c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.forum;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompForumXrefHome;
import com.topcoder.forum.*;
import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.TCSubject;
import com.topcoder.security.policy.PolicyRemote;
import com.topcoder.security.policy.PolicyRemoteHome;

import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import javax.sql.DataSource;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;


/**
 * The implementation of the methods of DDEForumEJB.
 *
 * @version 1.0, 6 September 2002
 * @author  Albert Mao
 * @see     DDEForum
 * @see     DDEForumHome
 */
public class DDEForumBean implements SessionBean {


    private LocalDDECompForumXrefHome compforumHome;
    private PolicyRemote checker;
    private SessionContext ejbContext;
    private DataSource datasource;


    public DDEForumBean() {
    }


    public void ejbCreate() throws CreateException {
        try {
            Context homeBindings = new InitialContext();
            PolicyRemoteHome policyHome = (PolicyRemoteHome)
                    PortableRemoteObject.narrow(
                            homeBindings.lookup(PolicyRemoteHome.EJB_REF_NAME),
                            PolicyRemoteHome.class);
            compforumHome = (LocalDDECompForumXrefHome)
                    homeBindings.lookup(LocalDDECompForumXrefHome.EJB_REF_NAME);
            datasource = (DataSource) homeBindings.lookup("java:comp/env/jdbc/DefaultDS");
            checker = policyHome.create();
        } catch (NamingException exception) {
            throw new EJBException(exception.toString());
        } catch (RemoteException exception) {
            throw new EJBException(exception.toString());
        }
    }

    public boolean canPost(long forumId, TCSubject subject)
            throws ForumException {
        if (subject == null) {
            throw new ForumException("Null specified for subject");
        }

        boolean hasPermission = false;
        try {
            hasPermission = checker.checkPermission(subject,
                    new ForumPostPermission(forumId));
        } catch (GeneralSecurityException exception) {
            throw new ForumException(exception.toString());
        } catch (RemoteException exception) {
            throw new EJBException(exception.toString());
        }
        return hasPermission;
    }

    public boolean canModerate(long forumId, TCSubject subject)
            throws ForumException {
        if (subject == null) {
            throw new ForumException("Null specified for subject");
        }

        boolean hasPermission = false;
        try {
            hasPermission = checker.checkPermission(subject,
                    new ForumModeratePermission(forumId));
        } catch (GeneralSecurityException exception) {
            throw new ForumException(exception.toString());
        } catch (RemoteException exception) {
            throw new EJBException(exception.toString());
        }
        return hasPermission;
    }

    public ForumComponent getLinkedComponent(long forumId)
            throws ForumException {

        final String sql = "select c.component_id," +
                " c.component_name," +
                " c.short_desc," +
                " c.root_category_id," +
                " v.comp_vers_id," +
                " v.version_text," +
                " v.phase_id," +
                " xc.forum_id collab," +
                " xs.forum_id spec" +
                " from comp_catalog c" +
                " join comp_versions v on (c.component_id = v.component_id)" +
                " join comp_forum_xref xc on (v.comp_vers_id = xc.comp_vers_id and xc.forum_type = 1)" +
                " left outer join comp_forum_xref xs on (v.comp_vers_id = xs.comp_vers_id and xs.forum_type = 2)" +
                " where c.status_id = " + com.topcoder.dde.catalog.ComponentInfo.APPROVED +
                " and (xc.forum_id = ? or xs.forum_id = ?)";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ForumComponent component = null;
        try {
            conn = datasource.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setLong(1, forumId);
            ps.setLong(2, forumId);
            rs = ps.executeQuery();
            while (rs.next()) {
                component = new ForumComponent();
                component.setComponentId(rs.getLong("component_id"));
                component.setName(rs.getString("component_name"));
                component.setShortDescription(rs.getString("short_desc"));
                component.setRootCategory(rs.getLong("root_category_id"));
                component.setVersionId(rs.getLong("comp_vers_id"));
                component.setVersionText(rs.getString("version_text"));
                component.setVersionPhase(rs.getLong("phase_id"));
                component.setCollabForumId(rs.getLong("collab"));
                component.setSpecForumId(rs.getLong("spec"));
            }
        } catch (SQLException sqle) {
            throw new ForumException(sqle.toString());
        } finally {
            if (rs != null) try {
                rs.close();
            } catch (SQLException sqle) {
            } finally {
                rs = null;
            }
            if (ps != null) try {
                ps.close();
            } catch (SQLException sqle) {
            } finally {
                ps = null;
            }
            if (conn != null) try {
                conn.close();
            } catch (SQLException sqle) {
            } finally {
                conn = null;
            }
        }
        
        return component;
    }


    public List getActiveForums(long forumType) throws ForumException {
        final String sql =
                " select c.component_id, " +
                " c.component_name, " +
                " c.short_desc, " +
                " c.root_category_id, " +
                " v.comp_vers_id, " +
                " v.version_text, " +
                " v.phase_id, " +
                " f.forum_id, " +
                " f.total_topics, " +
                " f.total_threads, " +
                " f.total_posts, " +
                " p.post_time, " +
                " u.user_id " +
                " from comp_catalog c " +
                " ,comp_versions v " +
                " ,comp_forum_xref x " +
                " ,forum_master f " +
                " ,outer (forum_posts p, security_user u) " +
                " where c.status_id = " + com.topcoder.dde.catalog.ComponentInfo.APPROVED +
                " and f.status_id = " + com.topcoder.forum.ForumStatus.ACTIVE +
                " and c.component_id = v.component_id " +
                " and x.forum_type = ? " +
                " and x.forum_id = f.forum_id " +
                " and f.last_post_id = p.post_id " +
                " and p.login_id = u.login_id " +
                " and v.comp_vers_id = x.comp_vers_id " +
                " order by p.post_time desc, c.component_name ";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List l = new LinkedList();
        try {
            conn = datasource.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setLong(1, forumType);
            rs = ps.executeQuery();
            while (rs.next()) {
                ActiveForum forum = new ActiveForum();
                forum.setComponentId(rs.getLong("component_id"));
                forum.setName(rs.getString("component_name"));
                forum.setShortDescription(rs.getString("short_desc"));
                forum.setRootCategory(rs.getLong("root_category_id"));
                forum.setVersionId(rs.getLong("comp_vers_id"));
                forum.setVersionText(rs.getString("version_text"));
                forum.setVersionPhase(rs.getLong("phase_id"));
                forum.setForumId(rs.getLong("forum_id"));
                forum.setTotalTopics(rs.getLong("total_topics"));
                forum.setTotalThreads(rs.getLong("total_threads"));
                forum.setTotalPosts(rs.getLong("total_posts"));
                if (rs.getTimestamp("post_time") != null) {
                    forum.setLastPostTime(new java.util.Date(rs.getTimestamp("post_time").getTime()));
                }
                forum.setLastPostUsername(rs.getString("user_id"));

                l.add(forum);
            }
        } catch (SQLException sqle) {
            throw new ForumException(sqle.toString());
        } finally {
            if (rs != null) try {
                rs.close();
            } catch (SQLException sqle) {
            } finally {
                rs = null;
            }
            if (ps != null) try {
                ps.close();
            } catch (SQLException sqle) {
            } finally {
                ps = null;
            }
            if (conn != null) try {
                conn.close();
            } catch (SQLException sqle) {
            } finally {
                conn = null;
            }
        }
        return l;
    }


    public void ejbActivate() {
    }

    public void ejbPassivate() {
        /*
         * All fields are either remote interfaces of other enterprise beans or
         * instances of <code>SessionContext</code>, so nothing needs to be done
         * to enable serialization.
         */
    }

    public void ejbRemove() {
    }

    public void setSessionContext(SessionContext context) {
        ejbContext = context;
    }

}





