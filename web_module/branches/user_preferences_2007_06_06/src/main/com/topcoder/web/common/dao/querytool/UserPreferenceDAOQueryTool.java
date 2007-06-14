package com.topcoder.web.common.dao.querytool;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.dao.UserPreferenceDAO;
import com.topcoder.web.common.model.Preference;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.UserPreference;

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: July 6, 2006
 */
public class UserPreferenceDAOQueryTool extends Base implements UserPreferenceDAO {

    public UserPreference find(User user, Preference preference) {
        return null;
    }

    public UserPreference find(Long userId, Integer preferenceId) {
        return null;
    }

    public void saveOrUpdate(UserPreference up) {
    }
    
    public List<UserPreference> find(List<Long> userIdList, Integer preferenceId) {
        Request r = new Request();
        r.setContentHandle("user_preference");
        r.setProperty("pr", preferenceId.toString());
        r.setProperty("uids", buildUserInClause(userIdList));

        return getData(r, "user_preference", preferenceId);
    }

    public List<UserPreference> find(Integer preferenceId) {
        Request r = new Request();
        r.setContentHandle("user_preference_all");
        r.setProperty("pr", preferenceId.toString());

        return getData(r, "user_preference_all", preferenceId);
    }

    private String buildUserInClause(List<Long> userIdList) {
        StringBuffer cts = new StringBuffer(100);
        for (Long id : userIdList) {
            cts.append(id).append(",");
        }
        cts.delete(cts.length() - 1, cts.length());
        cts.append(")");
        return cts.toString();
    }

    private List<UserPreference> getData(Request r, String queryName, Integer preferenceId) {
        List<UserPreference> retList = null;
        try {
            DataAccessInt dai = getDataAccess(DBMS.OLTP_DATASOURCE_NAME, true);
            Map result = dai.getData(r);
            ResultSetContainer rsc = (ResultSetContainer) result.get(queryName);
           
            retList = new ArrayList<UserPreference>(rsc.size());
            
            for (ResultSetRow rsr : rsc) {
                retList.add(buildUserPreference(preferenceId, rsr.getLongItem("user_id"), rsr.getStringItem("value")));
            }
        } catch (Exception e) {
            
        }
        return retList;
    }

    private UserPreference buildUserPreference(Integer preferenceId, Long userId, String value) {
        User u = new User();
        u.setId(userId);

        Preference p = new Preference();
        p.setId(preferenceId);
        
        UserPreference up = new UserPreference();
        up.setId(new UserPreference.Identifier(u, p));
        up.setValue(value);
        
        return up;
    }
}
