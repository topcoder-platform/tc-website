/*
* BasePaymentStatus
*
* Created Apr 17, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import java.rmi.RemoteException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.topcoder.web.ejb.pacts.AlgorithmRoundReferencePayment;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Affidavit;
import com.topcoder.web.tc.controller.legacy.pacts.common.AffidavitHeaderList;
import com.topcoder.web.tc.controller.legacy.pacts.common.InvalidSearchInputException;
import com.topcoder.web.tc.controller.legacy.pacts.common.NoObjectFoundException;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.UnsupportedSearchException;

/**
 * @author Pablo Wolfus (Pulky)
 * @version $Id: BasePaymentStatus.java 69932 2008-04-22 13:52:13Z gpaul $
 */
public abstract class BasePaymentStatus implements java.io.Serializable {
    /**
     * This attribute contains the reasons for this status 
     */
    protected List<PaymentStatusReason> reasons = new ArrayList<PaymentStatusReason>();
    
    /**
     * The payment status description
     */
    protected String desc = "Unk.";
    
    /**
     * The payment status active flag
     */
    protected boolean active = false;
    
    /**
     * Default Constructor 
     */
    public BasePaymentStatus() {
        super();
    }
    
    /**
     * Creates a new instance of the payment status
     * 
     * @return a new instance of the payment status
     */
    public abstract BasePaymentStatus newInstance();

    /**
     * Setter for the payment's status description
     * 
     * @param desc the description
     */
    public void setDesc(String desc){
        this.desc = desc;
    }
    
    /**
     * Getter for the payment's status description
     * 
     * @return the description
     */
    public String getDesc() {
        return desc;
    }
    
    /**
     * Getter for the payment's status id
     * 
     * @return the id
     */
    public abstract Long getId();
    
    /**
     * Getter for the payment's active flag
     * 
     * @return true if active
     */
    public boolean isActive() {
        return active;
    }
    
    /**
     * Setter for the payment's active flag
     * 
     * @param active true if active
     */
    public void setActive(boolean active) {
        this.active = active;
    }

    /**
     * This method will handle the state transition for each particular status
     * 
     * @param payment the payment to apply the event to
     * @throws StateTransitionFailureException if anything fails
     */
    public void nextState(BasePayment payment) throws StateTransitionFailureException {
        // default implementation does nothing
    }

    /**
     * This method will handle the state activation for each particular status
     * 
     * @param payment the payment to apply the event to
     * @throws StateTransitionFailureException if anything fails
     */
    public void activate(BasePayment payment) throws StateTransitionFailureException {
        // default implementation does nothing
    }

    /**
     * This method will handle payment updates
     * 
     * @param oldPayment the old instance of the payment
     * @param newPayment the new instance of the payment
     * @throws StateTransitionFailureException if anything fails
     */
    public void paymentUpdated(BasePayment oldPayment, BasePayment newPayment) throws StateTransitionFailureException {
        // default implementation does nothing
    }

    /**
     * This method will handle affirmed affidavit event
     * 
     * @param payment the payment to apply the event to
     * @throws StateTransitionFailureException if anything fails
     * @throws InvalidPaymentEventException if the event cannot take place in this condition
     */
    public void affirmedAffidavit(BasePayment payment) throws StateTransitionFailureException, InvalidPaymentEventException {
        throw new InvalidPaymentEventException("Cannot affirm an affidavit to a payment with status " + payment.getCurrentStatus().getDesc());
    }

    /**
     * This method will handle expired affidavit event
     * 
     * @param payment the payment to apply the event to
     * @throws InvalidPaymentEventException if the event cannot take place in this condition
     */
    public void expiredAffidavit(BasePayment payment) throws InvalidPaymentEventException {
        throw new InvalidPaymentEventException("Cannot expire an affidavit to a payment with status " + payment.getCurrentStatus().getDesc());
    }

    /**
     * This method will handle coder inactivation event
     * 
     * @param payment the payment to apply the event to
     * @return the number of cancelled payments
     * 
     * @throws StateTransitionFailureException if anything fails
     * @throws InvalidPaymentEventException if the event cannot take place in this condition
     */
    public int inactiveCoder(BasePayment payment) throws StateTransitionFailureException, InvalidPaymentEventException {
        throw new InvalidPaymentEventException();
    }

