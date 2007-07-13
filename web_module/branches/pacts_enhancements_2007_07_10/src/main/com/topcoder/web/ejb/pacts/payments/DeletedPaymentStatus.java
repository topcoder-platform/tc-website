/*
* DeletedPaymentStatus
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import java.util.HashMap;
import java.util.Map;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.ejb.pacts.AlgorithmRoundReferencePayment;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Affidavit;
import com.topcoder.web.tc.controller.legacy.pacts.common.AffidavitHeaderList;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * This class represents a Deleted status for payments. 
 *
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class DeletedPaymentStatus extends BasePaymentStatus {

    /**
     * The payment status id
     */
    public static final Long ID = 69l;

    /**
     * Default constructor   
     */
    public DeletedPaymentStatus() {
        super();
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#getId()
     */
    @Override
    public Long getId() {
        return ID;
    }

    /**
     * This method will handle the state activation for each particular status
     * 
     * @param payment the payment to apply the event to
     * @throws StateTransitionFailureException if anything fails
     */
    public void activate(BasePayment payment) throws StateTransitionFailureException {
        try {
            // If the payment is deleted, we need to cancel attached documents. (affidavit)
            if (payment.getPaymentType() == BasePayment.ALGORITHM_CONTEST_PAYMENT ||
                    payment.getPaymentType() == BasePayment.ALGORITHM_TOURNAMENT_PRIZE_PAYMENT ||
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
        } catch (Exception e) {
            throw new StateTransitionFailureException(e);
        }            
    }


    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#inactiveCoder(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public int inactiveCoder(BasePayment payment) throws InvalidPaymentEventException {
        // do nothing
        return 0;
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#newInstance()
     */
    @Override
    public BasePaymentStatus newInstance() {
        BasePaymentStatus newPaymentStatus = new DeletedPaymentStatus();
        newPaymentStatus.setDesc(this.desc);
        newPaymentStatus.setActive(this.active);
        return newPaymentStatus;  
    }

}
