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

import java.util.Iterator;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Country;
import com.topcoder.web.common.model.Preference;
import com.topcoder.web.common.model.UserPreference;
import com.topcoder.web.tc.Constants;

/**
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
            boolean hasHS = false;
            boolean registeredHS = false;
            boolean hasDes = false;
            boolean hasDev = false;
            boolean hasLong = false;


            int algRating = 0;
            int hsRating = 0;
            int mmRating = 0;
            int desRating = 0;
            int devRating = 0;

            String tab = StringUtils.checkNull(getRequest().getParameter("tab"));

            if (rsc.size() != 0) {

                if ((rsc.getItem(0, "rating").getResultData() != null) && (rsc.getIntItem(0, "rating") != 0)) {
                    hasAlg = true;
                    algRating = rsc.getIntItem(0, "rating");
                }

                if ((rsc.getItem(0, "hs_rating").getResultData() != null) && (rsc.getIntItem(0, "hs_rating") != 0)) {
                    hasHS = true;
                    hsRating = rsc.getIntItem(0, "hs_rating");
                }

                if ((rsc.getItem(0, "mm_rating").getResultData() != null) && (rsc.getIntItem(0, "mm_rating") != 0)) {
                    //hasLong = true;
                    mmRating = rsc.getIntItem(0, "mm_rating");
                }

                if (rsc.getItem(0, "design_rating").getResultData() != null) {
                    hasDes = true;
                    desRating = rsc.getIntItem(0, "design_rating");
                }

                if (rsc.getItem(0, "development_rating").getResultData() != null) {
                    hasDev = true;
                    devRating = rsc.getIntItem(0, "development_rating");
                }

                if (log.isDebugEnabled()) {
                    log.debug("has long comp is " + rsc.getStringItem(0, "has_long_comp"));
                }
                hasLong = rsc.getStringItem(0, "has_long_comp").equals("1");

                registeredHS = rsc.getIntItem(0, "hs_registered") == 1;

                //get the selected tab
                if (tab.equals("")) {
                    if (!hasAlg && !hasHS && !hasDes && !hasDev && !hasLong) {
                        tab = "";
                    } else if (!hasAlg && !hasHS && !hasDes && !hasDev && hasLong) {
                        tab = "long";
                    } else if (hasAlg && algRating >= hsRating && algRating >= desRating && algRating >= devRating && algRating >= mmRating) {
                        tab = "alg";
                    } else if (hasHS && hsRating >= algRating && hsRating >= desRating && hsRating >= devRating && hsRating >= mmRating) {
                        tab = "hs";
                    } else if (hasLong && mmRating >= algRating && mmRating >= desRating && mmRating >= devRating && mmRating >= hsRating) {
                        tab = "long";
                    } else if (hasDes && desRating >= algRating && desRating >= hsRating && desRating >= devRating && desRating >= mmRating) {
                        tab = "des";
                    } else if (hasDev) {
                        tab = "dev";
                    }
                }

                if (tab.equals("alg")) {
                    //load algo data from Coder_Alg_Data
                    r = new Request();
                    r.setContentHandle("Coder_Alg_Data");
                    r.setProperty("cr", coderId);
                    r.setProperty("ratid", "1");

                    dai = getDataAccess(true);
                    Map algoData = dai.getData(r);
                    Iterator it = algoData.keySet().iterator();
                    while (it.hasNext()) {
                        String key = (String) it.next();
                        result.put(key, algoData.get(key));
                    }
                } else if (tab.equals("hs")) {
                    //load algo data from Coder_HS_Data
                    r = new Request();
                    r.setContentHandle("Coder_hs_Data");
                    r.setProperty("cr", coderId);
                    r.setProperty("ratid", "2");

                    dai = getDataAccess(true);
                    Map algoData = dai.getData(r);
                    Iterator it = algoData.keySet().iterator();
                    while (it.hasNext()) {
                        String key = (String) it.next();
                        result.put(key, algoData.get(key));
                    }
                } else if (tab.equals("des")) {
                    //load des data from Coder_Des_Data
                    r = new Request();
                    r.setContentHandle("Coder_Des_Data");
                    r.setProperty("cr", coderId);
                    r.setProperty(Constants.PHASE_ID, "112"); //design phase id

                    dai = getDataAccess(true);
                    Map algoData = dai.getData(r);
                    Iterator it = algoData.keySet().iterator();
                    while (it.hasNext()) {
                        String key = (String) it.next();
                        result.put(key, algoData.get(key));
                    }
                } else if (tab.equals("dev")) {
                    //load des data from Coder_Des_Data
                    r = new Request();
                    r.setContentHandle("Coder_Dev_Data");
                    r.setProperty("cr", coderId);
                    r.setProperty(Constants.PHASE_ID, "113"); //design phase id

                    dai = getDataAccess(true);
                    Map algoData = dai.getData(r);
                    Iterator it = algoData.keySet().iterator();
                    while (it.hasNext()) {
                        String key = (String) it.next();
                        result.put(key, algoData.get(key));
                    }
                } else if (tab.equals("long")) {
                    r = new Request();
                    r.setContentHandle("Coder_Long_Data");
                    r.setProperty("cr", coderId);

                    dai = getDataAccess(true);
                    Map longData = dai.getData(r);
                    Iterator it = longData.keySet().iterator();
                    while (it.hasNext()) {
                        String key = (String) it.next();
                        result.put(key, longData.get(key));
                    }

                }
            }
            
            r = new Request();
            r.setContentHandle("member_contact_enabled");
            r.setProperty("cr", coderId);

            DataAccessInt dai2 = getDataAccess(DBMS.OLTP_DATASOURCE_NAME, false);
            Map result2 = dai2.getData(r);
            ResultSetContainer rsc2 = (ResultSetContainer) result2.get("member_contact_enabled");

            boolean memberContactEnabled = false;
            if(rsc2.size() > 0) {
                memberContactEnabled = "yes".equals(rsc2.getStringItem(0, "value"));
            }

            // check whether or not show earnings
            if (!DAOUtil.useQueryToolFactory) {
                HibernateUtils.getSession().beginTransaction();
            }
            
            UserPreference up = DAOUtil.getQueryToolFactory().getUserPreferenceDAO().find(Long.parseLong(coderId), Preference.SHOW_EARNINGS_PREFERENCE_ID);
            boolean hidePayments = up != null && "hide".equals(up.getValue());
            
            getRequest().setAttribute("resultMap", result);

            getRequest().setAttribute("hasAlg", new Boolean(hasAlg));
            getRequest().setAttribute("hasHS", new Boolean(hasHS));
            getRequest().setAttribute("registeredHS", new Boolean(registeredHS));
            getRequest().setAttribute("hasDes", new Boolean(hasDes));
            getRequest().setAttribute("hasDev", new Boolean(hasDev));
            getRequest().setAttribute("hasLong", new Boolean(hasLong));
            getRequest().setAttribute("memberContactEnabled", new Boolean(memberContactEnabled));
            getRequest().setAttribute("hidePayments", new Boolean(hidePayments));
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