    /**
     * This method will handle expired IP Transfer event
     * 
     * @param payment the payment to apply the event to
     * @throws InvalidPaymentEventException if the event cannot take place in this condition
     */
    public void expiredIPTransfer(BasePayment payment) throws InvalidPaymentEventException {
        throw new InvalidPaymentEventException("Cannot expire an IP Transfer to a payment with status " + payment.getCurrentStatus().getDesc());
    }

    /**
     * This method will handle expired payments event
     * 
     * @param payment the payment to apply the event to
     * @throws StateTransitionFailureException if anything fails
     * @throws InvalidPaymentEventException if the event cannot take place in this condition
     */
    public void expiredPayment(BasePayment payment) throws StateTransitionFailureException, InvalidPaymentEventException {
        throw new InvalidPaymentEventException();
    }

    /**
     * This method will handle parent cancellation event
     * 
     * @param payment the payment to apply the event to
     * @throws InvalidPaymentEventException if the event cannot take place in this condition
     */
    public void parentCancelled(BasePayment payment) throws InvalidPaymentEventException {
        throw new InvalidPaymentEventException("The parent of this payment was cancelled but the payment has status " + payment.getCurrentStatus().getDesc());
    }

    /**
     * This method will handle affirmed IP Transfer event
     * 
     * @param payment the payment to apply the event to
     * @throws StateTransitionFailureException if anything fails
     * @throws InvalidPaymentEventException if the event cannot take place in this condition
     */
    public void affirmedIPTransfer(BasePayment payment) throws StateTransitionFailureException, InvalidPaymentEventException {
        throw new InvalidPaymentEventException("Cannot affirm an IP Transfer to a payment with status " + payment.getCurrentStatus().getDesc());
    }

    /**
     * This method will handle enter into payment user event
     * 
     * @param payment the payment to apply the event to
     * @throws StateTransitionFailureException if anything fails
     * @throws InvalidPaymentEventException if the event cannot take place in this condition
     */
    public void enterIntoPaymentSystem(BasePayment payment) throws InvalidPaymentEventException, StateTransitionFailureException {
        throw new InvalidPaymentEventException("Cannot enter into payment system a payment with status " + payment.getCurrentStatus().getDesc());
    }

    /**
     * This method will handle pay user event
     * 
     * @param payment the payment to apply the event to
     * @throws StateTransitionFailureException if anything fails
     * @throws InvalidPaymentEventException if the event cannot take place in this condition
     */
    public void pay(BasePayment payment) throws InvalidPaymentEventException, StateTransitionFailureException {
        throw new InvalidPaymentEventException("Cannot pay a payment with status " + payment.getCurrentStatus().getDesc());
    }

    /**
     * This method will handle delete user event
     * 
     * @param payment the payment to apply the event to
     * @throws StateTransitionFailureException if anything fails
     * @throws InvalidPaymentEventException if the event cannot take place in this condition
     */
    public void delete(BasePayment payment)throws StateTransitionFailureException, InvalidPaymentEventException {
        throw new InvalidPaymentEventException("Cannot delete a payment with status " + payment.getCurrentStatus().getDesc());
    }
    
    /**
     * This method will handle new hard copy IP Transfer event
     * 
     * @param payment the payment to apply the event to
     * @throws StateTransitionFailureException if anything fails
     * @throws InvalidPaymentEventException if the event cannot take place in this condition
     */
    public void hardCopyIPTransfer(BasePayment payment) throws StateTransitionFailureException, InvalidPaymentEventException {
        // default implementation does nothing
    }

    /**
     * This method will handle new global IP Transfer event
     * 
     * @param payment the payment to apply the event to
     * @throws StateTransitionFailureException if anything fails
     * @throws InvalidPaymentEventException if the event cannot take place in this condition
     */
    public void signedGlobalAD(BasePayment payment) throws StateTransitionFailureException, InvalidPaymentEventException {
        // default implementation does nothing
    }

