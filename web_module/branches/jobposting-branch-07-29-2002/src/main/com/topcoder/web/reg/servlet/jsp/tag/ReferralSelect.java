package com.topcoder.web.reg.servlet.jsp.tag;

import java.util.*;
import javax.naming.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

import com.topcoder.shared.util.*;
import com.topcoder.common.web.data.*;
import com.topcoder.ejb.DataCache.*;

public class ReferralSelect
    extends Select  
{

    private boolean optional = false;

    public void setOptional(String optional)
    {
        this.optional = optional != null && (optional.equalsIgnoreCase("yes") || optional.equalsIgnoreCase("true"));
    }

    String getOptionValue(Object o)
    {
        return ""+((Referral)o).getReferralId();
    } 

    String getOptionText(Object o)
    {
        return ((Referral)o).getReferralDesc();
    }

    ArrayList getSelectOptions()
        throws JspException
    {
        ArrayList referrals = new ArrayList();
        Context context = null;
        try
        {
            context = TCContext.getInitial();
            DataCacheHome dataCacheHome = (DataCacheHome) context.lookup(ApplicationServer.DATA_CACHE);
            DataCache dataCache = dataCacheHome.create();
            referrals.addAll( dataCache.getReferrals() );
            if ( optional ) {
              Referral referral = new Referral();
              referral.setReferralId ( 0 );
              referral.setReferralDesc ( "Decline to Answer" );
              referral.setSort ( 0 );
              referral.setStatusId ( Referral.INACTIVE );
              referrals.add ( referral );
            }
        }
        catch (Exception e)
        {
            throw new JspException(e.toString());
        }
        finally
        {
            if (context != null)
            {
                try
                {
                    context.close();
                }
                catch (Exception e)
                {
                }
            }
        }
        return referrals;
    }
}
