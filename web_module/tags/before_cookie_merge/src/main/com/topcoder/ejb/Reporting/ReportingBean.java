package com.topcoder.ejb.Reporting;

import com.topcoder.common.web.constant.OLTP;
import com.topcoder.common.web.data.report.*;
import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.ValueTag;
import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

import javax.sql.DataSource;
import javax.naming.InitialContext;
import javax.naming.Context;
import javax.ejb.EJBException;
import java.rmi.RemoteException;
import java.sql.*;
import java.util.ArrayList;


public class ReportingBean extends BaseEJB {
    private static Logger log = Logger.getLogger(ReportingBean.class);

    public RecordTag getDayReg(java.sql.Timestamp after) throws RemoteException {
        RecordTag result = null;
        try {
            result = getDayReg("DayRegs", after);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RemoteException("ejb.Reporting:getDayReg:ERROR:" + e);
        }
        return result;
    }


    public RecordTag getSchoolCount(java.sql.Timestamp before) throws RemoteException {
        RecordTag result = null;
        try {
            result = getSchoolCount("SchoolCounts", before);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RemoteException("ejb.Reporting:getSchoolCount:ERROR:" + e);
        }
        return result;
    }


    public RecordTag getSkillTotal(java.sql.Timestamp before) throws RemoteException {
        RecordTag result = null;
        try {
            result = getSkillTotal("SkillTotals", before);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RemoteException("ejb.Reporting:getSkillTotal:ERROR:" + e);
        }
        return result;
    }


