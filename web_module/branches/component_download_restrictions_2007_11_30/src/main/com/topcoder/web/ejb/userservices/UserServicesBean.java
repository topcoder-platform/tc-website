package com.topcoder.web.ejb.userservices;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.ejb.EJBException;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;

/**
 * This class provides remote services regarding a user.
 * 
 * @author Pablo
 */
public class UserServicesBean extends BaseEJB {

    private static Logger log = Logger.getLogger(UserServicesBean.class);

    private static final String GET_RATINGS_QUERY =
            "select c.coder_id " +
            "     , u.handle " +
            "     , NVL(r.rating,0) as algorithm_rating " +
            "     , NVL(dsr.rating,0) as design_rating " +
            "     , NVL(dvr.rating,0) as development_rating " +
            "     , NVL(ar.rating,0) as hs_algorithm_rating " +
            "     , NVL(armm.rating,0) as marathon_match_rating " +
            "  from OUTER coder c " +
            "     , user u " +
            "     , OUTER(rating r) " +
            "     , OUTER(algo_rating ar) " +
            "     , OUTER(algo_rating armm) " +
            "     , OUTER(tcs_catalog:user_rating dsr) " +
            "     , OUTER(tcs_catalog:user_rating dvr) " +
            " where u.user_id = ? " +
            "   and u.user_id = c.coder_id " +
            "   and r.coder_id = u.user_id " +
            "   and dsr.user_id = u.user_id " +
            "   and dsr.phase_id = 112 " +
            "   and dvr.user_id = u.user_id " +
            "   and dvr.phase_id = 113 " +
            "   and ar.coder_id = u.user_id " +
            "   and ar.algo_rating_type_id = 2 " +
            "   and armm.coder_id = u.user_id " +
            "   and armm.algo_rating_type_id = 3";

    private static final String GET_RATED_STUDIO_QUERY =
        "select count(*) as num_passed from submission s, submission_review sr " +
        "where sr.submission_id = s.submission_id " +
        "   and sr.review_status_id = 1 " +
        "   and s.submitter_id = ? ";


    public Boolean isRated(long userId) {
        log.debug("UserServicesBean.isRated(" + userId + ") called...");
        
        Connection connOLTP = null;
        Connection connStudio = null;
        PreparedStatement psOLTP = null;
        ResultSet rsOLTP = null;
        PreparedStatement psStudio = null;
        ResultSet rsStudio = null;

        Boolean rated = Boolean.FALSE;
        
        try {
            // first we check algo, design, development, high school and marathon.
            connOLTP = DBMS.getConnection(DBMS.OLTP_DATASOURCE_NAME);
            psOLTP = connOLTP.prepareStatement(GET_RATINGS_QUERY);
            psOLTP.setLong(1, userId);
            rsOLTP = psOLTP.executeQuery();
            if (rsOLTP.next() &&
                (rsOLTP.getInt("algorithm_rating") +
                rsOLTP.getInt("design_rating") +
                rsOLTP.getInt("development_rating") +
                rsOLTP.getInt("hs_algorithm_rating") +
                rsOLTP.getInt("marathon_match_rating")) > 0) {
                rated = Boolean.TRUE;
            }
            
            // then we check studio.
            // "rated in studio" means at least one passing submission
            connStudio = DBMS.getConnection(DBMS.STUDIO_DATASOURCE_NAME);
            psStudio = connStudio.prepareStatement(GET_RATED_STUDIO_QUERY);
            psStudio.setLong(1, userId);
            rsStudio = psStudio.executeQuery();
            if (rsStudio.next() &&
                rsStudio.getInt("num_passed") > 0) {
                rated = Boolean.TRUE;
            }            
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException(sqe.getMessage());
        } catch (Exception e) {
            throw new EJBException(e.getMessage());
        } finally {
            close(rsOLTP);
            close(psOLTP);
            close(connOLTP);
            close(rsStudio);
            close(psStudio);
            close(connStudio);
        }
        return rated;
    }
}
