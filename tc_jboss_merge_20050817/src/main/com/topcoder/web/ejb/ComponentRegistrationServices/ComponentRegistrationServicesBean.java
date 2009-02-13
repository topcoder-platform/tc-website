package com.topcoder.web.ejb.ComponentRegistrationServices;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.InitialContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ComponentRegistrationServicesBean extends BaseEJB {

    private final static Logger log = Logger.getLogger(ComponentRegistrationServicesBean.class);

    public boolean isUserRegistered(long projectId, long userId, String dataSource) throws EJBException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;

        boolean userRegistered = false;

        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);

            query.append("select '1' ");
            query.append("from component_inquiry ci ");
            query.append("where ci.project_id = ? ");
            query.append("and ci.user_id = ?");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, projectId);
            ps.setLong(2, userId);

            rs = ps.executeQuery();
            userRegistered = rs.next();
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return userRegistered;
    }

    public boolean hasUserReviewedProject(long projectId, long userId, String dataSource) throws EJBException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;

        boolean hasReviewed = false;

        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);

            //this checks that the user is eligible to register for a project, based on
            //whether or not they have reviewed the project previously, and the
            //repost status of the project

            query.append("select * ");
            query.append("from r_user_role rur, ");
            query.append("project p ");
            query.append("where  ");
            query.append("rur.r_role_id = 3  ");
            query.append("and rur.cur_version = 1  ");
            query.append("and p.project_id = rur.project_id  ");
            query.append("and p.cur_version = 1  ");
            query.append("and rur.login_id = ? ");
            query.append("and p.project_id in (select project_id from project where comp_vers_id = (select comp_vers_id from project where project_id = ? and cur_version = 1))  ");
            query.append("and not exists (select p2 project_id from project p2  ");
            query.append("where p2.comp_vers_id = (select comp_vers_id from project where project_id = ?  and cur_version = 1) and p2.cur_version = 1  ");
            query.append("and p2.project_stat_id in (5,6,7) and p2.project_type_id = (select project_type_id from project where project_id = ? and cur_version = 1) ) ");
            //query.append("and (not exists (select p2.project_id from project p2 ");
            //query.append("where p2.comp_vers_id = (select comp_vers_id from project where project_id = ?  and cur_version = 1) and p2.cur_version = 1  ");
            //query.append("and p2.project_stat_id = 5 ) or ");
            //query.append("( exists (select p2.project_id from project p2  ");
            //query.append("where p2.comp_vers_id = (select comp_vers_id from project where project_id = ?  and cur_version = 1) and p2.cur_version = 1  ");
            //query.append("and p2.project_stat_id = 5 ) ");
            //query.append("and exists (select r_user_role_v_id from r_user_role where project_id = rur.project_id and r_role_id = 2 and cur_version = 1 and login_id = rur.login_id) )) ");


            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setLong(2, projectId);
            ps.setLong(3, projectId);
            ps.setLong(4, projectId);
            //ps.setLong(5, projectId);
            //ps.setLong(6, projectId);

            rs = ps.executeQuery();
            hasReviewed = rs.next();
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return hasReviewed;
    }

    public boolean isUserWinningDesigner(long projectId, long userId, String dataSource) throws EJBException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;

        boolean isWinningDesigner = false;

        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);

            //this checks if the user is the winning designer for the project

            query.append("select * ");
            query.append("from project_result pr, project p ");
            query.append("where p.project_id = pr.project_id and p.cur_version = 1 ");
            query.append("and pr.placed = 1 ");
            query.append("and p.comp_vers_id = (select comp_vers_id from project where project_id = ? and cur_version = 1) ");
            query.append("and pr.user_id = ? ");
            query.append("and p.project_type_id = 1 ");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, projectId);
            ps.setLong(2, userId);

            rs = ps.executeQuery();
            isWinningDesigner = rs.next();
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return isWinningDesigner;
    }

    public boolean isRegClosed(long projectId, String dataSource) throws EJBException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;

        boolean regClosed = false;

        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);


            query.append("select '1' ");
            query.append("from project p ");
            query.append(", phase_instance pi1 ");
            query.append("where p.project_id = ? ");
            query.append("and p.cur_version = 1 ");
            query.append("and pi1.project_id = p.project_id ");
            query.append("and pi1.phase_id = 1 ");
            query.append("and pi1.cur_version = 1 ");
            query.append("and EXTEND(pi1.start_date, YEAR to HOUR) + ");
            query.append(ComponentRegistrationServices.COMPONENT_REGISTRATION_LENGTH);
            query.append(" units day + 9 units hour < current");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, projectId);

            rs = ps.executeQuery();
            regClosed = rs.next();
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return regClosed;
    }

    public int getMaxUnratedRegistrants(long projectId, String dataSource) throws EJBException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;

        int max_reg = 1000;

        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);


            query.append("select max_unrated_registrants ");
            query.append("from project p ");
            query.append("where p.project_id = ? ");
            query.append("and p.cur_version = 1 ");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, projectId);

            rs = ps.executeQuery();
            if (rs.next()) {
                if (rs.getObject("max_unrated_registrants") != null) {
                    max_reg = rs.getInt("max_unrated_registrants");
                }
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return max_reg;
    }

    public int getMaxRatedRegistrants(long projectId, String dataSource) throws EJBException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;

        int max_reg = 1000;

        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);


            query.append("select max_rated_registrants ");
            query.append("from project p ");
            query.append("where p.project_id = ? ");
            query.append("and p.cur_version = 1 ");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, projectId);

            rs = ps.executeQuery();
            if (rs.next()) {
                if (rs.getObject("max_rated_registrants") != null) {
                    max_reg = rs.getInt("max_rated_registrants");
                }
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return max_reg;
    }

    public int getRatedRegistrantCount(long projectId, String dataSource) throws EJBException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;

        int reg_count = 0;

        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);

            query.append("select count(distinct user_id) ");
            query.append("from component_inquiry ci ");
            query.append("where ci.project_id = ? and rating <> 0");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, projectId);

            rs = ps.executeQuery();
            if (rs.next()) {
                reg_count = rs.getInt(1);
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return reg_count;
    }

    public int getUnratedRegistrantCount(long projectId, String dataSource) throws EJBException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;

        int reg_count = 0;

        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);

            query.append("select count(distinct user_id) ");
            query.append("from component_inquiry ci ");
            query.append("where ci.project_id = ? and rating = 0");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, projectId);

            rs = ps.executeQuery();
            if (rs.next()) {
                reg_count = rs.getInt(1);
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return reg_count;
    }

}

