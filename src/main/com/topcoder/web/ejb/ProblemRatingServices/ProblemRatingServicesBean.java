package com.topcoder.web.ejb.ProblemRatingServices;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.NavigationException;

import javax.ejb.*;
import java.rmi.RemoteException;
import java.sql.*;
import java.util.*;

public class ProblemRatingServicesBean implements SessionBean {
    private static Logger log = Logger.getLogger(ProblemRatingServicesBean.class);

    private static final String TAG = "ProblemRatingServicesBean";

    protected SessionContext ctx;

    /**
     * Returns the tag to append to the default debug statement.
     * This may be overridden for verbose debugging.
     */
    protected String getTag() {
        return TAG;
    }
    public void submitAnswers(int[] questions, int[] ratings, long coderID, int problemID) throws Exception{
        StringBuffer insertQuery = new StringBuffer(250);
        StringBuffer countQuery = new StringBuffer(250);
        /***********************Informix*******************************/
        insertQuery.append(" INSERT INTO problem_rating ( question_id, coder_id, problem_id, problem_rating)");
        insertQuery.append(" VALUES (?,");
        insertQuery.append(coderID);
        insertQuery.append(',');
        insertQuery.append(problemID);
        insertQuery.append(",?)");

        countQuery.append("SELECT count(*) from problem_rating_question");
        /**************************************************************/
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(countQuery.toString());
            rs = ps.executeQuery();
            rs.next();
            if(questions.length!=rs.getInt(1))
                throw new IllegalArgumentException("Not enough answers");
            ps = conn.prepareStatement(insertQuery.toString());
            for(int i = 0; i<questions.length; i++){
                ps.setInt(1,questions[i]);
                ps.setInt(2,ratings[i]);
                ps.executeUpdate();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            throw new NavigationException("You may only rate a problem once,");
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                    log.debug("cx closed...");
                } catch (Exception ignore) {
                    log.error("cx NOT closed...");
                }
            }
        }
    }
    //*************************************************************************
    //                                 EJB lifecycle
    //*************************************************************************

    public void ejbActivate() {
        System.out.println(getTag() + ":  ejbActivate called");
    }

    public void ejbPassivate() {
        System.out.println(getTag() + ":  ejbPassivate called");
    }

    public void ejbCreate() throws CreateException {
        System.out.println(getTag() + ":  ejbCreate called");
    }

    public void ejbRemove() throws RemoteException {
        System.out.println(getTag() + ":  ejbRemove called");
    }

    public void setSessionContext(SessionContext ctx) throws RemoteException {
        System.out.println(getTag() + ":  setSessionContext called");
        this.ctx = ctx;
    }
}
