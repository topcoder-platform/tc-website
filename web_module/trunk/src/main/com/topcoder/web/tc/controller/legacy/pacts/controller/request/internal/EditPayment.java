package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Status;
import javax.transaction.TransactionManager;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.AlgorithmProblemReferencePayment;
import com.topcoder.web.ejb.pacts.AlgorithmRoundReferencePayment;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.ComponentContestReferencePayment;
import com.topcoder.web.ejb.pacts.ComponentProjectReferencePayment;
import com.topcoder.web.ejb.pacts.ComponentWinningPayment;
import com.topcoder.web.ejb.pacts.DigitalRunSeasonReferencePayment;
import com.topcoder.web.ejb.pacts.DigitalRunStageReferencePayment;
import com.topcoder.web.ejb.pacts.DigitalRunTrackReferencePayment;
import com.topcoder.web.ejb.pacts.ParentReferencePayment;
import com.topcoder.web.ejb.pacts.ReviewBoardPayment;
import com.topcoder.web.ejb.pacts.StudioContestReferencePayment;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Contract;
import com.topcoder.web.tc.controller.legacy.pacts.common.Links;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;
import com.topcoder.web.tc.controller.legacy.pacts.common.UserProfileHeader;
import com.topcoder.web.tc.controller.legacy.pacts.common.UserProfileHeaderList;

/**
 * Add or update a payment.
 *
 * @author  cucu, pulky
 */
public class EditPayment extends PactsBaseProcessor implements PactsConstants {

