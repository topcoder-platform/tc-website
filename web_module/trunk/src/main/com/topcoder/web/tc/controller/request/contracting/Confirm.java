/*
 * Confirm.java
 *
 * Created on October 7, 2004, 2:11 PM
 */

package com.topcoder.web.tc.controller.request.contracting;

import com.topcoder.web.tc.model.ContractingInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

import java.util.*;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.*;

import com.topcoder.web.tc.model.PreferenceGroup;
import com.topcoder.web.tc.model.Preference;
import com.topcoder.web.tc.model.PreferenceValue;
/**
 *
 * @author  rfairfax
 */
public class Confirm  extends ContractingBase {
    
    protected void contractingProcessing() throws TCWebException {
        try {
            //load preference groups
            HashMap groups = new HashMap();

            Request r = new Request();
            r.setContentHandle("preference_groups");

            ResultSetContainer rsc = (ResultSetContainer)getDataAccess().getData(r).get("preference_groups");
            for(int i = 0; i < rsc.size(); i++) {

                String name = rsc.getStringItem(i, "preference_group_desc");

                //load preferences here
                Request rpref = new Request();
                rpref.setContentHandle("preferences_by_group");
                rpref.setProperty("prid", String.valueOf(rsc.getIntItem(i, "preference_group_id")));

                HashMap vals = new HashMap();
                
                ResultSetContainer rscPref = (ResultSetContainer)getDataAccess().getData(rpref).get("preferences_by_group");
                for(int j = 0; j < rscPref.size(); j++) {                   

                    String text = rscPref.getStringItem(j, "preference_desc");
                    int type =rscPref.getIntItem(j, "preference_type_id");
                    int id = rscPref.getIntItem(j, "preference_id");

                    if(type != Constants.PREFERENCE_SINGLE_ANSWER && info.getPreference(String.valueOf(id)) != null) {
                        //look up answer
                        String answer = "";
                        
                        Request rval = new Request();
                        rval.setContentHandle("preference_values");
                        rval.setProperty("prid", String.valueOf(rscPref.getIntItem(j, "preference_id")));

                        ResultSetContainer rscVal = (ResultSetContainer)getDataAccess().getData(rval).get("preference_values");

                        for(int x = 0; x < rscVal.size(); x++) {

                            if(info.getPreference(String.valueOf(id)).equals( String.valueOf(rscVal.getIntItem(x, "preference_value_id")) )) {
                                answer = rscVal.getStringItem(x, "value");
                            }

                        }
                        vals.put(text, answer);
                    }
                    
                }
                
                if(vals.keySet().size() != 0) {
                    groups.put(name, vals);
                }
            }
            
        getRequest().setAttribute("prefs", groups);
        
        } catch(TCWebException tce) {
            throw tce;
        } catch(Exception e) {
            throw new TCWebException(e);
        }
    }

    protected void setNextPage() {
        
        setNextPage(Constants.CONTRACTING_CONFIRM_PAGE); 
        setIsNextPageInContext(true);
    }
    
}
