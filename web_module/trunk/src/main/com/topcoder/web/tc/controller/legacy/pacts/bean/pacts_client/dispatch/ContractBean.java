/**
 * this class is used to get the contract information for a user. There is
 * no error checking in this class, all of that is done in the servlet.
 * It queries the db and forms the data structures.
 *
 * @author Sam King
 */

package com.topcoder.web.tc.controller.legacy.pacts.bean.pacts_client.dispatch;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.*;

import java.util.Map;

public class ContractBean implements PactsConstants {
    private static Logger log = Logger.getLogger(ContractBean.class);

    /**
     * contrcutor. does nothing, the class is stateless.
     */
    public ContractBean() {
        //do nothing
    }

    /**
     * used to ge the contract for a given contract and user.
     *
     * @param contractId the id of the contract
     * @return the contract header for the given contract
     *         if the contract id is not valid, the method
     *         returns null
     */
    public Contract getContract(long contractId) {
        log.debug("check if we need to associate this with a member id");
        log.debug("getContract, contractId = " + contractId);
        DataInterfaceBean bean = new DataInterfaceBean();
        java.util.Map reply = null;
        try {
            reply = bean.getContract(contractId);
        } catch (Exception e1) {
            log.error("did not get contract in getContract");
            e1.printStackTrace();
            return null;
        }

        Contract c = new Contract(reply);
        return c;
    }

    /**
     * used to get only active contracts
     */
    public ContractHeader[] getActiveContractsForUser(long memberId) {
        ContractHeader[] full;
        ContractHeader[] active;

        full = getContractsForUser(memberId);
        if ((full == null) || (full.length <= 0)) {
            log.debug("did not get any contracts");
            return full;
        }

        int numAct = 0;
        int idx;
        for (idx = 0; idx < full.length; idx++) {
            if (full[idx].getStatusId() == CONTRACT_ACTIVE_STATUS) {
                numAct++;
            }
        }

        active = new ContractHeader[numAct];
        int aIdx = 0;
        for (idx = 0; idx < full.length; idx++) {
            if (full[idx].getStatusId() == CONTRACT_ACTIVE_STATUS) {
                active[aIdx++] = full[idx];
            }
        }

        return active;
    }

    /**
     * used to find all contract that the specific user worked on
     *
     * @param memberId the member id
     * @return an array of ContractHeaders for all of the contracts this
     *         member worked on, or null if the member id is invalid, or
     *         the member has not worked on any contracts
     */
    public ContractHeader[] getContractsForUser(long memberId) {
        log.debug("getContractsForUser, memberId = " + memberId);
        DataInterfaceBean bean = new DataInterfaceBean();
        java.util.Map reply = null;
        try {
            reply = bean.getUserContractList(memberId);
        } catch (Exception e1) {
            log.error("did not get contract list in getContractForUser");
            e1.printStackTrace();
            return null;
        }

        ContractHeaderList clist = new ContractHeaderList(reply);

        return clist.getHeaderList();
    }

    public PaymentHeader[] getContractPaymentList(long contractId) {
        log.debug("getContractPayments, contractId = " + contractId);
        DataInterfaceBean bean = new DataInterfaceBean();
        java.util.Map reply = null;
        try {
            reply = bean.getContractPaymentList(contractId);
        } catch (Exception e1) {
            log.error("did not get payment list in getContractPaymentsForUser");
            e1.printStackTrace();
            return null;
        }

        PaymentHeaderList plist = new PaymentHeaderList(reply);

        return plist.getHeaderList();
    }

    /**
     * this will retrieve the contract object and the actual contact text,
     * and place them in a contract with text object
     *
     * @param contractId the id of the contract
     * @return the contract with text for the contractId
     */
    public ContractWithText getContractWithText(long contractId) {
        log.debug("getContractWithText, contractId = " + contractId);
        ContractWithText c = new ContractWithText();

        c.setContract(getContract(contractId));
        c.setText(getContractText(contractId));

        return c;
    }

    /**
     * queries the db for the actual contract text for a given contract id
     */
    public String getContractText(long contractId) {
        log.debug("getContractText, contractId = " + contractId);
        DataInterfaceBean bean = new DataInterfaceBean();
        String text = new String("");

        try {
            Map results = bean.getText(contractId, CONTRACT_OBJ);
            ResultText t = new ResultText(results);
            text = t.getText();
        } catch (Exception e) {
            log.error("we got excepted trying to get the contract text" +
                    "for contract " + contractId);
            e.printStackTrace();
        }

        return text;
    }

}
