/**
 * this class is just a data structure for passing text, affidavit, current
 * profile, and canAffirmOnline data to the jsp in a single class
 *
 * @author Sam King
 */

package com.topcoder.web.tc.controller.legacy.pacts.common;

public class AffidavitWithText {
    private Affidavit affidavit;
    private String affidavitText;
    private Payment payment;
    private boolean hasTaxForm = false;
    private boolean hasNotarizedAffidavit = false;
    private boolean hasAllDemographicAnswers = false;
    //public long daysLeft;  // the number of days left that it can be affirmed online

    public AffidavitWithText() {
        affidavit = new Affidavit();
        affidavitText = new String("");
        payment = new Payment();
        //daysLeft = 0;
    }

    public boolean canAffirmOnline() {
        return hasTaxForm && hasNotarizedAffidavit && hasAllDemographicAnswers && affidavit.getDaysLeftToAffirm()> 0;
    }

    public boolean hasTaxForm() {
        return hasTaxForm;
    }

    public void setHasTaxForm(boolean hasTaxForm) {
        this.hasTaxForm = hasTaxForm;
    }

    public boolean hasNotarizedAffidavit() {
        return hasNotarizedAffidavit;
    }

    public void setHasNotarizedAffidavit(boolean hasNotarizedAffidavit) {
        this.hasNotarizedAffidavit = hasNotarizedAffidavit;
    }

    public boolean hasAllDemographicAnswers() {
        return hasAllDemographicAnswers;
    }

    public void setHasAllDemographicAnswers(boolean hasAllDemographicAnswers) {
        this.hasAllDemographicAnswers = hasAllDemographicAnswers;
    }


    public Affidavit getAffidavit() {
        return affidavit;
    }

    public void setAffidavit(Affidavit affidavit) {
        this.affidavit = affidavit;
    }

    public String getAffidavitText() {
        return affidavitText;
    }

    public void setAffidavitText(String affidavitText) {
        this.affidavitText = affidavitText;
    }

    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }

}