    /**
     * This method will handle new tax form event
     * 
     * @param payment the payment to apply the event to
     * @throws StateTransitionFailureException if anything fails
     */
    public void newTaxForm(BasePayment payment) throws StateTransitionFailureException {
        // default implementation does nothing
    }

    /**
     * This method will handle accrual threshold reach event
     * 
     * @param payment the payment to apply the event to
     * @throws StateTransitionFailureException if anything fails
     */
    public void accrualThresholdReached(BasePayment payment) throws StateTransitionFailureException {
        // default implementation does nothing
    }

    /**
     * Getter for the reasons collection
     * 
     * @return a List of PaymentStatusReason
     */
    public List<PaymentStatusReason> getReasons() {
        return reasons;
    }

    /**
     * This method returns the concatenation of the reasons descriptions
     * 
     * @return the concatenation of the reasons descriptions
     */
    public String getReasonsText() {
        if (reasons.size() == 0) {
            return "";
        }
        String reasonsText = "(";
        boolean first = true;
        for (PaymentStatusReason reason : reasons) {
            if (first) {
                first = false;
            } else {
                reasonsText += ",";
            }
            reasonsText += reason.getDesc();            
        }
        reasonsText += ")";
        return reasonsText;
    }

    /**
     * Helper method to cancel all documents attached to a particular payment
     * 
     * @param payment the payment referenced 
     */
    protected void cancelAttachedDocuments(BasePayment payment) throws Exception {
        if (payment.getPaymentType() == BasePayment.ALGORITHM_CONTEST_PAYMENT ||
                payment.getPaymentType() == BasePayment.ALGORITHM_TOURNAMENT_PRIZE_PAYMENT ||
                payment.getPaymentType() == BasePayment.HIGH_SCHOOL_TOURNAMENT_PRIZE_PAYMENT ||
                payment.getPaymentType() == BasePayment.MARATHON_MATCH_PAYMENT) {
                
                DataInterfaceBean dib = new DataInterfaceBean();
            
                Map criteria = new HashMap();
                criteria.put(PactsConstants.USER_ID, String.valueOf(payment.getCoderId()));
                criteria.put(PactsConstants.ROUND_ID, String.valueOf(((AlgorithmRoundReferencePayment)payment).getRoundId()));
            
                Map results = dib.findAffidavits(criteria);
                AffidavitHeaderList ahl = new AffidavitHeaderList(results);
                
                if (ahl != null && ahl.getHeaderList() != null &&
                        ahl.getHeaderList().length > 0 && 
                        ahl.getHeaderList()[0].getStatusId() != PactsConstants.AFFIDAVIT_CANCELED_STATUS &&
                        ahl.getHeaderList()[0].getStatusId() != PactsConstants.AFFIDAVIT_DELETED_STATUS) {
                    // cancel affidavit
                    Affidavit affidavit = new Affidavit(dib.getAffidavit(ahl.getHeaderList()[0].getId()));
                    affidavit.getHeader().setStatusId(PactsConstants.AFFIDAVIT_CANCELED_STATUS);
                    dib.updateAffidavit(affidavit);
                }
        }
    }

    /**
     * Method to clone the PaymentStatus
     * 
     * @see java.lang.Object#clone()
     */
    public BasePaymentStatus clone() {
        BasePaymentStatus newPaymentStatus = newInstance();
        
        for (PaymentStatusReason reason : reasons) {
            newPaymentStatus.reasons.add(reason);
        }
        
        return newPaymentStatus;  
    }

    /**
     * hashCode() implementation
     * 
     * @see java.lang.Object#hashCode()
     */
    @Override
    public final int hashCode() {
        return getId() == null ? 0 : getId().hashCode();
    }

    /**
     * equals() implementation
     * 
     * @see java.lang.Object#equals(java.lang.Object)
     */
    @Override
    public final boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (!(obj instanceof BasePaymentStatus))
            return false;
        final BasePaymentStatus other = (BasePaymentStatus) obj;
        if (getId() == null) {
            if (other.getId() != null)
                return false;
        } else if (!getId().equals(other.getId()))
            return false;
        return true;
    }
}
