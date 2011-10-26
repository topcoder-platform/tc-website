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

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     *
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    private static Logger log = Logger.getLogger(UserServicesBean.class);

    private static final String GET_RATINGS_QUERY =
            "select c.coder_id " +
            "     , u.handle " +
            "     , NVL(r.rating,0) as algorithm_rating " +
            "     , NVL(ar.rating,0) as hs_algorithm_rating " +
            "     , NVL(armm.rating,0) as marathon_match_rating " +
            "     , max(NVL(sr.rating,0)) as max_software_rating " +
            "  from OUTER coder c " +
            "     , user u " +
            "     , OUTER(rating r) " +
            "     , OUTER(algo_rating ar) " +
            "     , OUTER(algo_rating armm) " +
            "     , OUTER(tcs_catalog:user_rating sr) " +
            " where u.user_id = ? " +
            "   and u.user_id = c.coder_id " +
            "   and r.coder_id = u.user_id " +
            "   and sr.user_id = u.user_id " +
            "   and ar.coder_id = u.user_id " +
            "   and ar.algo_rating_type_id = 2 " +
            "   and armm.coder_id = u.user_id " +
            "   and armm.algo_rating_type_id = 3 " +
            " group by 1,2,3,4,5";

    private static final String GET_RATED_STUDIO_QUERY =
        "select count(*) as num_passed from submission s, submission_review sr " +
        "where sr.submission_id = s.submission_id " +
        "   and sr.review_status_id = 1 " +
        "   and s.submitter_id = ? ";

    private static final String GET_REGISTERED_IN_COMPETITION_QUERY =
        "select count(*) as num_registered " +
        "  from project_phase pi  " +
        "    , project p  " +
        "    , resource r  " +
        "    , resource_info ri " + 
        "  where pi.phase_type_id = 1 " +  
        "    and pi.scheduled_end_time > current - ? units day " +
        "    and pi.project_id = p.project_id  " +
        "    and p.project_status_id = 1  " +
        "    and r.project_id = p.project_id  " +
        "    and r.resource_role_id in (1, 11, 1001, 1002) " +
        "    and ri.resource_id = r.resource_id  " +
        "    and ri.resource_info_type_id = 1  " +
        "    and ri.value = ? " +
        "    and p.project_category_id in ( ";

    
    public boolean isRated(long userId) {
        log.debug("UserServicesBean.isRated(" + userId + ") called...");
        
        Connection connOLTP = null;
        Connection connStudio = null;
        PreparedStatement psOLTP = null;
        ResultSet rsOLTP = null;
        PreparedStatement psStudio = null;
        ResultSet rsStudio = null;

        boolean rated = false;
        
        try {
            // first we check algo, design, development, high school and marathon.
            connOLTP = DBMS.getConnection(DBMS.OLTP_DATASOURCE_NAME);
            psOLTP = connOLTP.prepareStatement(GET_RATINGS_QUERY);
            psOLTP.setLong(1, userId);
            rsOLTP = psOLTP.executeQuery();
            if (rsOLTP.next() &&
                (rsOLTP.getInt("algorithm_rating") +
                rsOLTP.getInt("max_software_rating") +
                rsOLTP.getInt("hs_algorithm_rating") +
                rsOLTP.getInt("marathon_match_rating")) > 0) {
                rated = true;
            }
            
            // then we check studio.
            // "rated in studio" means at least one passing submission
            connStudio = DBMS.getConnection(DBMS.STUDIO_DATASOURCE_NAME);
            psStudio = connStudio.prepareStatement(GET_RATED_STUDIO_QUERY);
            psStudio.setLong(1, userId);
            rsStudio = psStudio.executeQuery();
            if (rsStudio.next() &&
                rsStudio.getInt("num_passed") > 0) {
                rated = true;
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

    public boolean hasCompetitionRegistration(long userId, int maxDaysFromRegistration, int[] categoryIds) {
        
        if (categoryIds.length == 0) {
            return false;
        }
        
        String categories = "";
        for (int i = 0; i < categoryIds.length; i++) {
            if (i > 0) {
                categories += ", ";
            }
            categories += categoryIds[i];
        }

        log.debug("UserServicesBean.hasRegistration(" + userId + ", {" + categories + "}) called...");

        String sql = GET_REGISTERED_IN_COMPETITION_QUERY + categories + ")";
        
        Connection connTcsCatalog = null;
        PreparedStatement psTcsCatalog = null;
        ResultSet rsTcsCatalog = null;

        boolean registered = false;
        
        try {
            connTcsCatalog = DBMS.getConnection(DBMS.TCS_OLTP_DATASOURCE_NAME);
            psTcsCatalog = connTcsCatalog.prepareStatement(sql);
            psTcsCatalog.setInt(1, maxDaysFromRegistration);
            psTcsCatalog.setString(2, String.valueOf(userId));
            rsTcsCatalog = psTcsCatalog.executeQuery();
            if (rsTcsCatalog.next() &&
                rsTcsCatalog.getInt("num_registered") > 0) {
                registered = true;
            }            
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException(sqe.getMessage());
        } catch (Exception e) {
            throw new EJBException(e.getMessage());
        } finally {
            close(rsTcsCatalog);
            close(psTcsCatalog);
            close(connTcsCatalog);
        }
        return registered;
    }
}
