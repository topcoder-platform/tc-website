package com.topcoder.web.ejb.problemrating;

import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;

import javax.ejb.*;
import java.rmi.RemoteException;
import java.sql.*;
import java.util.*;

public class ProblemRatingServicesBean extends BaseEJB{
    private static Logger log = Logger.getLogger(ProblemRatingServicesBean.class);

    private static final String TAG = "ProblemRatingServicesBean";

    /**
     * Returns the tag to append to the default debug statement.
     * This may be overridden for verbose debugging.
     */
    protected String getTag() {
        return TAG;
    }
    public void createProblemRating(int questionID, long coderID, int problemID){
        StringBuffer insertQuery = new StringBuffer(250);
        /***********************Informix*******************************/
        insertQuery.append(" INSERT INTO problem_rating ( question_id, coder_id, problem_id)");
        insertQuery.append(" VALUES (");
        insertQuery.append(questionID);
        insertQuery.append(',');
        insertQuery.append(coderID);
        insertQuery.append(',');
        insertQuery.append(problemID);
        insertQuery.append(")");
        /**************************************************************/
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(insertQuery.toString());
            int rows = ps.executeUpdate();
            if(rows!=1){
                throw new EJBException("Wrong number of rows in insert: " + rows);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new EJBException(ex.getMessage());
        } finally {
            close(ps);
            close(conn);
        }
    }
    public void setProblemRating(int questionID, long coderID, int problemID, int rating){
        StringBuffer updateQuery = new StringBuffer(250);
        /***********************Informix*******************************/
        updateQuery.append(" UPDATE problem_rating SET problem_rating = ?");
        updateQuery.append(" WHERE question_id = ?");
        updateQuery.append(" AND coder_id = ?");
        updateQuery.append(" AND problem_id = ?");
        /**************************************************************/
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(updateQuery.toString());
            ps.setInt(1,rating);
            ps.setInt(2,questionID);
            ps.setLong(3,coderID);
            ps.setInt(4,problemID);
            int rows = ps.executeUpdate();
            if(rows!=1){
                throw new EJBException("Wrong number of rows in update: " + rows);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new EJBException(ex.getMessage());
        } finally {
            close(ps);
            close(conn);
        }
    }
}
