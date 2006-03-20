package com.topcoder.web.ejb.project;

import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 17, 2006
 */
public class ProjectWagerBean extends BaseEJB {
    public void createProjectWager(long projectId, long userId, int wagerAmount, String dataSource) {
        insert("project_wager", new String[] {"project_id", "user_id", "wager_amount"},
                new String[] {String.valueOf(projectId), String.valueOf(userId), String.valueOf(wagerAmount)},
                dataSource);
    }

    public void updateProjectWager(long projectId, long userId, int wagerAmount, String dataSource) {
        update("project_wager", new String[] {"wager_amount"}, new String[] {String.valueOf(wagerAmount)},
                new String[] {"project_id", "user_id"},
                new String[] {String.valueOf(projectId), String.valueOf(userId)},
                dataSource);
    }

    public boolean exists(long projectId, long userId, String dataSource) {
        return !selectSet("project_wager", new String[]{"'1'"}, new String[]{"project_id", "user_id"},
                new String[] {String.valueOf(projectId), String.valueOf(userId)}, dataSource).isEmpty();
    }

    public int getWager(long projectId, long userId, String dataSource) {
        return selectInt("project_wager", "wager_amount", new String[] {"project_id", "user_id"},
                new String[] {String.valueOf(projectId), String.valueOf(userId)}, dataSource).intValue();
    }
    
    public ResultSetContainer findCurrentCompetitions(String userId) {
        return selectSet("contest", 
            new String[]{"contest_name"}, 
            new String[]{"contest_id"},
            new String[]{"1"}, 
            "java:InformixDS");
            //DBMS.TCS_OLTP_DATASOURCE_NAME);
    }

}
