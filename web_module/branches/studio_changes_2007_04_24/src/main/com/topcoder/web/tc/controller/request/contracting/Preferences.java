/*
 * Preferences.java
 *
 * Created on October 1, 2004, 1:49 PM
 */

package com.topcoder.web.tc.controller.request.contracting;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.model.CoderSessionInfo;
import com.topcoder.web.tc.model.Preference;
import com.topcoder.web.tc.model.PreferenceGroup;
import com.topcoder.web.tc.model.PreferenceValue;

import java.util.ArrayList;

/**
 *
 * @author  rfairfax
 */
public class Preferences extends ContractingBase {
    protected void contractingProcessing() throws TCWebException {
        try {
            //load preference groups
            ArrayList groups = new ArrayList();

            Request r = new Request();
            r.setContentHandle("preference_groups");

            ResultSetContainer rsc = (ResultSetContainer) getDataAccess().getData(r).get("preference_groups");
            for (int i = 0; i < rsc.size(); i++) {
                PreferenceGroup grp = new PreferenceGroup();

                grp.setName(rsc.getStringItem(i, "preference_group_desc"));

                //load preferences here
                Request rpref = new Request();
                rpref.setContentHandle("preferences_by_group");
                rpref.setProperty("prid", String.valueOf(rsc.getIntItem(i, "preference_group_id")));

                ResultSetContainer rscPref = (ResultSetContainer) getDataAccess().getData(rpref).get("preferences_by_group");
                for (int j = 0; j < rscPref.size(); j++) {
                    Preference pref = new Preference();

                    pref.setText(rscPref.getStringItem(j, "preference_desc"));
                    pref.setType(rscPref.getIntItem(j, "preference_type_id"));
                    pref.setID(rscPref.getIntItem(j, "preference_id"));

                    //load answers
                    Request rval = new Request();
                    rval.setContentHandle("preference_values");
                    rval.setProperty("prid", String.valueOf(rscPref.getIntItem(j, "preference_id")));

                    ResultSetContainer rscVal = (ResultSetContainer) getDataAccess().getData(rval).get("preference_values");

                    for (int x = 0; x < rscVal.size(); x++) {
                        PreferenceValue pv = new PreferenceValue();

                        pv.setID(rscVal.getIntItem(x, "preference_value_id"));

                        pv.setText(rscVal.getStringItem(x, "value"));

                        pref.addPrefValue(pv);
                    }

                    grp.addPreference(pref);
                }


                groups.add(grp);
            }

            //set attribute with groups
            getRequest().setAttribute("groups", groups);

            //check for existing resume
            ResumeServices resumeServices = (ResumeServices) createEJB(getInitialContext(), ResumeServices.class);
            if (resumeServices.hasResume(getUser().getId(), DBMS.OLTP_DATASOURCE_NAME)) {
                getRequest().setAttribute("hasResume", "true");
            }

            CoderSessionInfo info = (CoderSessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
            boolean isRated = info.getRating() > 0 || info.getDevRating() > 0 || info.getDesignRating() > 0;

            getRequest().setAttribute("isRated", String.valueOf(isRated));
            if (!isRated) {
                CachedDataAccess nextRoundDai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
                nextRoundDai.setExpireTime(30 * 60 * 1000);
                Request nextRoundReq = new Request();
                nextRoundReq.setContentHandle("next_srm");
                getRequest().setAttribute("Next_SRM", nextRoundDai.getData(nextRoundReq).get("Next_SRM"));
            }

            if (Constants.JOB_HIT_MESSAGE_NOT_REGISTERED.equals(getRequest().getParameter(Constants.MESSAGE))) {
                getRequest().setAttribute(Constants.MESSAGE, "Thank you for expressing interest in this job " +
                        "opportunity.  In order to be considered and contacted for the position please " +
                        "take a moment and provide us with your salary and travel requirements and rate your " +
                        "experience with a variety of programming languages, database platforms and relevant " +
                        "Industry experience.");
            } else if (Constants.JOB_HIT_MESSAGE_UN_REGISTERED.equals(getRequest().getParameter(Constants.MESSAGE))) {
                getRequest().setAttribute(Constants.MESSAGE, "Thank you for expressing interest in this job " +
                        "opportunity.  In your profile you did not indicate interest in either permanent or " +
                        "contract positions.  In order to be considered and contacted for potential employment " +
                        "opportunities please select one of the options.");
            }

        } catch (TCWebException tce) {
            throw tce;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected void setNextPage() {
        setNextPage(Constants.CONTRACTING_PREFERENCES_PAGE);
        setIsNextPageInContext(true);
    }


}
