package com.topcoder.web.ejb.rboard;

import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;

/**
 * @author dok
 * Date: Feb 13, 2004
 */
public class RBoardUserBean extends BaseEJB {


    public void createRBoardUser(String dataSource, long userId, int phaseId, int statusId,
                                 boolean hasContract, boolean canReviewJava,
                                 boolean canReviewDotNet, boolean canReviewFlash) {
        int ret = insert("rboard_user",
                new String[]{"user_id", "phase_id", "status_id", "constract_ind", "java_ind", "net_ind", "flash_ind"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId), String.valueOf(statusId),
                             hasContract ? "1" : "0", canReviewJava ? "1" : "0", canReviewDotNet ? "1" : "0",
                             canReviewFlash ? "1" : "0"},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows inserted into " +
                    "'rboard_user'. Inserted " + ret + ", " +
                    "should have inserted 1."));
        }
    }

    public void setStatus(String dataSource, long userId, int phaseId, int statusId) {
        int ret = update("rboard_user",
                new String[]{"status_id"},
                new String[]{String.valueOf(statusId)},
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows updated in " +
                    "'rboard_user'. Updated " + ret + ", " +
                    "should have updated 1."));
        }
    }

    public void setHasContract(String dataSource, long userId, int phaseId, boolean hasConstract) {
        int ret = update("rboard_user",
                new String[]{"constract_ind"},
                new String[]{hasConstract ? "1" : "0"},
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows updated in " +
                    "'rboard_user'. Updated " + ret + ", " +
                    "should have updated 1."));
        }
    }

    public void setCanReviewJava(String dataSource, long userId, int phaseId, boolean canReviewJava) {
        int ret = update("rboard_user",
                new String[]{"java_ind"},
                new String[]{canReviewJava ? "1" : "0"},
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows updated in " +
                    "'rboard_user'. Updated " + ret + ", " +
                    "should have updated 1."));
        }

    }

    public void setCanReviewDotNet(String dataSource, long userId, int phaseId, boolean canReviewDotNet) {
        int ret = update("rboard_user",
                new String[]{"net_ind"},
                new String[]{canReviewDotNet ? "1" : "0"},
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows updated in " +
                    "'rboard_user'. Updated " + ret + ", " +
                    "should have updated 1."));
        }

    }

    public void setCanReviewFlash(String dataSource, long userId, int phaseId, boolean canReviewFlash) {
        int ret = update("rboard_user",
                new String[]{"flash_ind"},
                new String[]{canReviewFlash ? "1" : "0"},
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows updated in " +
                    "'rboard_user'. Updated " + ret + ", " +
                    "should have updated 1."));
        }

    }

    public int getStatus(String dataSource, long userId, int phaseId) {
        return selectInt("rboard_user",
                "status_id",
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource).intValue();
    }

    public boolean hasContract(String dataSource, long userId, int phaseId) {
        return selectInt("rboard_user",
                "constract_ind",
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource).intValue() == 1;
    }

    public boolean canReviewJava(String dataSource, long userId, int phaseId) {
        return selectInt("rboard_user",
                "java_ind",
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource).intValue() == 1;
    }

    public boolean canReviewDotNet(String dataSource, long userId, int phaseId) {
        return selectInt("rboard_user",
                "net_ind",
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource).intValue() == 1;

    }

    public boolean canReviewFlash(String dataSource, long userId, int phaseId) {
        return selectInt("rboard_user",
                "flash_ind",
                new String[]{"user_id", "phase_id"},
                new String[]{String.valueOf(userId), String.valueOf(phaseId)},
                dataSource).intValue() == 1;

    }

}
