package com.topcoder.web.ejb.rboardapplication;

import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.web.common.RowNotFoundException;
import com.topcoder.shared.util.logging.Logger;

import javax.ejb.EJBException;

/**
 * @author dok
 * Date: Feb 12, 2004
 */
public class RBoardApplicationBean extends BaseEJB {

    private static Logger log = Logger.getLogger(RBoardApplicationBean.class);

    public void createRBoardApplication(String dataSource, long userId, long projectId, int phaseId) {
        int ret = insert("rboard_application",
                new String[] {"user_id", "project_id", "phase_id"},
                new String[] {String.valueOf(userId), String.valueOf(projectId), String.valueOf(phaseId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows inserted into " +
                    "'rboard_application'. Inserted " + ret + ", " +
                    "should have inserted 1."));
        }
    }

    public void setReviewRespId(String dataSource, long userId, long projectId, int phaseId, int reviewRespId) {
        int ret = update("rboard_application",
                new String[] {"review_resp_id"},
                new String[] {String.valueOf(reviewRespId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows updated in " +
                    "'rboard_application'. Updated " + ret + ", " +
                    "should have updated 1."));
        }
    }

    public void setPrimary(String dataSource, long userId, long projectId, int phaseId, boolean isPrimary) {
        int ret = update("rboard_application",
                new String[] {"primary_ind"},
                new String[] {String.valueOf(isPrimary?1:0)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows updated in " +
                    "'rboard_application'. Updated " + ret + ", " +
                    "should have updated 1."));
        }
    }

    public long getReviewRespId(String dataSource, long userId, long projectId, int phaseId) {
        return selectInt("rboard_application",
                "review_resp_id",
                new String[] {"user_id", "project_id", "phase_id"},
                new String[] {String.valueOf(userId), String.valueOf(projectId), String.valueOf(phaseId)},
                dataSource).intValue();
    }

    public boolean isPrimary(String dataSource, long userId, long projectId, int phaseId) {
        Integer ret = selectInt("rboard_application",
                "primary_ind",
                new String[] {"user_id", "project_id", "phase_id"},
                new String[] {String.valueOf(userId), String.valueOf(projectId), String.valueOf(phaseId)},
                dataSource);
        return (ret!=null && ret.intValue()==1);
    }

    public boolean exists(String dataSource, long userId, long projectId, int phaseId) {
        try {
            selectLong("rboard_application",
                    "user_id",
                    new String[] {"user_id", "project_id", "phase_id"},
                    new String[] {String.valueOf(userId), String.valueOf(projectId), String.valueOf(phaseId)},
                    dataSource);
        } catch (RowNotFoundException e) {
            return false;
        }
        return true;

    }

}
