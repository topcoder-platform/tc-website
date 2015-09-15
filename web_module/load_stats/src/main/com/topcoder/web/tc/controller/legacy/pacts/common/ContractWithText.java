package com.topcoder.web.tc.controller.legacy.pacts.common;

public class ContractWithText {
    private Contract contract;
    private String text;

    public ContractWithText() {
        contract = new Contract();
        text = new String("");
    }

    public Contract getContract() {
        return contract;
    }

    public void setContract(Contract contract) {
        this.contract = contract;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }


}
