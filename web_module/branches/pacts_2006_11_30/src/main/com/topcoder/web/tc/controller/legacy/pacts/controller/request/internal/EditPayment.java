package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.AlgorithmProblemReferencePayment;
import com.topcoder.web.ejb.pacts.AlgorithmRoundReferencePayment;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.ComponentContestReferencePayment;
import com.topcoder.web.ejb.pacts.ComponentProjectReferencePayment;
import com.topcoder.web.ejb.pacts.ComponentWinningPayment;
import com.topcoder.web.ejb.pacts.DigitalRunSeasonReferencePayment;
import com.topcoder.web.ejb.pacts.DigitalRunStageReferencePayment;
import com.topcoder.web.ejb.pacts.ParentReferencePayment;
import com.topcoder.web.ejb.pacts.StudioContestReferencePayment;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Contract;
import com.topcoder.web.tc.controller.legacy.pacts.common.Links;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.PaymentHeader;
import com.topcoder.web.tc.controller.legacy.pacts.common.UserProfileHeader;

/**
 * Add or update a payment.
 *
 * @author  cucu
 */
public class EditPayment extends PactsBaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {
    	SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_STRING);
        try {
            boolean updating = getRequest().getParameter("payment_id") != null;
            boolean adding = !updating;

            DataInterfaceBean dib = new DataInterfaceBean();
            long paymentId = -1;
            long userId = -1;
            long contractId = -1;
            BasePayment payment = null;
            UserProfileHeader user = null;
            Contract contract = null;

            if (getRequest().getParameter(CONTRACT_ID) != null) {
                contractId = getLongParameter(CONTRACT_ID);
                contract = new Contract(dib.getContract(contractId));
            }

			boolean charity = getRequest().getParameter("charity_ind") != null;

            if (adding) {
                if (contract != null) {
                    user = contract.getHeader().getUser();
                    userId = user.getId();
                } else {
                    userId = getLongParameter(USER_ID);
                    user = new UserProfileHeader(dib.getUserProfileHeader(userId));
                }
            }

            if (updating) {

                paymentId = getLongParameter(PAYMENT_ID);
            	payment = dib.getBasePayment(paymentId);

                if (payment.getStatusId() == PAID_STATUS) {
                    throw new NavigationException("You can't update a paid payment");
                }

                //user = payment.getHeader().getUser();
                userId = payment.getCoderId();
                user = new UserProfileHeader(dib.getUserProfileHeader(userId));
            }

            String desc = "";
            int statusId = -1;
            int typeId = -1;
            double totalAmount = 0.0;
            double grossAmount = 0.0;
            double netAmount = 0.0;
            int methodId = -1;
            int modificationRationaleId = -1;
            int installmentNumber = 1;
            String dueDate = "";
            String client = "";

            if (getRequest().getParameter("payment_desc") != null) {
                // The user is trying to save the payment, so check that the parameters are ok

                desc = checkNotEmptyString("payment_desc", "Please enter a description for the payment.");
                statusId = getIntParameter("status_id");
                typeId = getIntParameter("payment_type_id");
                client = (String) getRequest().getParameter("client");
                totalAmount = checkNonNegativeDouble("total_amount", "Please enter a valid total amount");

                if (getRequest().getParameter("gross_amount") != null && getRequest().getParameter("gross_amount").trim().length() > 0) {
                	grossAmount = checkNonNegativeDouble("gross_amount", "Please enter a valid gross amount");
                }
                
                if (getRequest().getParameter("net_amount").trim().length() > 0) {
                    netAmount = checkNonNegativeDouble("net_amount", "Please enter a valid net amount");
                }

                if (getRequest().getParameter("installment_number") != null) {
                	installmentNumber = getIntParameter("installment_number");
                }
                
                methodId = getIntParameter("payment_method_id");

                modificationRationaleId = getOptionalIntParameter("modification_rationale_id");

                checkDate("due_date", "Please enter a valid due date");
                dueDate = getStringParameter("due_date");

                if (getRequest().getParameter("missing_reference") != null) {
                    addError("error", getRequest().getParameter("missing_reference"));
                }


                if (!hasErrors()) {
                    // Parameters are ok, so add or update the payment

                	if (adding) {
                    	payment = BasePayment.createPayment(typeId, userId, grossAmount, 0);                    	
                    }
                    
                    if (payment instanceof AlgorithmRoundReferencePayment) {
                        ((AlgorithmRoundReferencePayment) payment).setRoundId(getLongParameter("algorithm_round_id"));
                        
                    } else if (payment instanceof ComponentProjectReferencePayment) {
                        ((ComponentProjectReferencePayment) payment).setProjectId(getLongParameter("component_project_id"));
                        ((ComponentProjectReferencePayment) payment).setClient(client);
                        
                    } else if (payment instanceof AlgorithmProblemReferencePayment) {
                    	((AlgorithmProblemReferencePayment) payment).setProblemId(getOptionalLongParameter("algorithm_problem_id", 0));
                        
                    } else if (payment instanceof StudioContestReferencePayment) {
                    	((StudioContestReferencePayment) payment).setContestId(getLongParameter("studio_contest_id"));
                    	
                    } else if (payment instanceof ComponentContestReferencePayment) {
                    	((ComponentContestReferencePayment) payment).setContestId(getLongParameter("component_contest_id"));
                    	
                    } else if (payment instanceof DigitalRunStageReferencePayment) {
                    	((DigitalRunStageReferencePayment) payment).setStageId(getLongParameter("digital_run_stage_id"));
                    	
                    } else if (payment instanceof DigitalRunSeasonReferencePayment) {
                    	((DigitalRunSeasonReferencePayment) payment).setSeasonId(getLongParameter("digital_run_season_id"));
                    	
                    } else if (payment instanceof ParentReferencePayment) {
                    	((ParentReferencePayment) payment).setParentId(getLongParameter("parent_reference_id"));
                    }

                
                    
                    payment.setDescription(desc);
                    payment.setStatusId(statusId);
                    payment.setTotalAmount(totalAmount);
                    payment.setGrossAmount(grossAmount > 0? grossAmount : totalAmount);
                    payment.setNetAmount(netAmount);
                    payment.setDueDate(sdf.parse(dueDate));
                    payment.setMethodId(methodId);
                    payment.setModificationRationale(modificationRationaleId);
                    payment.setCharity(charity);
                    payment.setInstallmentNumber(installmentNumber);
                    
                    if (adding) {
                    	List payments = new ArrayList();
                        if (contractId > 0) {
                            payment.setContractId(contractId);
                        } 
                        
                        if (payment instanceof ComponentWinningPayment) {
                        	int placed = getIntParameter("placed");
                        	ComponentWinningPayment p = (ComponentWinningPayment) payment;
                    		List l = dib.generateComponentUserPayments(p.getCoderId(), p.getGrossAmount(), p.getClient(), p.getProjectId(), placed); 

                        	if (p.isDesign() && grossAmount == 0) {
                        		// todo: calculate 2nd installment
                        		BasePayment aux = (BasePayment) l.get(0);
                        		p.setGrossAmount(aux.getGrossAmount());
                            	payment = dib.addPayment(payment);
                            	payments.add(payment);
                        		
                        	} else {
                        		l.set(0, p);

                        		l = dib.addPayments(l);
                        		payments.addAll(l);
                        	}
                        } else {
                        	payment = dib.addPayment(payment);
                        	payments.add(payment);
                        }               

                        
                		List ids = new ArrayList();
                		for (int i = 0; i < payments.size(); i++) {
                			long id = ((BasePayment) payments.get(i)).getId();
                			ids.add(new Long(id)); 

                        	List refer = dib.findPayments(CODER_REFERRAL_PAYMENT, id);
                    		for (int j = 0; j < refer.size(); j++) {
                    			ids.add(new Long(((BasePayment) refer.get(j)).getId())); 
                    		}
                		}                		
                        setNextPage(Links.viewPayments(ids));
                    } else {
                        dib.updatePayment(payment);
                        setNextPage(Links.viewPayment(paymentId));
                    }

                    setIsNextPageInContext(false);

                    return;
                } else {
                    // there were some errors!

                    setDefault("total_amount", getRequest().getParameter("total_amount"));
                    setDefault("gross_amount", getRequest().getParameter("gross_amount"));
                    setDefault("net_amount", getRequest().getParameter("net_amount"));
                    if (((String) getRequest().getParameter("reference_description")).length() > 0) {
                        getRequest().setAttribute("reference_description", getRequest().getParameter("reference_description"));
                    }
                }
            } else {
                // The user is loading the page, so set the default values

                if (adding) {
                    typeId = contractId > 0? CONTRACT_PAYMENT : ALGORITHM_CONTEST_PAYMENT;
                    statusId = PAYMENT_PENDING_STATUS;
                    methodId = 1; // CHECK
                    Calendar date = Calendar.getInstance();
                    date.setTime(new Date());
                    date.add(Calendar.DAY_OF_YEAR, COMPONENT_DUE_DATE_INTERVAL);
                    dueDate = new SimpleDateFormat(DATE_FORMAT_STRING).format(date.getTime());

                } else {
                    desc = payment.getDescription();
                    typeId = payment.getPaymentType();
                    methodId = payment.getMethodId();

                    if (payment instanceof ComponentProjectReferencePayment) {
                    	client = ((ComponentProjectReferencePayment) payment).getClient();
                    }


                    statusId = payment.getStatusId();
                    grossAmount = payment.getGrossAmount();
                    netAmount = payment.getNetAmount();
                    dueDate = sdf.format(payment.getDueDate());
                    charity = payment.isCharity();
                    modificationRationaleId = MODIFICATION_STATUS;

                    setDefault("gross_amount", new Double(grossAmount));
                    setDefault("net_amount", new Double(netAmount));

                    String refDescr = "[Can't get the description]";
                    String isDesign = "";
                    try {
                        payment = dib.fillPaymentData(payment);
                        refDescr = payment.getReferenceDescription();
                        if (payment instanceof ComponentWinningPayment) {
                        	isDesign = ((ComponentWinningPayment) payment).isDesign() + "";
                        }
                    } catch(Exception e) {}
                    getRequest().setAttribute("reference_description", refDescr);
                    getRequest().setAttribute("is_design", isDesign);

                    
                }
            }


            setDefault("payment_desc", desc);
            setDefault("payment_type_id", typeId + "");
            setDefault("payment_method_id", methodId + "");
            setDefault("client", client == null? "" : client);

            setDefault("status_id", statusId + "");
            setDefault("due_date", dueDate);
            setDefault("modification_rationale_id", modificationRationaleId + "");
            setDefault("charity_ind", Boolean.valueOf(charity));
            
            if (contract != null) {
                getRequest().setAttribute(CONTRACT, contract);
            }

            getRequest().setAttribute(USER, user);

            if (payment != null) {
                getRequest().setAttribute("reference_id", getReferenceId(payment) + "");
                getRequest().setAttribute(PAYMENT, payment);
            }

            getRequest().setAttribute(MODIFICATION_RATIONALE_LIST, dib.getModificationRationales().get(MODIFICATION_RATIONALE_LIST));
            getRequest().setAttribute(PAYMENT_TYPE_LIST, getPaymentTypeList());
            getRequest().setAttribute(PAYMENT_METHOD_LIST, dib.getPaymentMethods().get(PAYMENT_METHOD_LIST));
            getRequest().setAttribute(STATUS_CODE_LIST, getStatusList());

            setNextPage(INTERNAL_EDIT_PAYMENT_JSP);
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private long getReferenceId(BasePayment payment) {
        if (payment instanceof AlgorithmRoundReferencePayment) {
            return ((AlgorithmRoundReferencePayment) payment).getRoundId();
            
        } else if (payment instanceof ComponentProjectReferencePayment) {
            return ((ComponentProjectReferencePayment) payment).getProjectId();
            
        } else if (payment instanceof AlgorithmProblemReferencePayment) {
        	return ((AlgorithmProblemReferencePayment) payment).getProblemId();
            
        } else if (payment instanceof StudioContestReferencePayment) {
        	return ((StudioContestReferencePayment) payment).getContestId();
        	
        } else if (payment instanceof ComponentContestReferencePayment) {
        	return ((ComponentContestReferencePayment) payment).getContestId();
        	
        } else if (payment instanceof DigitalRunStageReferencePayment) {
        	return ((DigitalRunStageReferencePayment) payment).getStageId();
        	
        } else if (payment instanceof DigitalRunSeasonReferencePayment) {
        	return ((DigitalRunSeasonReferencePayment) payment).getSeasonId();
        	
        } else if (payment instanceof ParentReferencePayment) {
        	return ((ParentReferencePayment) payment).getParentId();
        }

		return 0;
	}

	
}

