package com.topcoder.ejb.Search;

import com.topcoder.common.web.constant.OLTP;
import com.topcoder.common.web.constant.Sort;
import com.topcoder.common.web.data.*;
import com.topcoder.common.web.data.stat.coder.Coder;
import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

import java.rmi.RemoteException;
import java.sql.*;
import java.util.ArrayList;

/*************************************************************************************************
 *
 * Creation Date: 10-17-00
 * Modified Date: 05-24-01
 * Author: Steve Post
 *
 * The Search is a Stateless Session Bean that will be used for the following purposes:
 * --Display of Coders by state and skill information by each coder.
 *
 *************************************************************************************************
 */

public class SearchBean extends BaseEJB {

    private static Logger log = Logger.getLogger(SearchBean.class);

    /**
     *****************************************************************
     * The getCoders method is used by coders to return
     * an ArrayList of coders matching defined criteria.
     * @param search - the search object we're working with
     * @return ArrayList
     *****************************************************************
     */

    public MemberSearch getCoders(MemberSearch search)
            throws RemoteException {
        log.debug("ejb:Search:getCoders() called...");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList result = new ArrayList();
        Scroll scroll = null;

        StringBuffer query = new StringBuffer(600);
        query.append("SELECT c.coder_id");
        query.append(" ,c.handle");
        query.append(" ,c.state_code");
        query.append(" ,r.rating");
        query.append(" ,r.num_ratings");
        query.append(" ,(SELECT date FROM calendar WHERE calendar_id = ro.calendar_id)");
        query.append(" ,LOWER(c.handle) as lower_case_handle");
        query.append(" ,CASE WHEN r.rating > 0 THEN 1 ELSE 2 END AS rating_order");
        query.append(" FROM coder c");
        query.append(" ,rating r");
        if (search.getMonthsSinceLastComp() == -1) {
            query.append(" ,OUTER round ro");
        } else {
            query.append(" ,round ro");
            query.append(" ,calendar cal");
        }
        query.append(" WHERE r.coder_id = c.coder_id");
        query.append(" AND r.last_rated_round_id = ro.round_id");
        query.append(" AND c.status = 'A'");
        if (search.getMonthsSinceLastComp() != -1)
            query.append(" AND ro.calendar_id = cal.calendar_id");
        if (!search.getHandle().equals("%")) {
            query.append(" AND LOWER(c.handle) LIKE LOWER('");
            query.append(search.getHandle());
            query.append("') ");
        }
        if (!search.getState().equals("%")) {
            query.append(" AND c.state_code = '");
            query.append(search.getState());
            query.append("' ");
        }
        if (search.getMinRating() != -1) {
            query.append(" AND r.rating >=");
            query.append(search.getMinRating());
        }
        if (search.getMaxRating() != -1) {
            query.append(" AND r.rating <=");
            query.append(search.getMaxRating());
        }
        if (search.getMinNumRatings() != -1) {
            query.append(" AND r.num_ratings >=");
            query.append(search.getMinNumRatings());
        }
        if (search.getMaxNumRatings() != -1) {
            query.append(" AND r.num_ratings <=");
            query.append(search.getMaxNumRatings());
        }
        if (search.getMonthsSinceLastComp() != -1) {
            query.append(" AND cal.date > CURRENT - ");
            query.append(search.getMonthsSinceLastComp() * 30 );
            query.append(" UNITS DAY");
        }
        query.append(" ORDER BY rating_order, lower_case_handle");
        try {
            conn = DBMS.getDWConnection();
            log.debug(query.toString());
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            scroll = search.getScroll();
            int recCount = 1;
            while (rs.next()) {
                if (recCount < (scroll.getReturns() + 1)) {
                    SearchResult searchResult = new SearchResult();
                    searchResult.setCoderId(rs.getInt(1));
                    searchResult.setHandle(rs.getString(2));
                    searchResult.setState(rs.getString(3));
                    searchResult.setRating(rs.getInt(4));
                    searchResult.setNumRatings(rs.getInt(5));
                    searchResult.setLastCompDate(rs.getDate(6));
                    result.add(searchResult);
                }
                recCount++;
            }
            scroll.setRow(1);
            scroll.setSize(recCount - 1);
            log.debug("result size: " + scroll.getSize());
            scroll.setAllowPrevious(false);
            if (scroll.getSize() > scroll.getReturns())
                scroll.setAllowNext(true);
            else
                scroll.setAllowNext(false);
            search.setCoders(result);

        } catch (SQLException sqe) {
            log.debug("query: \n" + query.toString());
            DBMS.printSqlException(true, sqe);
            throw new RemoteException(sqe.getMessage());
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
        return search;
    }


    /**
     *****************************************************************
     * The scroll method returns a different part of the
     * result set depending on what is in the search's scroll object.
     * an ArrayList of coders matching defined criteria.
     * @param search - the search object we're working with
     * @return ArrayList
     *****************************************************************
     */
    public MemberSearch scroll(MemberSearch search)
            throws RemoteException {
        log.debug("ejb:Search:scroll() called...");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList result = new ArrayList();
        Scroll scroll = null;

        StringBuffer query = new StringBuffer(600);
        query.append("SELECT c.coder_id");
        query.append(" ,c.handle");
        query.append(" ,c.state_code");
        query.append(" ,r.rating");
        query.append(" ,r.num_ratings");
        query.append(" ,(SELECT date FROM calendar WHERE calendar_id = ro.calendar_id)");
        query.append(" ,lower(c.handle) as lower_case_handle");
        query.append(" ,CASE WHEN r.rating > 0 THEN 1 ELSE 2 END AS rating_order");
        query.append(" FROM coder c");
        query.append(" ,rating r");
        if (search.getMonthsSinceLastComp() == -1) {
            query.append(" ,OUTER round ro");
        } else {
            query.append(" ,round ro");
            query.append(" ,calendar cal");
        }
        query.append(" WHERE r.coder_id = c.coder_id");
        query.append(" AND r.last_rated_round_id = ro.round_id");
        query.append(" AND c.status = 'A'");
        if (search.getMonthsSinceLastComp() != -1)
            query.append(" AND ro.calendar_id = cal.calendar_id");
        if (!search.getHandle().equals("%")) {
            query.append(" AND LOWER(c.handle) LIKE LOWER('");
            query.append(search.getHandle());
            query.append("') ");
        }
        if (!search.getState().equals("%")) {
            query.append(" AND c.state_code = '");
            query.append(search.getState());
            query.append("' ");
        }
        if (search.getMinRating() != -1) {
            query.append(" AND r.rating >=");
            query.append(search.getMinRating());
        }
        if (search.getMaxRating() != -1) {
            query.append(" AND r.rating <=");
            query.append(search.getMaxRating());
        }
        if (search.getMinNumRatings() != -1) {
            query.append(" AND r.num_ratings >=");
            query.append(search.getMinNumRatings());
        }
        if (search.getMaxNumRatings() != -1) {
            query.append(" AND r.num_ratings <=");
            query.append(search.getMaxNumRatings());
        }
        if (search.getMonthsSinceLastComp() != -1) {
            query.append(" AND cal.date > CURRENT - ");
            query.append(search.getMonthsSinceLastComp() * 30);
            query.append(" UNITS DAY");
        }
        query.append(" ORDER BY rating_order, lower_case_handle");
        try {
            conn = DBMS.getDWConnection();
            log.debug(query.toString());
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            scroll = search.getScroll();
            int recCount = 1;
            while (rs.next()) {
                if (scroll.getNext()) {
                    if ((recCount >= (scroll.getRow() + scroll.getReturns())) && (recCount < (scroll.getRow() + 2 * scroll.getReturns()))) {
                        SearchResult searchResult = new SearchResult();
                        searchResult.setCoderId(rs.getInt(1));
                        searchResult.setHandle(rs.getString(2));
                        searchResult.setState(rs.getString(3));
                        searchResult.setRating(rs.getInt(4));
                        searchResult.setNumRatings(rs.getInt(5));
                        searchResult.setLastCompDate(rs.getDate(6));
                        result.add(searchResult);
                    }
                }
                if (!scroll.getNext()) {
                    if ((recCount >= (scroll.getRow() - scroll.getReturns())) && (recCount < scroll.getRow())) {
                        SearchResult searchResult = new SearchResult();
                        searchResult.setCoderId(rs.getInt(1));
                        searchResult.setHandle(rs.getString(2));
                        searchResult.setState(rs.getString(3));
                        searchResult.setRating(rs.getInt(4));
                        searchResult.setNumRatings(rs.getInt(5));
                        searchResult.setLastCompDate(rs.getDate(6));
                        result.add(searchResult);
                    }
                }
                recCount++;
            }
            if (scroll.getNext()) {
                scroll.setRow(scroll.getRow() + scroll.getReturns());
            } else {
                scroll.setRow(scroll.getRow() - scroll.getReturns());
            }

            scroll.setSize(recCount - 1);
            if (scroll.getRow() - scroll.getReturns() > 0)
                scroll.setAllowPrevious(true);
            else
                scroll.setAllowPrevious(false);
            if (scroll.getRow() + scroll.getReturns() > scroll.getSize())
                scroll.setAllowNext(false);
            else
                scroll.setAllowNext(true);
            search.setCoders(result);
        } catch (SQLException sqe) {
            log.debug("query: \n" + query.toString());
            DBMS.printSqlException(true, sqe);
            throw new RemoteException(sqe.getMessage());
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
        return search;
    }


    public ArrayList getReferrals(int userId)
            throws RemoteException {
        ArrayList result = null;
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = new StringBuffer(350);
        query.append(" SELECT");
        query.append(" u.user_id");
        query.append(" ,u.handle");
        query.append(" ,c.member_since");
        query.append(" ,r.rating");
        query.append(" FROM");
        query.append(" user u");
        query.append(" INNER JOIN coder c ON");
        query.append(" u.user_id = c.coder_id");
        query.append(" INNER JOIN rating r ON");
        query.append(" u.user_id = r.coder_id");
        query.append(" INNER JOIN coder_referral cr ON");
        query.append(" cr.referral_id = ");
        query.append(OLTP.MEMBER_REFERRAL);
        query.append(" AND u.user_id = cr.coder_id");
        query.append(" AND cr.reference_id = ?");
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            SortKey sort = null;
            while (rs.next()) {
                Coder referral = new Coder();
                referral.setCoderId(rs.getInt(1));
                referral.setHandle(rs.getString(2));
                referral.setMemberSince(rs.getDate(3));
                referral.setRating(rs.getInt(4));
                if (sort == null) {
                    sort = new SortKey(Sort.DEFAULT_REFERRAL_SORT_KEY, Sort.DEFAULT_REFERRAL_SORT_DIR);
                }
                referral.setSort(sort);
                if (result == null) result = new ArrayList();
                result.add(referral);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RemoteException("ejb.Util:getReferrals:ERROR:" + e);
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


}
