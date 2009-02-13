package com.topcoder.web.tc.view.reg.tag;

import com.topcoder.common.web.data.Referral;
import com.topcoder.common.web.util.Cache;
import com.topcoder.ejb.DataCache.DataCache;
import com.topcoder.shared.util.TCContext;

import javax.naming.InitialContext;
import javax.servlet.jsp.JspException;
import java.util.ArrayList;

public class ReferralSelect
        extends Select {

    private boolean optional = false;

    public void setOptional(String optional) {
        this.optional = optional != null && (optional.equalsIgnoreCase("yes") || optional.equalsIgnoreCase("true"));
    }

    String getOptionValue(Object o) {
        return "" + ((Referral) o).getReferralId();
    }

    String getOptionText(Object o) {
        return ((Referral) o).getReferralDesc();
    }

    ArrayList getSelectOptions()
            throws JspException {
        ArrayList referrals = new ArrayList();
        InitialContext context = null;
        try {
            context = TCContext.getInitial();
            DataCache dataCache = Cache.get(context);
            referrals.addAll(dataCache.getReferrals());
            if (optional) {
                Referral referral = new Referral();
                referral.setReferralId(0);
                referral.setReferralDesc("Decline to Answer");
                referral.setSort(0);
                referral.setStatusId(Referral.INACTIVE);
                referrals.add(referral);
            }
        } catch (Exception e) {
            throw new JspException(e.toString());
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (Exception e) {
                }
            }
        }
        return referrals;
    }
}
