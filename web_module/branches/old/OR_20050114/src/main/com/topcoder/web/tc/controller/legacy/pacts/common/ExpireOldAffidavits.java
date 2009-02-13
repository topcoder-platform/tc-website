package com.topcoder.web.tc.controller.legacy.pacts.common;

import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;

/**
 * Sets the status on all affidavits older than a specified time
 * to Expired, and set the status on their associated payment (if any)
 * to Canceled.  The time limit is specified in <tt>PactsConstants.java</tt>
 * and is currently set to 60 days.  Any payments that were already paid
 * that would here have been canceled are logged. <p>
 *
 * Usage: java ExpireOldAffidavits
 *
 * @author Dave Pecora
 * @version 1.00, 04/09/2002
 * @see DataInterfaceBean
 */

public class ExpireOldAffidavits {
    private void expireAffidavits() {
        try {
            DataInterfaceBean d = new DataInterfaceBean();
            int affidavitsExpired = d.expireOldAffidavits();
            System.out.println("ExpireOldAffidavits: " + affidavitsExpired + " affidavits expired.");
        } catch (Exception e) {
            System.out.println("ExpireOldAffidavits: Program execution unsuccessful.  Cause:");
            System.out.println(e.getMessage());
        }
    }

    public static void main(String args[]) {
        if (args.length != 0) {
            System.out.println("Usage: ExpireOldAffidavits");
            return;
        }

        ExpireOldAffidavits e = new ExpireOldAffidavits();
        e.expireAffidavits();
    }
}