    public RecordTag getDayReg(String tagName, java.sql.Timestamp after)
            throws RemoteException {
        RecordTag result = null;
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = new StringBuffer(300);
        query.append(" SELECT");
        query.append(" TO_CHAR(c.member_since, '%m/%d/%y')");
        query.append(" ,COUNT(*)");
        query.append(" ,SUM(CASE WHEN u.status = 'A' THEN 1 ELSE 0 END)");
        query.append(" ,SUM(CASE WHEN r.referral_id = 40 THEN 1 ELSE 0 END)");
        query.append(" ,MIN(TO_CHAR(c.member_since, '%y%m%d'))");
        query.append(" FROM");
        query.append(" user u");
        query.append(" ,coder c");
        query.append(" ,group_user g");
        query.append(" ,coder_referral r");
        query.append(" WHERE");
        query.append(" u.user_id = c.coder_id");
        query.append(" AND u.user_id = g.user_id");
        query.append(" AND u.user_id = r.coder_id");
        query.append(" AND g.group_id != ");
        query.append(OLTP.STAFF_GROUP_ID);
        query.append(" AND u.email NOT LIKE '%topcoder.com'");
        if (after != null) {
            query.append(" AND c.member_since > ?");
        }
        query.append(" GROUP BY");
        query.append(" 1");
        query.append(" ORDER BY");
        query.append(" 5");
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            if (after != null) {
                ps.setTimestamp(1, after);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                if (result == null) result = new RecordTag(tagName);
                RecordTag record = new RecordTag("DayReg");
                record.addTag(new ValueTag("MemberSince", rs.getString(1)));
                record.addTag(new ValueTag("Registered", rs.getInt(2)));
                record.addTag(new ValueTag("Activated", rs.getInt(3)));
                record.addTag(new ValueTag("Referral", rs.getInt(4)));
                result.addTag(record);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RemoteException("ejb.Reporting:getDayReg(String,Timestamp):ERROR:" + e);
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }


    public RecordTag getSkillTotal(String tagName, java.sql.Timestamp before)
            throws RemoteException {
        RecordTag result = null;
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = new StringBuffer(500);
        try {
            conn = DBMS.getConnection();
            query.append(" SELECT");
            query.append(" c.coder_id");
            query.append(" ,AVG(ranking) AS rnk");
            query.append(" FROM");
            query.append(" user u");
            query.append(" ,coder c");
            query.append(" ,coder_skill cs");
            query.append(" ,group_user g");
            query.append(" WHERE ");
            query.append(" u.user_id = c.coder_id");
            query.append(" AND u.user_id = g.user_id");
            query.append(" AND g.group_id != ");
            query.append(OLTP.STAFF_GROUP_ID);
            if (before != null) {
                query.append(" AND c.member_since < ?");
            }
            query.append(" AND c.coder_id = cs.coder_id");
            query.append(" AND status = 'A'");
            query.append(" AND email NOT LIKE '%topcoder.com'");
            query.append(" GROUP BY");
            query.append(" c.coder_id");
            query.append(" INTO TEMP");
            query.append(" temp_count");
            ps = conn.prepareStatement(query.toString());
            if (before != null) {
                ps.setTimestamp(1, before);
            }
            ps.execute();
            query.delete(0, 500);
            query.append(" SELECT");
            query.append(" COUNT(*) AS skills_count");
            query.append(" ,AVG(rnk) AS avg_rnk");
            query.append(" FROM");
            query.append(" temp_count");
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            while (rs.next()) {
                if (result == null) result = new RecordTag(tagName);
                RecordTag record = new RecordTag("SkillTotal");
                record.addTag(new ValueTag("TotalEnteringSkills", rs.getInt(1)));
                record.addTag(new ValueTag("AvgSelfRating", rs.getFloat(2)));
                result.addTag(record);
            }
        } catch (SQLException se) {
            DBMS.printSqlException(true, se);
            throw new RemoteException("ejb.Reporting:getSkillTotal(String,Timestamp):ERROR:" + se);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RemoteException("ejb.Reporting:getSkillTotal(String,Timestamp):ERROR:" + e);
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }


    public RecordTag getSchoolCount(String tagName, java.sql.Timestamp before)
            throws RemoteException {
        RecordTag result = null;
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = new StringBuffer(500);
        try {
            query.append(" SELECT");
            query.append(" CASE WHEN current_school.school_id=0 THEN current_school.school_name ELSE school.name END");
            query.append(" ,COUNT(*)");
            query.append(" FROM");
            query.append(" user");
            query.append(" ,group_user");
            query.append(" ,coder");
            query.append(" ,current_school");
            query.append(" ,school");
            query.append(" WHERE");
            query.append(" LOWER(email) NOT LIKE '%topcoder.com'");
            if (before != null) {
                query.append(" AND coder.member_since < ?");
            }
            query.append(" AND user.status = 'A'");
            query.append(" AND group_user.group_id = 10");
            query.append(" AND NOT EXISTS (");
            query.append(" SELECT");
            query.append(" 1");
            query.append(" FROM");
            query.append(" group_user");
            query.append(" WHERE");
            query.append(" group_id = 13");
            query.append(" AND group_user.user_id = user.user_id");
            query.append(" )");
            query.append(" AND user.user_id = group_user.user_id");
            query.append(" AND user.user_id = current_school.coder_id");
            query.append(" AND user.user_id = coder.coder_id");
            query.append(" AND current_school.school_id = school.school_id");
            query.append(" GROUP BY");
            query.append(" 1");
            query.append(" ORDER BY");
            query.append(" 2 DESC");
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            if (before != null) {
                ps.setTimestamp(1, before);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                if (result == null) result = new RecordTag(tagName);
                RecordTag record = new RecordTag("SchoolCount");
                record.addTag(new ValueTag("Name", rs.getString(1)));
                record.addTag(new ValueTag("Count", rs.getInt(2)));
                result.addTag(record);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RemoteException("ejb.Reporting:getSchoolCount:ERROR:" + e);
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }


    /**
     * Execute the given query and returns an ArrayList of arrays of
     * ResultItems.
     */
    public ArrayList getResult(Query query) throws RemoteException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList resultList = new ArrayList();
        int[] returnTypes = query.getReturnTypes();
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            if (query.getDB()==null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource)ctx.lookup(query.getDB());
            conn = ds.getConnection();

            log.debug("query:\n" + query.getQuery());
            ps = conn.prepareStatement(query.getQuery());
            rs = ps.executeQuery();
            while (rs.next()) {
                ResultItem[] resultItems = new ResultItem[returnTypes.length];
                for (int i = 0; i < returnTypes.length; i++) {
                    resultItems[i] = getResultItem(rs, returnTypes[i], i + 1);
                }
                resultList.add(resultItems);
            }
        } catch (SQLException sqe) {
            log.debug("query: " + query);
            if (returnTypes != null) {
                for (int i = 0; i < returnTypes.length; i++)
                    System.out.print(returnTypes[i] + ",");
                System.out.println(" ");
            }
            DBMS.printSqlException(true, sqe);
            throw new RemoteException(sqe.getMessage());
        } catch (Exception e) {
            log.debug("query: " + query);
            if (returnTypes != null) {
                for (int i = 0; i < returnTypes.length; i++)
                    System.out.print(returnTypes[i] + ",");
                System.out.println("  ");
            }
            e.printStackTrace();
            throw new RemoteException(e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
            } catch (Exception ignore) {
                log.error("rs   close problem");
            }
            try {
                if (ps != null) ps.close();
            } catch (Exception ignore) {
                log.error("ps   close problem");
            }
            try {
                if (conn != null) conn.close();
            } catch (Exception ignore) {
                log.error("conn close problem");
            }
            rs = null;
            ps = null;
            conn = null;
        }
        return resultList;
    }


    /**
     * Returns a particular type of return item.
     */
    private ResultItem getResultItem(ResultSet rs, int returnType, int col)
            throws SQLException, Exception {
        switch (returnType) {
            case ResultItem.INT:
                return new IntResult(rs.getInt(col));
            case ResultItem.STRING:
                return new StringResult(rs.getString(col));
            case ResultItem.DATE:
                return new DateResult(rs.getDate(col));
            case ResultItem.FLOAT:
                return new FloatResult(rs.getFloat(col));
            default:
                throw new Exception("invalid returnType: " + returnType);
        }
    }


}
