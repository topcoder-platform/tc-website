/*
 * Submit.java
 *
 * Created on October 8, 2004, 12:14 PM
 */

package com.topcoder.web.tc.controller.request.contracting;

import com.topcoder.web.tc.model.ContractingInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

import java.util.*;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.*;

import javax.transaction.UserTransaction;
import com.topcoder.shared.util.*;

import com.topcoder.web.ejb.user.UserPreference;

import javax.naming.Context;
import javax.naming.InitialContext;
/**
 *
 * @author  rfairfax
 */
public class Submit  extends ContractingBase {


    protected void contractingProcessing() throws TCWebException {
        try {
            UserTransaction ut = Transaction.get(getInitialContext());
            ut.begin();

            try {
                //prefs
                InitialContext ctx = TCContext.getInitial();
                UserPreference prefbean = (UserPreference)createEJB(ctx, UserPreference.class);
                
                //load pref group list, iterate through each one, deleting, updating
                Request r = new Request();
                r.setContentHandle("preference_groups");

                ResultSetContainer rsc = (ResultSetContainer)getDataAccess().getData(r).get("preference_groups");
                for(int i = 0; i < rsc.size(); i++) {
                    ResultSetContainer rscPrefs = prefbean.getPreferencesByGroup(info.getUserID(), rsc.getIntItem(i, "preference_group_id"),DBMS.COMMON_OLTP_DATASOURCE_NAME);
                    for(int j = 0; j < rscPrefs.size(); j++) {
                        //check if info object has this preference
                        if(info.getPreference(rscPrefs.getStringItem(j, "preference_id")) == null) {
                            //delete
                            prefbean.removeUserPreference(info.getUserID(), rscPrefs.getIntItem(j, "preference_id"), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                        } else {
                            //update
                            prefbean.setPreferenceValueID(info.getUserID(), rscPrefs.getIntItem(j, "preference_id"),
                                Integer.parseInt(info.getPreference(rscPrefs.getStringItem(j, "preference_id"))), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                            info.removePref(rscPrefs.getStringItem(j, "preference_id"));
                        }
                    }
                }
                //insert
                Iterator i = info.getPreferenceNames();
                while(i.hasNext()) {
                    String s = (String)i.next();
                    prefbean.createUserPreference(info.getUserID(), Integer.parseInt(s), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                    prefbean.setPreferenceValueID(info.getUserID(), Integer.parseInt(s), Integer.parseInt(info.getPreference(s)), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                }
                
                //resume
                
                //skills
                
                //notes
                
                ut.commit();
                clearInfo();
            } catch(Exception e) {
                ut.rollback();
                throw e;
            }
        } catch(TCWebException tce) {
            throw tce;
        } catch(Exception e) {
            throw new TCWebException(e);
        }
    }

    protected void setNextPage() {
        
        setNextPage(Constants.CONTRACTING_SUCCESS_PAGE); 
        setIsNextPageInContext(true);
    }
    
}
