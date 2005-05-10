/*
 * MemberProfile.java
 *
 * Created on May 3, 2005, 3:22 PM
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */

package com.topcoder.web.tc.controller.request.statistics;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import java.util.Iterator;
import java.util.Map;

/**
 *
 * @author rfairfax
 */
public class MemberProfile extends Base { 
    
    protected void businessProcessing() throws TCWebException {
        try {
            //step 1, get the base data used for the top section           
            if(!hasParameter("cr")) {
                throw new TCWebException("Invalid Coder ID");
            }
            
            String coderId = getRequest().getParameter("cr");
            
            Request r = new Request();
            r.setContentHandle("member_profile");
            r.setProperty("cr", coderId);

            DataAccessInt dai = getDataAccess(true);
            Map result = dai.getData(r);
            ResultSetContainer rsc = (ResultSetContainer) result.get("Coder_Data");
            
            //here we want to get the current tab, then load data for that tab
            boolean hasAlg = false;
            boolean hasDes = false;
            boolean hasDev = false;
            
            int algRating = 0;
            int desRating = 0;
            int devRating = 0;

            String tab = StringUtils.checkNull(getRequest().getParameter("tab"));
            
            if(rsc.size() != 0) {
            
                if(rsc.getIntItem(0, "rating") != 0) {
                    hasAlg = true;
                    algRating = rsc.getIntItem(0, "rating");
                }

                if(rsc.getItem(0, "design_rating").getResultData() != null) {
                    hasDes = true;
                    desRating = rsc.getIntItem(0, "design_rating");
                }

                if(rsc.getItem(0, "development_rating").getResultData() != null) {
                    hasDev = true;
                    devRating = rsc.getIntItem(0, "development_rating");
                }

                //get the selected tab
                if(tab.equals("")) {
                    //get the higest rating
                    if(algRating == 0 && desRating == 0 && devRating == 0) {
                        tab = "";
                    } else if(algRating >= desRating && algRating >= devRating) {
                        tab = "alg";
                    } else if(desRating >= algRating && desRating >= devRating) {
                        tab = "des";
                    } else {
                        tab = "dev";
                    }
                }

                if(tab.equals("alg")) {
                    //load algo data from Coder_Alg_Data
                    r = new Request();
                    r.setContentHandle("Coder_Alg_Data");
                    r.setProperty("cr", coderId);

                    dai = getDataAccess(true);
                    Map algoData = dai.getData(r);
                    Iterator it = algoData.keySet().iterator();
                    while(it.hasNext()) {
                        String key = (String) it.next();
                        result.put(key, algoData.get(key));
                    }
                } else if(tab.equals("des")) {
                    //load des data from Coder_Des_Data
                    r = new Request();
                    r.setContentHandle("Coder_Des_Data");
                    r.setProperty("cr", coderId);
                    r.setProperty("pi", "112"); //design phase id

                    dai = getDataAccess(true);
                    Map algoData = dai.getData(r);
                    Iterator it = algoData.keySet().iterator();
                    while(it.hasNext()) {
                        String key = (String) it.next();
                        result.put(key, algoData.get(key));
                    }
                } else if(tab.equals("dev")) {
                    //load des data from Coder_Des_Data
                    r = new Request();
                    r.setContentHandle("Coder_Dev_Data");
                    r.setProperty("cr", coderId);
                    r.setProperty("pi", "113"); //design phase id

                    dai = getDataAccess(true);
                    Map algoData = dai.getData(r);
                    Iterator it = algoData.keySet().iterator();
                    while(it.hasNext()) {
                        String key = (String) it.next();
                        result.put(key, algoData.get(key));
                    }
                }
            }
            getRequest().setAttribute("resultMap", result);
            
            getRequest().setAttribute("hasAlg", new Boolean(hasAlg));
            getRequest().setAttribute("hasDes", new Boolean(hasDes));
            getRequest().setAttribute("hasDev", new Boolean(hasDev));
            getRequest().setAttribute("tab", tab);
            
            setNextPage(Constants.MEMBER_PROFILE);
            setIsNextPageInContext(true);
        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
    
}