    private static final int CLIENT_NOT_REQUIRED = 0;
    private static final int CLIENT_OPTIONAL = 1;
    private static final int CLIENT_REQUIRED = 2;

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
                userId = payment.getCoderId();
                user = new UserProfileHeader(dib.getUserProfileHeader(userId));
            }

            String desc = "";
            int typeId = -1;
            double totalAmount = 0.0;
            double grossAmount = 0.0;
            double netAmount = 0.0;
            int methodId = -1;
            int modificationRationaleId = -1;
            int installmentNumber = 1;
            String dueDate = "";
            String client = "";
            String invoiceNumber = "";

            if (getRequest().getParameter("payment_desc") != null) {
            	// The user is trying to save the payment, so check that the parameters are ok

                desc = checkNotEmptyString("payment_desc", "Please enter a description for the payment.");
                typeId = getIntParameter("payment_type_id");
                client = (String) getRequest().getParameter("client");
                totalAmount = checkNonNegativeDouble("total_amount", "Please enter a valid total amount");
                invoiceNumber = getStringParameter("invoice_number");

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

                Date d = checkDate("due_date", "Please enter a valid due date");
                dueDate = sdf.format(d);

                if (getRequest().getParameter("missing_reference") != null) {
                    addError("error", getRequest().getParameter("missing_reference"));
                }

                if (dib.requiresClient(typeId) == CLIENT_REQUIRED && 
                        "".equals((String) getRequest().getParameter("client"))) {
                    addError("error", "Please enter a valid client");
                }

                if (!hasErrors()) {
                    // Parameters are ok, so add or update the payment

                    // start a transaction
                    TransactionManager tm = null;
                    try {
                        tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
                        tm.begin();
                        
                    	payment = BasePayment.createPayment(typeId, userId, grossAmount, 0);                    	
                    	if (updating) {
                    		payment.setId(paymentId);
                        }
                        
                    	setReference(payment);                
                        
                        if (dib.requiresClient(payment.getPaymentType()) > CLIENT_NOT_REQUIRED) {
                            payment.setClient((String) getRequest().getParameter("client"));
                        }
                        payment.setDescription(desc);
                        
                        payment.setTotalAmount(totalAmount);
                        payment.setGrossAmount(grossAmount > 0 && (payment instanceof ComponentWinningPayment || payment instanceof ReviewBoardPayment) ? grossAmount : totalAmount);
                        payment.setNetAmount(netAmount);
                        payment.setDueDate(sdf.parse(dueDate));
                        payment.setMethodId(methodId);
                        payment.setModificationRationale(modificationRationaleId);
                        payment.setCharity(charity);
                        payment.setInstallmentNumber(installmentNumber);
                        payment.setInvoiceNumber(invoiceNumber);
                   
                        if (adding) {
                        	List payments = new ArrayList();
                            if (contractId > 0) {
                                payment.setContractId(contractId);
                            } 
                            
                            if (payment instanceof ComponentWinningPayment) {
    
                            	int placed = getIntParameter("placed");
                            	ComponentWinningPayment p = (ComponentWinningPayment) payment;
                            	List l = dib.generateComponentUserPayments(p.getCoderId(), p.getGrossAmount(), p.getClient(), p.getProjectId(), placed); 
    
                                // manage payment status
    
                                if (p.isDesign() && grossAmount == 0) {
                            		BasePayment aux = (BasePayment) l.get(0);
                            		if (installmentNumber == 1) {
                            			p.setGrossAmount(aux.getGrossAmount());
                            		} else {
                            			p.setGrossAmount(totalAmount - aux.getGrossAmount());
                            		}
    
                                    payment = dib.addPayment(p);
                                	payments.add(p);
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
                            // get payment's status
                            Payment oldPayment = new Payment(dib.getPayment(paymentId));
                            payment.setCurrentStatus(oldPayment.getCurrentStatus());
                            payment.setJiraIssueName(oldPayment.getJiraIssueName());

                            log.debug("# statuses: " + payment.getCurrentStatus().getReasons().size());
                            dib.updatePayment(payment);
                            setNextPage(Links.viewPayment(paymentId));
                        }
    
                        setIsNextPageInContext(false);
                        tm.commit();
                        return;
                    } catch (Exception e) {
                        if (tm != null && (tm.getStatus() == Status.STATUS_ACTIVE || tm.getStatus() == Status.STATUS_MARKED_ROLLBACK)) {
                            tm.rollback();
                        }
                        throw e;
                    }
                } else {
                    // there were some errors!

                    setDefault("total_amount", getRequest().getParameter("total_amount"));
                    setDefault("gross_amount", getRequest().getParameter("gross_amount"));
                    setDefault("net_amount", getRequest().getParameter("net_amount"));
                    setDefault("installment_number", getRequest().getParameter("installment_number"));
                    
                    if (((String) getRequest().getParameter("reference_description")).length() > 0) {
                        getRequest().setAttribute("reference_description", getRequest().getParameter("reference_description"));
                    }
                }
            } else {
                // The user is loading the page, so set the default values

                if (adding) {
                    typeId = contractId > 0? CONTRACT_PAYMENT : ALGORITHM_CONTEST_PAYMENT;
                    methodId = 1; // CHECK
                    Calendar date = Calendar.getInstance();
                    date.setTime(new Date());
                    date.add(Calendar.DAY_OF_YEAR, COMPONENT_DUE_DATE_INTERVAL);
                    dueDate = new SimpleDateFormat(DATE_FORMAT_STRING).format(date.getTime());

                } else {
                    desc = payment.getDescription();
                    typeId = payment.getPaymentType();
                    methodId = payment.getMethodId();
                    invoiceNumber = payment.getInvoiceNumber();

//                    if (payment instanceof ComponentProjectReferencePayment) {
//                    	client = ((ComponentProjectReferencePayment) payment).getClient();
                        client = payment.getClient();
//                    }


                    totalAmount = payment.getTotalAmount();
                    grossAmount = payment.getGrossAmount();
                    netAmount = payment.getNetAmount();
                    installmentNumber = payment.getInstallmentNumber();
                    dueDate = sdf.format(payment.getDueDate());
                    charity = payment.isCharity();
                    
                    setDefault("installment_number", new Integer(installmentNumber));
                    setDefault("total_amount", new Double(totalAmount));
                    setDefault("gross_amount", new Double(grossAmount));
                    setDefault("net_amount", new Double(netAmount));

                    String refDescr = "[Can't get the description]";
                    String isDesign = "";
                    try {
                        payment = dib.fillPaymentData(payment);
                        refDescr = payment.getReferenceDescription();
                        if (payment instanceof ComponentWinningPayment || payment instanceof ReviewBoardPayment) {
                        	isDesign = ((ComponentProjectReferencePayment) payment).isDesign() + "";
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
            setDefault("due_date", dueDate);
            setDefault("modification_rationale_id", modificationRationaleId + "");
            setDefault("charity_ind", Boolean.valueOf(charity));
            setDefault("invoice_number", invoiceNumber);
            
            if (contract != null) {
                getRequest().setAttribute(CONTRACT, contract);
            }

            getRequest().setAttribute(USER, user);

            if (payment != null) {
                getRequest().setAttribute("requiresClient", new Boolean(dib.requiresClient(payment.getPaymentType()) > CLIENT_NOT_REQUIRED));

                getRequest().setAttribute("reference_id", getReferenceId(payment) + "");
                getRequest().setAttribute(PAYMENT, payment);
            }

            getRequest().setAttribute(MODIFICATION_RATIONALE_LIST, dib.getModificationRationales().get(MODIFICATION_RATIONALE_LIST));
            getRequest().setAttribute(PAYMENT_TYPE_LIST, getPaymentTypeList());
            getRequest().setAttribute(PAYMENT_METHOD_LIST, dib.getPaymentMethods().get(PAYMENT_METHOD_LIST));

            setNextPage(INTERNAL_EDIT_PAYMENT_JSP);
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private void setReference(BasePayment payment) {
    	String rf = "reference_id";

    	boolean useRef = getRequest().getParameter(rf) != null && getRequest().getParameter(rf).trim().length() > 0;
    	
        

        if (payment instanceof AlgorithmRoundReferencePayment) {
            ((AlgorithmRoundReferencePayment) payment).setRoundId(getLongParameter(useRef? rf : "algorithm_round_id"));
            
        } else if (payment instanceof ComponentProjectReferencePayment) {
            ((ComponentProjectReferencePayment) payment).setProjectId(getLongParameter(useRef? rf : "component_project_id"));
            
        } else if (payment instanceof AlgorithmProblemReferencePayment) {
        	((AlgorithmProblemReferencePayment) payment).setProblemId(getOptionalLongParameter(useRef? rf : "algorithm_problem_id", 0));
            
        } else if (payment instanceof StudioContestReferencePayment) {
        	((StudioContestReferencePayment) payment).setContestId(getLongParameter(useRef? rf : "studio_contest_id"));
        	
        } else if (payment instanceof ComponentContestReferencePayment) {
        	((ComponentContestReferencePayment) payment).setContestId(getLongParameter(useRef? rf : "component_contest_id"));
        	
        } else if (payment instanceof DigitalRunStageReferencePayment) {
            ((DigitalRunStageReferencePayment) payment).setStageId(getLongParameter(useRef? rf : "digital_run_stage_id"));
            
        } else if (payment instanceof DigitalRunTrackReferencePayment) {
            ((DigitalRunTrackReferencePayment) payment).setTrackId(getLongParameter(useRef? rf : "digital_run_track_id"));
            
        } else if (payment instanceof DigitalRunSeasonReferencePayment) {
        	((DigitalRunSeasonReferencePayment) payment).setSeasonId(getLongParameter(useRef? rf : "digital_run_season_id"));
        	
        } else if (payment instanceof ParentReferencePayment) {
        	((ParentReferencePayment) payment).setParentId(getLongParameter(useRef? rf : "parent_reference_id"));
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
        	
        } else if (payment instanceof DigitalRunTrackReferencePayment) {
            return ((DigitalRunTrackReferencePayment) payment).getTrackId();
            
        } else if (payment instanceof DigitalRunSeasonReferencePayment) {
        	return ((DigitalRunSeasonReferencePayment) payment).getSeasonId();
        	
        } else if (payment instanceof ParentReferencePayment) {
        	return ((ParentReferencePayment) payment).getParentId();
        }

		return 0;
	}

	
}

