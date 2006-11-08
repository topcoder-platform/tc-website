package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Contract;
import com.topcoder.web.tc.controller.legacy.pacts.common.Links;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;
import com.topcoder.web.tc.controller.legacy.pacts.common.PaymentHeader;
import com.topcoder.web.tc.controller.legacy.pacts.common.UserProfileHeader;

/**
 * Add or update a payment.
 *
 * @author  cucu
 */
public class EditPayment extends PactsBaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {
        try {
            boolean updating = getRequest().getParameter("payment_id") != null;
            boolean adding = !updating;

            DataInterfaceBean dib = new DataInterfaceBean();
            long paymentId = -1;
            long userId = -1;
            long contractId = -1;
            Payment payment = null;
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
                payment = new Payment(dib.getPayment(paymentId));
                if (payment.getStatusId() == PAID_STATUS) {
                    throw new NavigationException("You can't update a paid payment");
                }

                user = payment.getHeader().getUser();
            }

            String desc = "";
            int statusId = -1;
            int typeId = -1;
            double grossAmount = 0.0;
            double netAmount = 0.0;
            int methodId = -1;
            int modificationRationaleId = -1;
            String dueDate = "";
            String client = "";

            if (getRequest().getParameter("payment_desc") != null) {
                // The user is trying to save the payment, so check that the parameters are ok

                desc = checkNotEmptyString("payment_desc", "Please enter a description for the payment.");
                statusId = getIntParameter("status_id");
                typeId = getIntParameter("payment_type_id");
                client = (String) getRequest().getParameter("client");
                grossAmount = checkNonNegativeDouble("gross_amount", "Please enter a valid gross amount");
                if (getRequest().getParameter("net_amount").trim().length() > 0) {
                    netAmount = checkNonNegativeDouble("net_amount", "Please enter a valid net amount");
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
                        payment = new Payment();
                        payment.getHeader().getUser().setId(userId);
                    }

                    payment.getHeader().setDescription(desc);
                    payment.getHeader().setTypeId(typeId);
                    payment.getHeader().setMethodId(methodId);
                    payment.getHeader().setClient(client);

                    setReference(payment.getHeader());

                    payment.setStatusId(statusId);
                    payment.setGrossAmount(grossAmount);
                    payment.setNetAmount(netAmount);
                    payment.setDueDate(dueDate);
                    payment.setRationaleId(modificationRationaleId);
                    payment.setCharity(charity);

                    if (adding) {
                        if (contractId > 0) {
                            paymentId = dib.addContractPayment(contractId, payment);
                        } else {
                            paymentId = dib.addPayment(payment, true);
                        }

                    } else {
                        dib.updatePayment(payment);
                    }

                    setIsNextPageInContext(false);

                    if (adding && contractId > 0) {
                        setNextPage(Links.viewContract(contractId));
                    } else {
                        setNextPage(Links.viewPayment(paymentId));
                    }
                    return;
                } else {
                    // there were some errors!

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
                    desc = payment.getHeader().getDescription();
                    typeId = payment.getHeader().getTypeId();
                    methodId = payment.getHeader().getMethodId();
                    client = payment.getHeader().getClient();


                    statusId = payment.getStatusId();
                    grossAmount = payment.getGrossAmount();
                    netAmount = payment.getNetAmount();
                    dueDate = payment.getDueDate();
                    charity = payment.isCharity();
                    modificationRationaleId = MODIFICATION_STATUS;

                    setDefault("gross_amount", new Double(grossAmount));
                    setDefault("net_amount", new Double(netAmount));

                    BasePayment p =  BasePayment.createPayment(typeId, 1, 0.01, payment.getHeader().getReferenceId());
                    String refDescr = "[Can't get the description]";
                    try {
                        p = dib.fillPaymentData(p);
                        refDescr = p.getReferenceDescription();
                    } catch(Exception e) {}
                    getRequest().setAttribute("reference_description", refDescr);
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
                getRequest().setAttribute("reference_id", payment.getHeader().getReferenceId() + "");
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

    private void setReference(PaymentHeader header) {
        if (getRequest().getParameter("algorithm_round_id") != null) {
            header.setAlgorithmRoundId(getLongParameter("algorithm_round_id"));
        }

        if (getRequest().getParameter("component_project_id") != null) {
            header.setComponentProjectId(getLongParameter("component_project_id"));
        }

        if (getRequest().getParameter("algorithm_problem_id") != null) {
                header.setAlgorithmProblemId(getOptionalLongParameter("algorithm_problem_id", 0));
        }

        if (getRequest().getParameter("studio_contest_id") != null) {
            header.setStudioContestId(getLongParameter("studio_contest_id"));
        }

        if (getRequest().getParameter("component_contest_id") != null) {
            header.setComponentContestId(getLongParameter("component_contest_id"));
        }

        if (getRequest().getParameter("digital_run_stage_id") != null) {
            header.setDigitalRunStageId(getLongParameter("digital_run_stage_id"));
        }

        if (getRequest().getParameter("digital_run_season_id") != null) {
            header.setDigitalRunSeasonId(getLongParameter("digital_run_season_id"));
        }

        if (getRequest().getParameter("parent_reference_id") != null) {
            header.setParentPaymentId(getLongParameter("parent_reference_id"));
        }

    }
}

