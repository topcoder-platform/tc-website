// comments, who needs em
package com.topcoder.web.tc.controller.legacy.pacts.common;

public class TaxFormWithText {
    private TaxForm taxForm;
    private String text;

    public TaxFormWithText() {
        taxForm = new TaxForm();
        text = new String("");
    }

    public TaxForm getTaxForm() {
        return taxForm;
    }

    public void setTaxForm(TaxForm taxForm) {
        this.taxForm = taxForm;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }


}
