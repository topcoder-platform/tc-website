/**
 * this class is just a data structure for passing text, affidavit, current
 * profile, and canAffirmOnline data to the jsp in a single class
 *
 * @author Sam King
 */

package com.topcoder.web.tc.controller.legacy.pacts.common;

public class AffidavitWithText {
    public Affidavit affidavit;
    public String affidavitText;
    public Payment payment;
    public boolean canAffirmOnline;
    public long daysLeft;  // the number of days left that it can be affirmed online

    public AffidavitWithText() {
        affidavit = new Affidavit();
        affidavitText = new String("");
        payment = new Payment();
        canAffirmOnline = false;  //err on the safe side
        daysLeft = 0;
    }
}
