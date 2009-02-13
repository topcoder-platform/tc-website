/*
 * Industries.java
 *
 * Created on October 6, 2004, 11:42 AM
 */

package com.topcoder.web.tc.controller.request.contracting;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.Skill;

import java.util.ArrayList;

/**
 *
 * @author  rfairfax
 */
public class Industries extends ContractingBase {


    protected void contractingProcessing() throws TCWebException {
        try {
            ArrayList skills = new ArrayList();

            //load skill list from db
            Request r = new Request();
            r.setContentHandle("skill_list");
            r.setProperty("stid", String.valueOf(Constants.SKILL_TYPE_INDUSTRIES));

            ResultSetContainer rsc = (ResultSetContainer) getDataAccess().getData(r).get("skill_list");
            for (int i = 0; i < rsc.size(); i++) {
                Skill s = new Skill();

                s.setText(rsc.getStringItem(i, "skill_desc"));
                s.setID(rsc.getIntItem(i, "skill_id"));

                skills.add(s);
            }

            getRequest().setAttribute("skills", skills);
        } catch (TCWebException tce) {
            throw tce;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected void setNextPage() {
        setNextPage(Constants.CONTRACTING_INDUSTRIES_PAGE);
        setIsNextPageInContext(true);
    }

}