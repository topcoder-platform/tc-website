/******************************************************************************\
*
* File:          PactsInternalServlet.java
* Creation date: March 06, 2002 23:05
* Author:        Matt Murphy
*
* Copyright 2002, TopCoder, Inc
* All rights are reserved. Reproduction in whole or part is prohibited
* without the written consent of the copyright owner.
*
\******************************************************************************/

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import com.topcoder.web.pacts.common.*;
import com.topcoder.common.web.data.*;
import com.topcoder.web.pacts.bean.pacts_internal.dispatch.*;
import com.topcoder.web.pacts.bean.*;
import org.apache.log4j.*;
import java.util.*;

public class PactsInternalServlet extends HttpServlet implements PactsConstants {

	private static final int INT_TYPE = 1;
	private static final int BOOL_TYPE = 2;
	private static final int STRING_TYPE = 3;
	private static final int LONG_TYPE = 4;
	private static final int DOUBLE_TYPE = 5;
	private static final int FLOAT_TYPE = 6;
	private static final int DATE_TYPE = 7;

	private boolean parameterHasBeenPassed;

	private static Category log = PactsLog.getInstance(PactsInternalServlet.class.getName());

	private boolean makeBoolean(String booleanString) throws Exception {
        booleanString = booleanString.toUpperCase();
        if (booleanString.equals("T") || booleanString.equals("TRUE"))
            return true;
        if (booleanString.equals("F") || booleanString.equals("FALSE"))
            return false;
        throw new Exception("String " + booleanString + " could not be converted to boolean type");
    }


	private boolean checkParam(int type, String param, boolean required) {
		log.debug("checking for "+param);
		if (param == null || param.equals("")) return !required;

		log.debug("checking param - "+param+" - type: "+type);

		switch (type) {
			case INT_TYPE:
				try {
					Integer.parseInt(param);
				} catch (Exception e) {
					return false;
				}
				break;
			case BOOL_TYPE:
				try {
					makeBoolean(param);
				} catch (Exception e) {
					return false;
				}
				break;
			case LONG_TYPE:
				try {
					Long.parseLong(param);
				} catch (Exception e) {
					return false;
				}
				break;
			case DOUBLE_TYPE:
				try {
					Double.parseDouble(param);
				} catch (Exception e) {
					return false;
				}
				break;
			case FLOAT_TYPE:
				try {
					Float.parseFloat(param);
				} catch (Exception e) {
					return false;
				}
				break;
			case DATE_TYPE:
				try {
					StringTokenizer t = new StringTokenizer(param,"/");
					String s = (String) t.nextElement();
					if (s.length() > 2) return false;
					int i = Integer.parseInt(s);
					if (i < 1 || i > 12) return false;
					s = (String) t.nextElement();
					if (s.length() > 2) return false;
					i = Integer.parseInt(s);
					if (i < 1 || i > 31) return false;
					s = (String) t.nextElement();
					if (s.length() != 2 && s.length() != 4) return false;
					i = Integer.parseInt(s);
					if (i > 100 && i < 1970) return false;
				} catch (Exception e) {
					return false;
				}
		}

		log.debug("  OK");

		parameterHasBeenPassed = true;
		return true;
	}

     /*
     Forwarding JSP: "addAffidavit.jsp"
     */
     private void doAddAffidavit(HttpServletRequest request,
                                               HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doAddAffidavit<br>");
             InternalDispatchUserProfileHeader bean =
             	new InternalDispatchUserProfileHeader(request, response);
             UserProfileHeader results = bean.get();
	         request.setAttribute(PACTS_INTERNAL_RESULT,results);

	         DataInterfaceBean dib = new DataInterfaceBean();
	         Map map = dib.getAffidavitTypes();
			 request.setAttribute(AFFIDAVIT_TYPE_LIST, map.get(AFFIDAVIT_TYPE_LIST));
	         map = dib.getPaymentTypes();
			 request.setAttribute(PAYMENT_TYPE_LIST, map.get(PAYMENT_TYPE_LIST));
	         map = dib.getStatusCodes(PactsConstants.AFFIDAVIT_OBJ);
			 request.setAttribute(STATUS_CODE_LIST, map.get(STATUS_CODE_LIST));
	         map = dib.getRounds();
			 request.setAttribute(ROUND_LIST, map.get(ROUND_LIST));

			 forward(INTERNAL_ADD_AFFIDAVIT_JSP,request, response);

         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }


     /*
     This method adds an affidavit and it's payment.

     Forwarding JSP: "viewAffidavit.jsp"
     */
     private void doAddAffidavitPost(HttpServletRequest request,
                                                   HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doAddAffidavitPost<br>");

			 long round_id = Long.parseLong(request.getParameter("round_id"));

			 Affidavit a = new Affidavit(
				 round_id < 0 ? null : new Long(round_id),
				 Long.parseLong(request.getParameter("user_id")),
				 Integer.parseInt(request.getParameter("affidavit_status_id")),
				 request.getParameter("affidavit_desc"),
				 Integer.parseInt(request.getParameter("affidavit_type_id")),
				 false,
				 makeBoolean(request.getParameter(IS_NOTARIZED)));

			 Payment p = new Payment(
				 Long.parseLong(request.getParameter("user_id")),
				 request.getParameter("payment_desc"),
				 Integer.parseInt(request.getParameter("payment_type_id")),
				 Double.parseDouble(request.getParameter("net_amount")),
				 Double.parseDouble(request.getParameter("gross_amount")),
				 Integer.parseInt(request.getParameter("payment_status_id")));

			 p._dueDate = TCData.dateForm(request.getParameter("date_due"));

			 DataInterfaceBean dib = new DataInterfaceBean();
			 long affidavit_id = dib.addAffidavit(a, request.getParameter("text"), p);

             InternalDispatchAffidavit bean =
             	new InternalDispatchAffidavit(request, response);
             Affidavit results = bean.get(affidavit_id);
	         request.setAttribute(PACTS_INTERNAL_RESULT,results);

			 forward(INTERNAL_AFFIDAVIT_JSP,request, response);

         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }


     /*
     Forwarding JSP: "addContract.jsp"
     */
     private void doAddContract(HttpServletRequest request,
                                              HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doAddContract<br>");
             InternalDispatchUserProfileHeader bean =
             	new InternalDispatchUserProfileHeader(request, response);
             UserProfileHeader results = bean.get();
	         request.setAttribute(PACTS_INTERNAL_RESULT,results);

	         DataInterfaceBean dib = new DataInterfaceBean();
	         Map map = dib.getContractTypes();
			 request.setAttribute(CONTRACT_TYPE_LIST, map.get(CONTRACT_TYPE_LIST));
	         map = dib.getStatusCodes(PactsConstants.CONTRACT_OBJ);
			 request.setAttribute(STATUS_CODE_LIST, map.get(STATUS_CODE_LIST));

			 forward(INTERNAL_ADD_CONTRACT_JSP,request, response);

         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }


     /*
     This method adds a new contract

     Forwarding JSP: "viewContract.jsp"
     */
     private void doAddContractPost(HttpServletRequest request,
                                                  HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doAddContractPost<br>");

             Contract c = new Contract(
				 request.getParameter("name"),
				 Long.parseLong(request.getParameter("user_id")),
				 TCData.dateForm(request.getParameter("start_date")),
				 TCData.dateForm(request.getParameter("end_date")),
				 request.getParameter("contract_desc"),
				 Integer.parseInt(request.getParameter("status_id")),
				 Integer.parseInt(request.getParameter("contract_type_id")));

             DataInterfaceBean dib = new DataInterfaceBean();
             long contract_id = dib.addContract(c, request.getParameter("text"));

			 InternalDispatchContract bean =
			    new InternalDispatchContract(request, response);
			 Contract results = bean.get(contract_id);
			 request.setAttribute(PACTS_INTERNAL_RESULT,results);

			 forward(INTERNAL_CONTRACT_JSP,request, response);

         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }


     /*
     Forwarding JSP: "addPayment.jsp"
     */
     private void doAddPayment(HttpServletRequest request,
                                             HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doAddPayment<br>");

			 if (request.getParameter(CONTRACT_ID) != null) {
				InternalDispatchContract bean =
					new InternalDispatchContract(request, response);
				ContractHeader results = bean.get()._header;
				request.setAttribute(PACTS_INTERNAL_RESULT,results);
			 }
             else {
				InternalDispatchUserProfileHeader bean =
             		new InternalDispatchUserProfileHeader(request, response);
             	UserProfileHeader results = bean.get();
	         	request.setAttribute(PACTS_INTERNAL_RESULT,results);
		 	 }

	         DataInterfaceBean dib = new DataInterfaceBean();
	         Map map = dib.getPaymentTypes();
			 request.setAttribute(PAYMENT_TYPE_LIST, map.get(PAYMENT_TYPE_LIST));
	         map = dib.getStatusCodes(PactsConstants.PAYMENT_OBJ);
			 request.setAttribute(STATUS_CODE_LIST, map.get(STATUS_CODE_LIST));

			 forward(INTERNAL_ADD_PAYMENT_JSP,request, response);

         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }


     /*
     This method adds and links a payment.

     Forwarding JSPs: "viewPayment.jsp" "viewContract.jsp"
     */
     private void doAddPaymentPost(HttpServletRequest request,
                                                 HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doAddPaymentPost<br>");

			 Payment p = new Payment(
				 Long.parseLong(request.getParameter("user_id")),
				 request.getParameter("payment_desc"),
				 Integer.parseInt(request.getParameter("payment_type_id")),
				 Double.parseDouble(request.getParameter("net_amount")),
				 Double.parseDouble(request.getParameter("gross_amount")),
				 Integer.parseInt(request.getParameter("status_id")));

			 p._dueDate = TCData.dateForm(request.getParameter("date_due"));

			 DataInterfaceBean dib = new DataInterfaceBean();

			 if (request.getParameter(CONTRACT_ID) != null) {
				 long contract_id = Long.parseLong(request.getParameter(CONTRACT_ID));
			     dib.addContractPayment(contract_id, p);
				 InternalDispatchContract bean =
				    new InternalDispatchContract(request, response);
				 Contract results = bean.get(contract_id);
				 request.setAttribute(PACTS_INTERNAL_RESULT,results);

				 InternalDispatchNoteList nlb =
				 	new InternalDispatchNoteList(request, response);
				 Map search = new HashMap();
				 search.put(CONTRACT_ID,request.getParameter(CONTRACT_ID));
				 request.setAttribute(NOTE_HEADER_LIST,nlb.get(search));

				 forward(INTERNAL_CONTRACT_JSP,request, response);
		 	 }
		 	 else {
				 long payment_id = dib.addPayment(p);
				 InternalDispatchPayment bean =
				 	new InternalDispatchPayment(request, response);
				 Payment results = bean.get(payment_id);
				 request.setAttribute(PACTS_INTERNAL_RESULT,results);
				 forward(INTERNAL_PAYMENT_JSP,request, response);
			 }

         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }


     /*
     Forwardidng JSP: "addTaxForm.jsp"
     */
     private void doAddTaxForm(HttpServletRequest request,
                                             HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doAddTaxForm<br>");

	         DataInterfaceBean dib = new DataInterfaceBean();
	         Map map = dib.getStatusCodes(PactsConstants.TAX_FORM_OBJ);
			 request.setAttribute(STATUS_CODE_LIST, map.get(STATUS_CODE_LIST));

             forward(INTERNAL_ADD_TAX_FORM_JSP,request, response);
         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }


     /*
     This method adds a new tax form.

     Forwarding JSP: "viewTaxForm.jsp"
     */
     private void doAddTaxFormPost(HttpServletRequest request,
                                                 HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doAddTaxFormPost<br>");

             TaxForm t = new TaxForm(
				 request.getParameter("name"),
				 request.getParameter("tax_form_desc"),
				 Float.parseFloat(request.getParameter("default_withholding_percentage")),
				 Double.parseDouble(request.getParameter("default_withholding_amount")),
				 Integer.parseInt(request.getParameter("status_id")),
                 makeBoolean(request.getParameter("default_use_percentage"))
                 );

			 DataInterfaceBean dib = new DataInterfaceBean ();
			 long tax_form_id = dib.addTaxForm(t, request.getParameter("text"));

			 InternalDispatchTaxForm bean =
			    new InternalDispatchTaxForm(request, response);
			 TaxForm results = bean.get(tax_form_id);
			 request.setAttribute(PACTS_INTERNAL_RESULT,results);
			 forward(INTERNAL_TAX_FORM_JSP,request, response);

         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }


     /*
     Forwarding JSP: "addUserTaxForm.jsp"
     */
     private void doAddUserTaxForm(HttpServletRequest request,
                                             HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doAddUserTaxForm<br>");

			 InternalDispatchTaxFormList bean =
			 	new InternalDispatchTaxFormList(request, response);

			 TaxFormHeader[] results = bean.get();

			 request.setAttribute(PACTS_INTERNAL_RESULT,results);

			 DataInterfaceBean dib = new DataInterfaceBean();
			 request.setAttribute(STATUS_CODE_LIST,dib.getStatusCodes(PactsConstants.USER_TAX_FORM_OBJ).get(STATUS_CODE_LIST));

			 InternalDispatchUserProfileHeader uphb =
			 	new InternalDispatchUserProfileHeader(request, response);

			 request.setAttribute("user",uphb.get());

			 forward(INTERNAL_ADD_USER_TAX_FORM_JSP,request, response);

         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }


     /*
     This method adds a new user tax form.

     Forwarding JSP: "viewUserTaxForm.jsp"
     */
     private void doAddUserTaxFormPost(HttpServletRequest request,
                                                 HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doAddUserTaxFormPost<br>");

             TaxForm t = new TaxForm(
				 Long.parseLong(request.getParameter("user_id")),
				 Long.parseLong(request.getParameter("tax_form_id")),
				 TCData.dateForm(request.getParameter("date_filed")),
				 Integer.parseInt(request.getParameter("status_id")));

			 DataInterfaceBean dib = new DataInterfaceBean();
			 dib.addUserTaxForm(t);

			 InternalDispatchUserTaxForm bean =
			 	new InternalDispatchUserTaxForm(request, response);
			 TaxForm results = bean.get();
			 request.setAttribute(PACTS_INTERNAL_RESULT,results);

			 forward(INTERNAL_USER_TAX_FORM_JSP,request, response);

         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }


     /*
     This method gets the details for an affidavit.

     Forawrding JSP: "viewAffidavit.jsp"
     */
     private void doAffidavit(HttpServletRequest request,
                                            HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doAffidavit<br>");

             InternalDispatchAffidavit bean =
             	new InternalDispatchAffidavit(request, response);
             Affidavit results = bean.get();
	         request.setAttribute(PACTS_INTERNAL_RESULT,results);

			 InternalDispatchNoteList nlb =
			 	new InternalDispatchNoteList(request, response);
			 NoteHeader[] notes = nlb.get();
			 request.setAttribute(NOTE_HEADER_LIST,notes);

			 forward(INTERNAL_AFFIDAVIT_JSP,request, response);

         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }


     /*
     This method gets a list of affidavits.

     Forwarding JSP: "affidavitList.jsp"
     */
     private void doAffidavitList(HttpServletRequest request,
                                                HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doAffidavitList<br>");
             InternalDispatchAffidavitList bean =
             	new InternalDispatchAffidavitList(request, response);
             AffidavitHeader[] results = bean.get();
             if (results.length != 1) {
				request.setAttribute(PACTS_INTERNAL_RESULT,results);
				forward(INTERNAL_AFFIDAVIT_LIST_JSP,request, response);
		 	 }
		 	 else {
				 InternalDispatchNoteList nlb = new InternalDispatchNoteList(request,response);
				 Map search = new HashMap();
				 search.put(AFFIDAVIT_ID,""+results[0]._id);
				 NoteHeader[] notes = nlb.get(search);
				 request.setAttribute(NOTE_HEADER_LIST,notes);

				 InternalDispatchAffidavit ab = new InternalDispatchAffidavit(request,response);
				 Affidavit affidavit = ab.get(results[0]._id);
				 request.setAttribute(PACTS_INTERNAL_RESULT,affidavit);

				 forward(INTERNAL_AFFIDAVIT_JSP,request, response);
			 }

         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }

	/*
	This method forwards to a jsp.
	*/
    private void forward(String href, HttpServletRequest request,
			 HttpServletResponse response){
		try {
		    log.debug("Forwarding to ..." + href);

		    getServletConfig().getServletContext().getRequestDispatcher(href).forward(request, response);
		} catch (Exception e) {
		    e.printStackTrace();
		}
    }

	private String replaceInternal(String s, String tok, String r) {
		StringTokenizer t = new StringTokenizer(s,tok);
		try {
			s = (String) t.nextElement();
			while (t.hasMoreElements()) {
				s += r + (String) t.nextElement();
			}
		} catch (Exception e) {}
		return s;
	}

	private String safeParam(String param) {
		String rv = new String(param);
		rv = replaceInternal(rv,"%","%25");
		rv = replaceInternal(rv,"?","%3F");
		rv = replaceInternal(rv,"/","%2F");
		rv = replaceInternal(rv,"&","%26");
		rv = replaceInternal(rv,"=","%3D");
		rv = replaceInternal(rv,"+","%2B");
		rv = replaceInternal(rv," ","+");
		return rv;
	}

     /*
     This method authenticates the session and forwards
     the user to a login page if there is an error.
     */
     private boolean doAuthenticate(HttpServletRequest request,
                                               HttpServletResponse response)
     {
         try {
             HttpSession session = request.getSession(true);
             Navigation nav = (Navigation) session.getAttribute(NAV_OBJECT_ATTR);
             if (nav != null) {
				 UserProfileHeader client = new UserProfileHeader(nav);
             	 if (!client.isTCStaff()) {
					String query = request.getQueryString();
					query = INTERNAL_SERVLET_URL + "?" + query;

					String url = LOGIN_URL;
					if (!LOGIN_URL.equals("/login.jsp")) {
						url += "&errorMsg=You%20must%20be%20a%20TopCoder%20Staff";
						url += "%20Member%20to%20access%20this%20part%20of%20the%20site&errorURL=";
						url += safeParam(query);
					}

					forward(url,request,response);
				    return false;
			 	 }
             	 else return true;
			 }
			 else {
				 String query = request.getQueryString();
				 query = INTERNAL_SERVLET_URL + "?" + query;

				 String url = LOGIN_URL;
				 if (!LOGIN_URL.equals("/login.jsp")) {
					url += "&errorMsg=You%20must%20be%20a%20TopCoder%20Staff";
					url += "%20Member%20to%20access%20this%20part%20of%20the%20site&errorURL=";
					url += safeParam(query);
				 }

				 forward(url,request,response);
				 return false;
			 }
         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
	     return false;
     }

     private void doLogout(HttpServletRequest request,
     							HttpServletResponse response)
     {
		 try {
			 PrintWriter out = response.getWriter();
			 log.debug("doLogout<br>");
			 HttpSession session = request.getSession(true);
			 session.setAttribute(NAV_OBJECT_ATTR,null);
		 	 forward("/login.jsp",request,response);
		 } catch (Exception e) {
			 e.printStackTrace(); doError(request, response);
	 	 }
	 }

     /*
     This method gets the details for a contract.

     Forwarding JSP: "viewContract.jsp"
     */
     private void doContract(HttpServletRequest request,
                                           HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doContract<br>");

			 InternalDispatchContract bean =
			    new InternalDispatchContract(request, response);
			 Contract results = bean.get();
			 request.setAttribute(PACTS_INTERNAL_RESULT,results);

			 InternalDispatchNoteList nlb =
			 	new InternalDispatchNoteList(request, response);
			 NoteHeader[] notes = nlb.get();
			 request.setAttribute(NOTE_HEADER_LIST,notes);

			 forward(INTERNAL_CONTRACT_JSP,request, response);

         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }


     /*
     This method gets a list of contracts.

     Forwarding JSP: "contractList.jsp"
     */
     private void doContractList(HttpServletRequest request,
                                               HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doContractList<br>");

			 InternalDispatchContractList bean =
			 	new InternalDispatchContractList(request, response);
			 ContractHeader[] results = bean.get();

			 if (results.length != 1) {
				 request.setAttribute(PACTS_INTERNAL_RESULT,results);

				 forward(INTERNAL_CONTRACT_LIST_JSP,request, response);
		 	 }
		 	 else {
				 InternalDispatchNoteList nlb = new InternalDispatchNoteList(request, response);
				 Map search = new HashMap();
				 search.put(CONTRACT_ID,""+results[0]._id);
				 NoteHeader[] notes = nlb.get(search);
				 request.setAttribute(NOTE_HEADER_LIST,notes);

				 InternalDispatchContract cb = new InternalDispatchContract(request, response);
				 Contract contract = cb.get(results[0]._id);
				 request.setAttribute(PACTS_INTERNAL_RESULT,contract);

				 forward(INTERNAL_CONTRACT_JSP,request, response);
			 }

         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }


     /*
     Forwarding JSP: "pactsInternalError.jsp"
     */
     private void doError(HttpServletRequest request,
                                        HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doError<br>");

             forward(INTERNAL_ERROR_JSP,request, response);

         } catch (Exception e) {
             e.printStackTrace();
         }
     }


     /*
     Handles all GET requests.

     Checks to make sure the session is authenticated, that t and c are valid,
     and that all parameters exist for t and c.
     All subsequent get methods can assume that the above is already done.
     */
     public void doGet(HttpServletRequest request,
                                      HttpServletResponse response)
     {
		 parameterHasBeenPassed = false;
         try {
	         if (!doAuthenticate(request, response)) return;

             String task = request.getParameter(TASK_STRING);
             String command = request.getParameter(CMD_STRING);

             if (task != null && command != null) {
				 if (task.equals(LOGOUT_TASK)) {
					 doLogout(request, response);
					 return;
				 }
				 if (task.equals(SEARCH_TASK)) {
					 if (command.equals(USER_CMD)) {
						 doSearchUsers(request, response);
						 return;
					 }
					 if (command.equals(PAYMENT_CMD)) {
						 doSearchPayments(request, response);
						 return;
					 }
					 if (command.equals(AFFIDAVIT_CMD)) {
						 doSearchAffidavits(request, response);
						 return;
					 }
					 if (command.equals(CONTRACT_CMD)) {
						 doSearchContracts(request, response);
						 return;
					 }
					 if (command.equals(TAX_FORM_CMD)) {
						 doSearchTaxForms(request, response);
						 return;
					 }
					 if (command.equals(USER_TAX_FORM_CMD)) {
						 doSearchUserTaxForms(request, response);
						 return;
					 }
					 if (command.equals(NOTE_CMD)) {
						 doSearchNotes(request, response);
						 return;
					 }
					 doSearch(request, response);
					 return;
				 }
                 if (task.equals(LIST_TASK)) {
					 if (command.equals(AFFIDAVIT_CMD)) {
						 if (
							 checkParam(LONG_TYPE,request.getParameter(STATUS_CODE),false)
						  && checkParam(INT_TYPE,request.getParameter(TYPE_CODE),false)
						  && checkParam(DATE_TYPE,request.getParameter(EARLIEST_CREATION_DATE),false)
						  && checkParam(DATE_TYPE,request.getParameter(LATEST_CREATION_DATE),false)
						  && checkParam(LONG_TYPE,request.getParameter(PAYMENT_ID),false)
						  && checkParam(LONG_TYPE,request.getParameter(AFFIDAVIT_ID),false)
						  && checkParam(BOOL_TYPE,request.getParameter(IS_AFFIRMED),false)
						  && checkParam(BOOL_TYPE,request.getParameter(IS_NOTARIZED),false)
						  && checkParam(LONG_TYPE,request.getParameter(ROUND_ID),false)
						  && checkParam(LONG_TYPE,request.getParameter(USER_ID),false)
						  && checkParam(STRING_TYPE,request.getParameter(HANDLE),false)
						  && parameterHasBeenPassed) {

							 doAffidavitList(request, response);
						 }
						 else {
							 request.setAttribute("message","Invalid Search Parameter or No Search Parameter Specified");
							 doError(request, response);
						 }
						 return;
					 }
					 if (command.equals(CONTRACT_CMD)) {
						 if (
							 checkParam(LONG_TYPE,request.getParameter(STATUS_CODE),false)
						  && checkParam(INT_TYPE,request.getParameter(TYPE_CODE),false)
						  && checkParam(DATE_TYPE,request.getParameter(EARLIEST_CREATION_DATE),false)
						  && checkParam(DATE_TYPE,request.getParameter(LATEST_CREATION_DATE),false)
						  && checkParam(LONG_TYPE,request.getParameter(PAYMENT_ID),false)
						  && checkParam(LONG_TYPE,request.getParameter(CONTRACT_ID),false)
						  && checkParam(LONG_TYPE,request.getParameter(USER_ID),false)
						  && checkParam(STRING_TYPE,request.getParameter(HANDLE),false)
						  && checkParam(STRING_TYPE,request.getParameter(CONTRACT_NAME),false)
						  && checkParam(DATE_TYPE,request.getParameter(EARLIEST_START_DATE),false)
						  && checkParam(DATE_TYPE,request.getParameter(EARLIEST_END_DATE),false)
						  && checkParam(DATE_TYPE,request.getParameter(LATEST_START_DATE),false)
						  && checkParam(DATE_TYPE,request.getParameter(LATEST_END_DATE),false)
						  && parameterHasBeenPassed) {

							 doContractList(request, response);
					 	 }
					 	 else {
							 request.setAttribute("message","Invalid Search Parameter or No Search Parameter Specified");
							 doError(request, response);
						 }
						 return;
					 }
					 if (command.equals(PAYMENT_CMD)) {
						 if (
							 checkParam(LONG_TYPE,request.getParameter(STATUS_CODE),false)
						  && checkParam(INT_TYPE,request.getParameter(TYPE_CODE),false)
						  && checkParam(DATE_TYPE,request.getParameter(EARLIEST_DUE_DATE),false)
						  && checkParam(DATE_TYPE,request.getParameter(LATEST_DUE_DATE),false)
						  && checkParam(DATE_TYPE,request.getParameter(EARLIEST_PRINT_DATE),false)
						  && checkParam(DATE_TYPE,request.getParameter(LATEST_PRINT_DATE),false)
						  && checkParam(DATE_TYPE,request.getParameter(EARLIEST_PAY_DATE),false)
						  && checkParam(DATE_TYPE,request.getParameter(LATEST_PAY_DATE),false)
						  && checkParam(LONG_TYPE,request.getParameter(PAYMENT_ID),false)
						  && checkParam(LONG_TYPE,request.getParameter(CONTRACT_ID),false)
						  && checkParam(LONG_TYPE,request.getParameter(AFFIDAVIT_ID),false)
						  && checkParam(LONG_TYPE,request.getParameter(USER_ID),false)
						  && checkParam(STRING_TYPE,request.getParameter(HANDLE),false)
						  && checkParam(DOUBLE_TYPE,request.getParameter(HIGHEST_NET_AMOUNT),false)
						  && checkParam(DOUBLE_TYPE,request.getParameter(LOWEST_NET_AMOUNT),false)
						  && checkParam(BOOL_TYPE,request.getParameter(IS_REVIEWED),false)
						  && parameterHasBeenPassed) {

							 doPaymentList(request, response);
						 }
					 	 else {
							 request.setAttribute("message","Invalid Search Parameter or No Search Parameter Specified");
							 doError(request, response);
						 }
						 return;
					 }
					 if (command.equals(TAX_FORM_CMD)) {
						 if (
							 checkParam(LONG_TYPE,request.getParameter(STATUS_CODE),false)
						  && checkParam(DOUBLE_TYPE,request.getParameter(LOWEST_WITHHOLDING_AMOUNT),false)
						  && checkParam(DOUBLE_TYPE,request.getParameter(HIGHEST_WITHHOLDING_AMOUNT),false)
						  && checkParam(FLOAT_TYPE,request.getParameter(LOWEST_WITHHOLDING_PERCENTAGE),false)
						  && checkParam(FLOAT_TYPE,request.getParameter(HIGHEST_WITHHOLDING_PERCENTAGE),false)) {

							 doTaxFormList(request, response);
						 }
						 else {
						 	request.setAttribute("message","Invalid Search Parameter");
						 	doError(request, response);
						 }
						 return;
					 }
					 if (command.equals(USER_TAX_FORM_CMD)) {
						 if (
							 checkParam(LONG_TYPE,request.getParameter(STATUS_CODE),false)
						  && checkParam(DOUBLE_TYPE,request.getParameter(LOWEST_WITHHOLDING_AMOUNT),false)
						  && checkParam(DOUBLE_TYPE,request.getParameter(HIGHEST_WITHHOLDING_AMOUNT),false)
						  && checkParam(FLOAT_TYPE,request.getParameter(LOWEST_WITHHOLDING_PERCENTAGE),false)
						  && checkParam(FLOAT_TYPE,request.getParameter(HIGHEST_WITHHOLDING_PERCENTAGE),false)
						  && checkParam(DATE_TYPE,request.getParameter(EARLIEST_DATE_FILED),false)
						  && checkParam(DATE_TYPE,request.getParameter(LATEST_DATE_FILED),false)
						  && checkParam(LONG_TYPE,request.getParameter(USER_ID),false)
						  && checkParam(LONG_TYPE,request.getParameter(TAX_FORM_ID),false)
						  && checkParam(STRING_TYPE,request.getParameter(HANDLE),false)
						  && parameterHasBeenPassed) {

							 doUserTaxFormList(request, response);
						 }
						 else {
							 request.setAttribute("message","User Tax Form List\n<br>Invalid Search Parameter or No Search Parameter Specified");
							 doError(request, response);
						 }
						 return;
					 }
					 if (command.equals(USER_CMD)) {
						 if (
							 checkParam(STRING_TYPE,request.getParameter(FIRST_NAME),false)
						  && checkParam(STRING_TYPE,request.getParameter(MIDDLE_NAME),false)
						  && checkParam(STRING_TYPE,request.getParameter(LAST_NAME),false)
						  && checkParam(STRING_TYPE,request.getParameter(HANDLE),false)
						  && checkParam(BOOL_TYPE,request.getParameter(HAS_ACTIVE_CONTRACTS),false)
						  && checkParam(BOOL_TYPE,request.getParameter(HAS_PENDING_AFFIDAVITS),false)
						  && checkParam(BOOL_TYPE,request.getParameter(HAS_TAX_FORMS_ON_FILE),false)
						  && checkParam(BOOL_TYPE,request.getParameter(IS_OWED_MONEY),false)
						  && parameterHasBeenPassed) {

							 doUserList(request, response);
						 }
						 else {
							 request.setAttribute("message","Invalid Search Parameter or No Search Parameter Specified");
							 doError(request, response);
						 }
						 return;
					 }
					 if (command.equals(NOTE_CMD)) {
						 if (
							 checkParam(LONG_TYPE,request.getParameter(SUBMITTING_USER_ID),false)
						  && checkParam(STRING_TYPE,request.getParameter(SUBMITTING_HANDLE),false)
						  && checkParam(INT_TYPE,request.getParameter(TYPE_CODE),false)
						  && checkParam(DATE_TYPE,request.getParameter(EARLIEST_CREATION_DATE),false)
						  && checkParam(DATE_TYPE,request.getParameter(LATEST_CREATION_DATE),false)
						  && checkParam(LONG_TYPE,request.getParameter(PAYMENT_ID),false)
						  && checkParam(LONG_TYPE,request.getParameter(CONTRACT_ID),false)
						  && checkParam(LONG_TYPE,request.getParameter(USER_ID),false)
						  && checkParam(LONG_TYPE,request.getParameter(TAX_FORM_ID),false)
						  && checkParam(LONG_TYPE,request.getParameter(TAX_FORM_USER_ID),false)
						  && checkParam(LONG_TYPE,request.getParameter(AFFIDAVIT_ID),false)
						  && checkParam(LONG_TYPE,request.getParameter(NOTE_ID),false)
						  && checkParam(STRING_TYPE,request.getParameter(HANDLE),false)
						  && checkParam(STRING_TYPE,request.getParameter(IN_DEPTH_HANDLE),false)
						  && parameterHasBeenPassed) {

							 doNoteList(request, response);
						 }
						 else {
							 request.setAttribute("message","Invalid Search Parameter or No Search Parameter Specified");
							 doError(request, response);
						 }
						 return;
					 }
					 if (command.equals(COMBO_CMD)) {
						 if (checkParam(LONG_TYPE,request.getParameter(NOTE_ID),true)) doComboList(request, response);
						 else {
							 request.setAttribute("message","Invalid Note ID or No Note ID Specified");
							 doError(request, response);
						 }
						 return;
					 }
					 doError(request, response);
					 return;
				 }
				 if (task.equals(VIEW_TASK)) {
					if (command.equals(AFFIDAVIT_CMD)) {
					 	if (checkParam(LONG_TYPE,request.getParameter(AFFIDAVIT_ID),true)) doAffidavit(request, response);
						else {
							request.setAttribute("message","Invalid Affidavit ID or No Affidavit ID Specified");
							doError(request, response);
						}
					 	return;
					}
					if (command.equals(CONTRACT_CMD)) {
					 	if (checkParam(LONG_TYPE,request.getParameter(CONTRACT_ID),true)) doContract(request, response);
						else {
							request.setAttribute("message","Invalid Contract ID or No Contract ID Specified");
							doError(request, response);
						}
					 	return;
					}
					if (command.equals(PAYMENT_CMD)) {
					 	if (checkParam(LONG_TYPE,request.getParameter(PAYMENT_ID),true)) doPayment(request, response);
						else {
							request.setAttribute("message","Invalid Payment ID or No Payment ID Specified");
							doError(request, response);
						}
					 	return;
					}
					if (command.equals(PAYMENT_AUDIT_TRAIL_CMD)) {
					 	if (checkParam(LONG_TYPE,request.getParameter(PAYMENT_ID),true)) doPaymentAuditTrail(request, response);
						else {
							request.setAttribute("message","Invalid Payment ID or No Payment ID Specified");
							doError(request, response);
						}
					 	return;
					}
					if (command.equals(TAX_FORM_CMD)) {
					 	if (checkParam(LONG_TYPE,request.getParameter(TAX_FORM_ID),true)) doTaxForm(request, response);
						else {
							request.setAttribute("message","Invalid Tax Form ID or No Tax Form ID Specified");
							doError(request, response);
						}
					 	return;
					}
					if (command.equals(USER_TAX_FORM_CMD)) {
					 	if (
							checkParam(LONG_TYPE,request.getParameter(TAX_FORM_ID),true)
						 && checkParam(LONG_TYPE,request.getParameter(USER_ID),true)) doUserTaxForm(request, response);
						else {
							request.setAttribute("message","Invalid ID or No ID Specified");
							doError(request, response);
						}
					 	return;
					}
					if (command.equals(USER_CMD)) {
					 	if (checkParam(LONG_TYPE,request.getParameter(USER_ID),true)) doUser(request, response);
						else {
							request.setAttribute("message","Invalid User ID or No User ID Specified");
							doError(request, response);
						}
					 	return;
					}
					if (command.equals(NOTE_CMD)) {
					 	if (checkParam(LONG_TYPE,request.getParameter(NOTE_ID),true)) doNote(request, response);
						else {
							request.setAttribute("message","Invalid Note ID or No Note ID Specified");
							doError(request, response);
						}
					 	return;
					}
					if (command.equals(TEXT_CMD)) {
					 	if (
							checkParam(LONG_TYPE,request.getParameter("object_id"),true)
						 && checkParam(INT_TYPE,request.getParameter("object_type"),true)) doText(request, response);
						else {
							request.setAttribute("message","Invalid ID or Type or No ID or Type Specified");
							doError(request, response);
						}
					 	return;
					}
					doError(request, response);
					return;
				 }
				 if (task.equals(ADD_TASK)) {
					 if (command.equals(AFFIDAVIT_CMD)) {
					 	if (checkParam(LONG_TYPE,request.getParameter(USER_ID),true)) doAddAffidavit(request, response);
						else {
							request.setAttribute("message","Invalid User ID or No User ID Specified");
							doError(request, response);
						}
					 	return;
					 }
					 if (command.equals(CONTRACT_CMD)) {
					 	if (checkParam(LONG_TYPE,request.getParameter(USER_ID),true)) doAddContract(request, response);
						else {
							request.setAttribute("message","Invalid User ID or No User ID Specified");
							doError(request, response);
						}
					 	return;
					 }
					 if (command.equals(PAYMENT_CMD)) {
					 	if (
							checkParam(LONG_TYPE,request.getParameter(USER_ID),true)
						 || checkParam(LONG_TYPE,request.getParameter(CONTRACT_ID),true)) doAddPayment(request, response);
						else {
							request.setAttribute("message","Invalid User ID or No User ID Specified");
							doError(request, response);
						}
					 	return;
					 }
					 if (command.equals(TAX_FORM_CMD)) {
						 doAddTaxForm(request, response);
						 return;
					 }
					 if (command.equals(USER_TAX_FORM_CMD)) {
					 	if (checkParam(LONG_TYPE,request.getParameter(USER_ID),true)) doAddUserTaxForm(request, response);
						else {
							request.setAttribute("message","Invalid User ID or No User ID Specified");
							doError(request, response);
						}
					 	return;
					 }
					 if (command.equals(NOTE_CMD)) {
					 	if (
							checkParam(INT_TYPE,request.getParameter("object_type"),true)
						 && checkParam(LONG_TYPE,request.getParameter("object_id"),true)) doAddNote(request, response);
						else {
							request.setAttribute("message","Invalid ID pr Type or No ID or Type Specified");
							doError(request, response);
						}
					 	return;
					 }
					 if (command.equals(NOTE_LINK_CMD)) {
						 doAddNoteLink(request, response);
						 return;
					 }
					 doError(request, response);
					 return;
				 }
//########################################################################################################
//########################################################################################################
//########################################################################################################
//########################################################################################################
//########################################################################################################
//########################################################################################################
//########################################################################################################
//###################################### Finish Parameter Checking #######################################
//########################################################################################################
//########################################################################################################
//########################################################################################################
//########################################################################################################
//########################################################################################################
//########################################################################################################
//########################################################################################################
				 if (task.equals(UPDATE_TASK)) {
					 if (command.equals(AFFIDAVIT_CMD)) {
						 doUpdateAffidavit(request, response);
						 return;
					 }
					 if (command.equals(CONTRACT_CMD)) {
						 doUpdateContract(request, response);
						 return;
					 }
					 if (command.equals(PAYMENT_CMD)) {
						 doUpdatePayment(request, response);
						 return;
					 }
					 if (command.equals(TAX_FORM_CMD)) {
						 doUpdateTaxForm(request, response);
						 return;
					 }
					 if (command.equals(USER_TAX_FORM_CMD)) {
						 doUpdateUserTaxForm(request, response);
						 return;
					 }
					 doError(request, response);
					 return;
				 }
				 if (task.equals(PAYMENT_TASK)) {
					 if (command.equals(PAID_CMD)) {
						 doPayPayments(request, response);
						 return;
					 }
					 if (command.equals(PRINT_CMD)) {
						 doPrintPayments(request, response);
						 return;
					 }
					 if (command.equals(REVIEW_CMD)) {
						 doReviewPayments(request, response);
						 return;
					 }
					 if (command.equals(STATUS_CMD)) {
						 doPaymentStatus(request, response);
						 return;
					 }
					 if (command.equals(FILE_CMD)) {
						 doFile(request, response);
						 return;
					 }
					 doError(request, response);
					 return;
				 }
				doError(request, response);
				return;
             }
             else {
                 doSearch(request, response);
             }
         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }


     /*
     This method gets the details of a payment.

     Forwarding JSP: "viewPayment.jsp"
     */
     private void doPayment(HttpServletRequest request,
                                          HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doPayment<br>");

			 InternalDispatchPayment bean =
			 	new InternalDispatchPayment(request, response);
			 Payment results = bean.get();
			 request.setAttribute(PACTS_INTERNAL_RESULT,results);

			 InternalDispatchNoteList nlb =
			 	new InternalDispatchNoteList(request, response);
			 Map search = new HashMap();
			 search.put(PAYMENT_ID, request.getParameter(PAYMENT_ID));
			 request.setAttribute(NOTE_HEADER_LIST,nlb.get(search));

			 forward(INTERNAL_PAYMENT_JSP,request, response);

         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }


     /*
     This method gets the audit trail of a payment.

     Forwarding JSP: "viewPaymentAuditTrail.jsp"
     */
     private void doPaymentAuditTrail(HttpServletRequest request,
                                          HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doPaymentAuditTrail<br>");

			 InternalDispatchPaymentAuditTrail bean =
			 	new InternalDispatchPaymentAuditTrail(request, response);
			 Payment[] results = bean.get();

			 InternalDispatchNoteList nlb =
			 	new InternalDispatchNoteList(request, response);
			 Map search = new HashMap();
			 search.put(PAYMENT_ID, request.getParameter(PAYMENT_ID));
			 request.setAttribute(NOTE_HEADER_LIST,nlb.get(search));

			 request.setAttribute(PACTS_INTERNAL_RESULT,results);
			 forward(INTERNAL_PAYMENT_AUDIT_TRAIL_JSP,request, response);

         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }


     /*
     This method gets a list of payments.

     Forwarding JSP: "paymentList.jsp"
     */
     private void doPaymentList(HttpServletRequest request,
                                              HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doPaymentList<br>");
			 String query = request.getQueryString();
			 query = INTERNAL_SERVLET_URL + "?" + query;
			 request.setAttribute("query",query);



			 InternalDispatchPaymentList bean =
			 	new InternalDispatchPaymentList(request, response);
			 PaymentHeader[] results = bean.get();
			 if (results.length != 1) {
				 DataInterfaceBean dib = new DataInterfaceBean();

				 request.setAttribute(STATUS_CODE_LIST,dib.getStatusCodes(PAYMENT_OBJ).get(STATUS_CODE_LIST));
				 request.setAttribute(PACTS_INTERNAL_RESULT,results);
			 	 forward(INTERNAL_PAYMENT_LIST_JSP,request, response);
			 }
			 else {
				 InternalDispatchNoteList nlb = new InternalDispatchNoteList(request, response);
				 Map search = new HashMap();
				 search.put(PAYMENT_ID,""+results[0]._id);
				 request.setAttribute(NOTE_HEADER_LIST,nlb.get(search));

				 InternalDispatchPayment pb = new InternalDispatchPayment(request, response);
				 request.setAttribute(PACTS_INTERNAL_RESULT,pb.get(results[0]._id));

				 forward(INTERNAL_PAYMENT_JSP,request, response);
			 }

         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }


     /*
     Handles all POST requests.

     Checks to make sure the session is authenticated, that t and c are valid,
     and that all parameters exist for t and c.
     All subsequent post methods can assume that the above is already done.
     */
     public void doPost(HttpServletRequest request,
                                       HttpServletResponse response)
     {
		 //
		 //
		 //Temporary login stuff.  Remove when merged with TC site!
		 //
		 //
		 try {
			 String login = request.getParameter("login");

			 if (login != null) {
				 Navigation nav = new Navigation();
				 nav.setUserId(Integer.parseInt(login));
				 nav.setLoggedIn(true);
	             HttpSession session = request.getSession(true);
	             session.setAttribute(NAV_OBJECT_ATTR,nav);
				 doGet(request, response);
				 return;
			 }
		 } catch (Exception e) {
			 e.printStackTrace(); doError(request, response);
		 }
		 //
		 //
		 //End temporary login stuff.
		 //
		 //

	     if (!doAuthenticate(request, response)) return;

		 PrintWriter out=null;
		 String task=null;
		 String command=null;

         try {
			 out = response.getWriter();
         	 log.debug("doPost<br>");
         	 task = request.getParameter(TASK_STRING);
         	 command = request.getParameter(CMD_STRING);
         	 log.debug("t = " + task + "<br>");
         	 log.debug("c = " + command + "<br>");
	 	 } catch (Exception e) {
			 e.printStackTrace(); doError(request, response);
		 }

         if (task != null && command != null) {
			if (task.equals(ADD_TASK)) {
				if (command.equals(AFFIDAVIT_CMD)) {
					log.debug("checkParams<br>");
					doAddAffidavitPost(request, response);
					return;
				}
				if (command.equals(CONTRACT_CMD)) {
					log.debug("checkParams<br>");
					doAddContractPost(request, response);
					return;
				}
				if (command.equals(PAYMENT_CMD)) {
					log.debug("checkParams<br>");
					doAddPaymentPost(request, response);
					return;
				}
				if (command.equals(TAX_FORM_CMD)) {
					log.debug("checkParams<br>");
					doAddTaxFormPost(request, response);
					return;
				}
				if (command.equals(USER_TAX_FORM_CMD)) {
					log.debug("checkParams<br>");
					doAddUserTaxFormPost(request, response);
					return;
				}
				if (command.equals(NOTE_CMD)) {
					log.debug("checkParams<br>");
					doAddNotePost(request, response);
					return;
				}
				if (command.equals(NOTE_LINK_CMD)) {
					log.debug("checkParams<br>");
					doAddNoteLinkPost(request, response);
					return;
				}
				doGet(request, response);
				return;
			}
			if (task.equals(UPDATE_TASK)) {
				if (command.equals(AFFIDAVIT_CMD)) {
					log.debug("checkParams<br>");
					doUpdateAffidavitPost(request, response);
					return;
				}
				if (command.equals(CONTRACT_CMD)) {
					log.debug("checkParams<br>");
					doUpdateContractPost(request, response);
					return;
				}
				if (command.equals(PAYMENT_CMD)) {
					log.debug("checkParams<br>");
					doUpdatePaymentPost(request, response);
					return;
				}
				if (command.equals(TAX_FORM_CMD)) {
					log.debug("checkParams<br>");
					doUpdateTaxFormPost(request, response);
					return;
				}
				if (command.equals(USER_TAX_FORM_CMD)) {
					log.debug("checkParams<br>");
					doUpdateUserTaxFormPost(request, response);
					return;
				}
				doGet(request, response);
				return;
			}
		 }
		 doGet(request, response);
     }


     /*
     Forwarding JSP: "search.jsp"
     */
     private void doSearch(HttpServletRequest request,
                                         HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doSearch<br>");

			 forward(INTERNAL_SEARCH_JSP,request, response);
         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }


     /*
     Forwarding JSP: "search.jsp"
     */
     private void doSearchUsers(HttpServletRequest request,
                                         HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doSearchUsers<br>");

			 forward(INTERNAL_SEARCH_USERS_JSP,request, response);
         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }


     /*
     Forwarding JSP: "search.jsp"
     */
     private void doSearchPayments(HttpServletRequest request,
                                         HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doSearch<br>");

			 DataInterfaceBean dib = new DataInterfaceBean();
			 request.setAttribute(STATUS_CODE_LIST,dib.getStatusCodes(PAYMENT_OBJ).get(STATUS_CODE_LIST));
			 request.setAttribute(PAYMENT_TYPE_LIST,dib.getPaymentTypes().get(PAYMENT_TYPE_LIST));

			 forward(INTERNAL_SEARCH_PAYMENTS_JSP,request, response);
         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }

     /*
     Forwarding JSP: "search.jsp"
     */
     private void doSearchAffidavits(HttpServletRequest request,
                                         HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doSearch<br>");

			 DataInterfaceBean dib = new DataInterfaceBean();
			 request.setAttribute(STATUS_CODE_LIST,dib.getStatusCodes(AFFIDAVIT_OBJ).get(STATUS_CODE_LIST));
			 request.setAttribute(AFFIDAVIT_TYPE_LIST,dib.getAffidavitTypes().get(AFFIDAVIT_TYPE_LIST));
			 request.setAttribute(ROUND_LIST,dib.getRounds().get(ROUND_LIST));

			 forward(INTERNAL_SEARCH_AFFIDAVITS_JSP,request, response);
         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }

     /*
     Forwarding JSP: "search.jsp"
     */
     private void doSearchContracts(HttpServletRequest request,
                                         HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doSearch<br>");

			 DataInterfaceBean dib = new DataInterfaceBean();
			 request.setAttribute(STATUS_CODE_LIST,dib.getStatusCodes(CONTRACT_OBJ).get(STATUS_CODE_LIST));
			 request.setAttribute(CONTRACT_TYPE_LIST,dib.getContractTypes().get(CONTRACT_TYPE_LIST));

			 forward(INTERNAL_SEARCH_CONTRACTS_JSP,request, response);
         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }

     /*
     Forwarding JSP: "search.jsp"
     */
     private void doSearchTaxForms(HttpServletRequest request,
                                         HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doSearch<br>");

			 DataInterfaceBean dib = new DataInterfaceBean();
			 request.setAttribute(STATUS_CODE_LIST,dib.getStatusCodes(TAX_FORM_OBJ).get(STATUS_CODE_LIST));

			 forward(INTERNAL_SEARCH_TAX_FORMS_JSP,request, response);
         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }

     /*
     Forwarding JSP: "search.jsp"
     */
     private void doSearchUserTaxForms(HttpServletRequest request,
                                         HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doSearch<br>");

			 DataInterfaceBean dib = new DataInterfaceBean();
			 request.setAttribute(STATUS_CODE_LIST,dib.getStatusCodes(USER_TAX_FORM_OBJ).get(STATUS_CODE_LIST));

			 forward(INTERNAL_SEARCH_USER_TAX_FORMS_JSP,request, response);
         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }

     /*
     Forwarding JSP: "search.jsp"
     */
     private void doSearchNotes(HttpServletRequest request,
                                         HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doSearch<br>");

			 DataInterfaceBean dib = new DataInterfaceBean();
			 request.setAttribute(NOTE_TYPE_LIST,dib.getNoteTypes().get(NOTE_TYPE_LIST));

			 forward(INTERNAL_SEARCH_NOTES_JSP,request, response);
         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }

     /*
     This method gets the details for a tax form.

     Forwarding JSP: "viewTaxForm.jsp"
     */
     private void doTaxForm(HttpServletRequest request,
                                          HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doTaxForm<br>");

			 InternalDispatchTaxForm bean =
			 	new InternalDispatchTaxForm(request, response);
			 TaxForm results = bean.get();
			 request.setAttribute(PACTS_INTERNAL_RESULT,results);
			 forward(INTERNAL_TAX_FORM_JSP,request, response);

         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }

     /*
     This method gets a list of tax forms.

     Forwarding JSP: "taxFormList.jsp"
     */
     private void doTaxFormList(HttpServletRequest request,
                                              HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doTaxFormList<br>");

             InternalDispatchTaxFormList bean =
             	new InternalDispatchTaxFormList(request, response);
             TaxFormHeader[] results = bean.get();
             if (results.length != 1) {
				 request.setAttribute(PACTS_INTERNAL_RESULT,results);
             	 forward(INTERNAL_TAX_FORM_LIST_JSP,request, response);
			 }
			 else {
				 InternalDispatchTaxForm tfb = new InternalDispatchTaxForm(request, response);
				 request.setAttribute(PACTS_INTERNAL_RESULT,tfb.get(results[0]._id));
				 forward(INTERNAL_TAX_FORM_JSP,request, response);
			 }

         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }

     /*
     This method gets the details for a tax form.

     Forwarding JSP: "viewUserTaxForm.jsp"
     */
     private void doUserTaxForm(HttpServletRequest request,
                                          HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doUserTaxForm<br>");

			 InternalDispatchUserTaxForm bean =
			 	new InternalDispatchUserTaxForm(request, response);
			 TaxForm results = bean.get();
			 request.setAttribute(PACTS_INTERNAL_RESULT,results);

			 InternalDispatchNoteList nlb =
			 	new InternalDispatchNoteList(request, response);
			 NoteHeader[] notes = nlb.get(results._header._user._id);
			 request.setAttribute(NOTE_HEADER_LIST, notes);

			 forward(INTERNAL_USER_TAX_FORM_JSP,request, response);

         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }


     /*
     This method gets a list of tax forms.

     Forwarding JSP: "userTaxFormList.jsp"
     */
     private void doUserTaxFormList(HttpServletRequest request,
                                              HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doUserTaxFormList<br>");

			 InternalDispatchUserTaxFormList bean =
			 	new InternalDispatchUserTaxFormList(request, response);
			 TaxFormHeader[] results = bean.get();
			 if (results.length != 1) {
				 request.setAttribute(PACTS_INTERNAL_RESULT,results);

			 	 forward(INTERNAL_USER_TAX_FORM_LIST_JSP,request, response);
			 }
			 else {
				 InternalDispatchUserTaxForm utfb = new InternalDispatchUserTaxForm(request, response);
				 request.setAttribute(PACTS_INTERNAL_RESULT,utfb.get(results[0]._id,results[0]._user._id));

				 InternalDispatchNoteList nlb = new InternalDispatchNoteList(request, response);
				 Map search = new HashMap();
				 search.put(TAX_FORM_ID,""+results[0]._id);
				 search.put(TAX_FORM_USER_ID,""+results[0]._user._id);
				 request.setAttribute(NOTE_HEADER_LIST,nlb.get(search));

				 forward(INTERNAL_USER_TAX_FORM_JSP,request, response);
			 }

         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }


	/*
	Forwarding JSP: "updateAffidavit.jsp"
	*/
	private void doUpdateAffidavit(HttpServletRequest request,
						HttpServletResponse response)
	{
		try {
			PrintWriter out = response.getWriter();
			log.debug("doUpdateAffidavit<br>");

             InternalDispatchAffidavit bean =
             	new InternalDispatchAffidavit(request, response);
             Affidavit results = bean.get();
	         request.setAttribute(PACTS_INTERNAL_RESULT,results);

			 DataInterfaceBean dib = new DataInterfaceBean();
			 request.setAttribute(STATUS_CODE_LIST,dib.getStatusCodes(PactsConstants.AFFIDAVIT_OBJ).get(STATUS_CODE_LIST));
			 request.setAttribute(ROUND_LIST,dib.getRounds().get(ROUND_LIST));
			 request.setAttribute(AFFIDAVIT_TYPE_LIST,dib.getAffidavitTypes().get(AFFIDAVIT_TYPE_LIST));

			 forward(INTERNAL_UPDATE_AFFIDAVIT_JSP,request, response);

		} catch (Exception e) {
			e.printStackTrace(); doError(request, response);
		}
	}


	/*
	Forwarding JSP: "viewAffidavit.jsp"
	*/
	private void doUpdateAffidavitPost(HttpServletRequest request,
						HttpServletResponse response)
	{
		try {
			PrintWriter out = response.getWriter();
			log.debug("doUpdateAffidavitPost<br>");

             InternalDispatchAffidavit bean =
             	new InternalDispatchAffidavit(request, response);
             Affidavit affidavit = bean.get();

			 long round_id = Long.parseLong(request.getParameter("round_id"));

			 affidavit._roundID = round_id < 0 ? null : new Long(round_id);
			 affidavit._header._statusID = Integer.parseInt(request.getParameter("affidavit_status_id"));
			 affidavit._description = request.getParameter("affidavit_desc");
			 affidavit._header._typeID = Integer.parseInt(request.getParameter("affidavit_type_id"));
			 affidavit._header._notarized = makeBoolean(request.getParameter(IS_NOTARIZED));

			 DataInterfaceBean dib = new DataInterfaceBean();
			 dib.updateAffidavit(affidavit);

			 affidavit = bean.get();

	         request.setAttribute(PACTS_INTERNAL_RESULT,affidavit);

			 InternalDispatchNoteList notes =
			 	new InternalDispatchNoteList(request, response);
			 Map search = new HashMap();
			 search.put(AFFIDAVIT_ID,request.getParameter(AFFIDAVIT_ID));
			 request.setAttribute(NOTE_HEADER_LIST,notes.get(search));

			 forward(INTERNAL_AFFIDAVIT_JSP,request, response);

		} catch (Exception e) {
			e.printStackTrace(); doError(request, response);
		}
	}


	/*
	Forwarding JSP: "updateContract.jsp"
	*/
	private void doUpdateContract(HttpServletRequest request,
						HttpServletResponse response)
	{
		try {
			PrintWriter out = response.getWriter();
			log.debug("doUpdateContract<br>");

			InternalDispatchContract bean =
			   new InternalDispatchContract(request, response);
			Contract results = bean.get();
			request.setAttribute(PACTS_INTERNAL_RESULT,results);

			InternalDispatchText tb =
			   new InternalDispatchText(request, response);
			request.setAttribute("text",tb.get(results._header._id,CONTRACT_OBJ));

			DataInterfaceBean dib = new DataInterfaceBean();
			request.setAttribute(CONTRACT_TYPE_LIST,dib.getContractTypes().get(CONTRACT_TYPE_LIST));
			request.setAttribute(STATUS_CODE_LIST,dib.getStatusCodes(PactsConstants.CONTRACT_OBJ).get(STATUS_CODE_LIST));

			forward(INTERNAL_UPDATE_CONTRACT_JSP,request, response);

		} catch (Exception e) {
			e.printStackTrace(); doError(request, response);
		}
	}


	/*
	Forwarding JSP: "viewContract.jsp"
	*/
	private void doUpdateContractPost(HttpServletRequest request,
						HttpServletResponse response)
	{
		try {
			PrintWriter out = response.getWriter();
			log.debug("doUpdateContractPost<br>");

			 InternalDispatchContract bean =
			    new InternalDispatchContract(request, response);
			 Contract contract = bean.get();

             contract._header._name = request.getParameter("name");
			 contract._startDate = TCData.dateForm(request.getParameter("start_date"));
			 contract._endDate = TCData.dateForm(request.getParameter("end_date"));
			 contract._description = request.getParameter("contract_desc");
			 contract._header._statusId = Integer.parseInt(request.getParameter("status_id"));
			 contract._header._typeID = Integer.parseInt(request.getParameter("contract_type_id"));

             DataInterfaceBean dib = new DataInterfaceBean();
             dib.updateContract(contract);
			 dib.updateText(contract._header._id, CONTRACT_OBJ, request.getParameter("text"));

			 contract = bean.get();

			 request.setAttribute(PACTS_INTERNAL_RESULT,contract);

			 InternalDispatchNoteList nlb =
			 	new InternalDispatchNoteList(request, response);
			 Map search = new HashMap();
			 search.put(CONTRACT_ID,request.getParameter(CONTRACT_ID));
			 request.setAttribute(NOTE_HEADER_LIST,nlb.get(search));

			 forward(INTERNAL_CONTRACT_JSP,request, response);

		} catch (Exception e) {
			e.printStackTrace(); doError(request, response);
		}
	}


	/*
	Forwarding JSP: "updatePayment.jsp"
	*/
	private void doUpdatePayment(HttpServletRequest request,
						HttpServletResponse response)
	{
		try {
			PrintWriter out = response.getWriter();
			log.debug("doUpdatePayment<br>");

			InternalDispatchPayment bean =
				new InternalDispatchPayment(request, response);
			Payment results = bean.get();
			request.setAttribute(PACTS_INTERNAL_RESULT,results);

			DataInterfaceBean dib = new DataInterfaceBean();
			request.setAttribute(MODIFICATION_RATIONALE_LIST,dib.getModificationRationales().get(MODIFICATION_RATIONALE_LIST));
			request.setAttribute(PAYMENT_TYPE_LIST,dib.getPaymentTypes().get(PAYMENT_TYPE_LIST));
			request.setAttribute(STATUS_CODE_LIST,dib.getStatusCodes(PactsConstants.PAYMENT_OBJ).get(STATUS_CODE_LIST));

			forward(INTERNAL_UPDATE_PAYMENT_JSP,request, response);

		} catch (Exception e) {
			e.printStackTrace(); doError(request, response);
		}
	}


	/*
	Forwarding JSP: "viewPaymentAuditTrail.jsp"
	*/
	private void doUpdatePaymentPost(HttpServletRequest request,
						HttpServletResponse response)
	{
		try {
			PrintWriter out = response.getWriter();
			log.debug("doUpdatePaymentPost<br>");

			InternalDispatchPayment pb =
				new InternalDispatchPayment(request, response);
			Payment payment = pb.get();

			payment._header._description = request.getParameter("payment_desc");
			payment._header._typeID = Integer.parseInt(request.getParameter("payment_type_id"));
			payment._grossAmount = Double.parseDouble(request.getParameter("gross_amount"));
			payment._netAmount = Double.parseDouble(request.getParameter("net_amount"));
			payment._statusId = Integer.parseInt(request.getParameter("status_id"));
			payment._printDate = TCData.dateForm(request.getParameter("date_printed"));
			payment._payDate = TCData.dateForm(request.getParameter("date_paid"));
			payment._dueDate = TCData.dateForm(request.getParameter("date_due"));
			payment._rationaleId = Integer.parseInt(request.getParameter("modification_rationale_id"));

			DataInterfaceBean dib = new DataInterfaceBean();
			dib.updatePayment(payment);

			InternalDispatchNoteList nlb =
				new InternalDispatchNoteList(request, response);
			Map search = new HashMap();
			search.put(PAYMENT_ID,request.getParameter(PAYMENT_ID));
			request.setAttribute(NOTE_HEADER_LIST,nlb.get(search));

			InternalDispatchPaymentAuditTrail bean =
				new InternalDispatchPaymentAuditTrail(request, response);
			Payment[] results = bean.get();
			request.setAttribute(PACTS_INTERNAL_RESULT,results);

			forward(INTERNAL_PAYMENT_AUDIT_TRAIL_JSP,request, response);

		} catch (Exception e) {
			e.printStackTrace(); doError(request, response);
		}
	}


	/*
	Forwarding JSP: "updateTaxForm.jsp"
	*/
	private void doUpdateTaxForm(HttpServletRequest request,
						HttpServletResponse response)
	{
		try {
			PrintWriter out = response.getWriter();
			log.debug("doUpdateTaxForm<br>");

			InternalDispatchTaxForm bean =
			   new InternalDispatchTaxForm(request, response);
			TaxForm results = bean.get();
			request.setAttribute(PACTS_INTERNAL_RESULT,results);

			InternalDispatchText tb =
				new InternalDispatchText(request, response);
			request.setAttribute("text",tb.get(results._header._id, TAX_FORM_OBJ));

			DataInterfaceBean dib = new DataInterfaceBean();
			request.setAttribute(STATUS_CODE_LIST,dib.getStatusCodes(PactsConstants.TAX_FORM_OBJ).get(STATUS_CODE_LIST));

			forward(INTERNAL_UPDATE_TAX_FORM_JSP,request, response);

		} catch (Exception e) {
			e.printStackTrace(); doError(request, response);
		}
	}


	/*
	Forwarding JSP: "viewTaxForm.jsp"
	*/
	private void doUpdateTaxFormPost(HttpServletRequest request,
						HttpServletResponse response)
	{
		try {
			PrintWriter out = response.getWriter();
			log.debug("doUpdateTaxFormPost<br>");

			InternalDispatchTaxForm bean =
			   new InternalDispatchTaxForm(request, response);
			TaxForm taxForm = bean.get();

			taxForm._header._name = request.getParameter("name");
			taxForm._description = request.getParameter("tax_form_desc");
			taxForm._defaultWithholdingPercentage = Float.parseFloat(request.getParameter("default_withholding_percentage"));
			taxForm._defaultWithholdingAmount = Double.parseDouble(request.getParameter("default_withholding_amount"));
			taxForm._genericFormStatusID = Integer.parseInt(request.getParameter("status_id"));
			taxForm._defaultUsePercentage = makeBoolean(request.getParameter("default_use_percentage"));

			DataInterfaceBean dib = new DataInterfaceBean ();
			dib.updateTaxForm(taxForm);
			dib.updateText(taxForm._header._id, TAX_FORM_OBJ, request.getParameter("text"));

			taxForm = bean.get();

			request.setAttribute(PACTS_INTERNAL_RESULT,taxForm);

			forward(INTERNAL_TAX_FORM_JSP,request, response);

		} catch (Exception e) {
			e.printStackTrace(); doError(request, response);
		}
	}


	/*
	Forwarding JSP: "updateUserTaxForm.jsp"
	*/
	private void doUpdateUserTaxForm(HttpServletRequest request,
						HttpServletResponse response)
	{
		try {
			PrintWriter out = response.getWriter();
			log.debug("doUpdateUserTaxForm<br>");

			DataInterfaceBean dib = new DataInterfaceBean();
			request.setAttribute(STATUS_CODE_LIST,dib.getStatusCodes(PactsConstants.USER_TAX_FORM_OBJ).get(STATUS_CODE_LIST));

			InternalDispatchUserTaxForm bean =
				new InternalDispatchUserTaxForm(request, response);
			TaxForm results = bean.get();
			request.setAttribute(PACTS_INTERNAL_RESULT,results);

			forward(INTERNAL_UPDATE_USER_TAX_FORM_JSP,request, response);

		} catch (Exception e) {
			e.printStackTrace(); doError(request, response);
		}
	}


	/*
	Forwarding JSP: "viewUserTaxForm.jsp"
	*/
	private void doUpdateUserTaxFormPost(HttpServletRequest request,
						HttpServletResponse response)
	{
		try {
			PrintWriter out = response.getWriter();
			log.debug("doUpdateUserTaxFormPost<br>");

			InternalDispatchUserTaxForm bean =
				new InternalDispatchUserTaxForm(request, response);
			TaxForm userTaxForm = bean.get();

			userTaxForm._withholdingPercentage = Float.parseFloat(request.getParameter("withholding_percentage"));
			userTaxForm._withholdingAmount = Double.parseDouble(request.getParameter("withholding_amount"));
			userTaxForm._header._statusID = Integer.parseInt(request.getParameter("status_id"));
			userTaxForm._header._dateFiled = TCData.dateForm(request.getParameter("date_filed"));
			userTaxForm._usePercentage = makeBoolean(request.getParameter("use_percentage"));

			DataInterfaceBean dib = new DataInterfaceBean();
			dib.updateUserTaxForm(userTaxForm);

			userTaxForm = bean.get();

			request.setAttribute(PACTS_INTERNAL_RESULT,userTaxForm);

			 InternalDispatchNoteList notes =
			 	new InternalDispatchNoteList(request, response);
			 Map search = new HashMap();
			 search.put(TAX_FORM_ID,request.getParameter(TAX_FORM_ID));
			 search.put(TAX_FORM_USER_ID,request.getParameter(USER_ID));
			 request.setAttribute(NOTE_HEADER_LIST,notes.get(search));

			forward(INTERNAL_USER_TAX_FORM_JSP,request, response);

		} catch (Exception e) {
			e.printStackTrace(); doError(request, response);
		}
	}


     /*
     Forwarding JSP: "addNote.jsp"
     */
     private void doAddNote(HttpServletRequest request,
                                          HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doAddNote<br>");

             DataInterfaceBean dib = new DataInterfaceBean();
             request.setAttribute(NOTE_TYPE_LIST,dib.getNoteTypes().get(NOTE_TYPE_LIST));

			 forward(INTERNAL_ADD_NOTE_JSP,request, response);

         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }


     /*
     This method adds a note.

     Forwarding JSP: "viewNote.jsp"
     */
     private void doAddNotePost(HttpServletRequest request,
                                              HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doAddNotePost<br>");

             HttpSession session = request.getSession(true);
             Navigation nav = (Navigation) session.getAttribute(NAV_OBJECT_ATTR);

			 long user_id = nav.getUserId();

             Note n = new Note(
				 request.getParameter("text"),
				 Integer.parseInt(request.getParameter("note_type_id")),
				 user_id,
				 Long.parseLong(request.getParameter("user_id")));

			 DataInterfaceBean dib = new DataInterfaceBean();

			 long note_id = dib.addObjectNote(
				 Long.parseLong(request.getParameter("object_id")),
				 Integer.parseInt(request.getParameter("object_type")),
				 Long.parseLong(request.getParameter("tax_form_user_id")),
				 n);

			 InternalDispatchNote bean = new InternalDispatchNote(request, response);
			 n = bean.get(note_id);

			 request.setAttribute(PACTS_INTERNAL_RESULT,n);

			 forward(INTERNAL_NOTE_JSP,request, response);

         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }

     /*
     This method gets a list of items a note is attached to.

     Forwarding JSP: "comboList.jsp"
     */
     private void doComboList(HttpServletRequest request,
                                            HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doComboList<br>");

             InternalDispatchPactsEntryList bean =
             	new InternalDispatchPactsEntryList(request, response);

             PactsEntry[] results = bean.get();

             request.setAttribute(PACTS_INTERNAL_RESULT,results);

             forward(INTERNAL_COMBO_LIST_JSP,request, response);

         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }

     /*
     This method gets the details of a note.

     Forwarding JSP: "viewNote.jsp"
     */
     private void doNote(HttpServletRequest request,
                                       HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doNote<br>");

			 InternalDispatchNote bean = new InternalDispatchNote(request, response);
			 Note n = bean.get();

			 request.setAttribute(PACTS_INTERNAL_RESULT,n);

			 forward(INTERNAL_NOTE_JSP,request, response);


         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }


     /*
     This method gets a list of notes.

     Forwarding JSP: "noteList.jsp"
     */
     private void doNoteList(HttpServletRequest request,
                                           HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doNoteList<br>");

             InternalDispatchNoteList bean = new InternalDispatchNoteList(request, response);
			 NoteHeader[] n = bean.get();

			 if (n.length != 1) {
				 request.setAttribute(PACTS_INTERNAL_RESULT,n);

				 forward(INTERNAL_NOTE_LIST_JSP,request, response);
			 }
			 else {
				 InternalDispatchNote nb = new InternalDispatchNote(request, response);

				 request.setAttribute(PACTS_INTERNAL_RESULT,nb.get(n[0]._id));
				 forward(INTERNAL_NOTE_JSP, request, response);
			 }


         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }

     /*
     This method gets some text.

     Forwarding JSP: "viewText.jsp"
     */
     private void doText(HttpServletRequest request,
                                       HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doText<br>");

             InternalDispatchText bean = new InternalDispatchText(request, response);
             String text = bean.get();

             request.setAttribute(PACTS_INTERNAL_RESULT,text);

             forward(INTERNAL_TEXT_JSP,request, response);

         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }


     /*
     This method gets the details of a user.

     Forwarding JSP: "viewUser.jsp"
     */
     private void doUser(HttpServletRequest request,
                                       HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doUser<br>");

             InternalDispatchUserProfile bean = new InternalDispatchUserProfile(request, response);
             UserProfile u = bean.get();

			 InternalDispatchNoteList nlb =
			 	new InternalDispatchNoteList(request, response);
			 Map search = new HashMap();
			 search.put(USER_ID,request.getParameter(USER_ID));
			 request.setAttribute(NOTE_HEADER_LIST,nlb.get(search));

             request.setAttribute(PACTS_INTERNAL_RESULT,u);

             forward(INTERNAL_USER_JSP,request, response);

         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }


     /*
     This method gets a list of users.

     Forwarding JSP: "userList.jsp"
     */
     private void doUserList(HttpServletRequest request,
                                           HttpServletResponse response)
     {
         try {
             PrintWriter out = response.getWriter();
             log.debug("doUserList<br>");

             InternalDispatchUserProfileList bean = new InternalDispatchUserProfileList(request, response);
             UserProfileHeader[] u = bean.get();

             if (u.length != 1) {
				 request.setAttribute(PACTS_INTERNAL_RESULT,u);

	             forward(INTERNAL_USER_LIST_JSP,request, response);
			 }
			 else {
				 InternalDispatchUserProfile upb = new InternalDispatchUserProfile(request, response);
				 request.setAttribute(PACTS_INTERNAL_RESULT,upb.get(u[0]._id));

				 InternalDispatchNoteList nlb = new InternalDispatchNoteList(request, response);
				 Map search = new HashMap();
				 search.put(USER_ID,""+u[0]._id);
				 request.setAttribute(NOTE_HEADER_LIST,nlb.get(search));

				 forward(INTERNAL_USER_JSP,request, response);
			 }

         } catch (Exception e) {
             e.printStackTrace(); doError(request, response);
         }
     }

     /*
     Forwarding JSP: "addNoteLink.jsp"
     */
     private void doAddNoteLink(HttpServletRequest request,
     									HttpServletResponse response)
     {
		 try {
			 PrintWriter out = response.getWriter();
			 log.debug("doAddNoteLink<br>");

			 forward(INTERNAL_ADD_NOTE_LINK_JSP,request, response);
		 } catch (Exception e) {
			 e.printStackTrace(); doError(request, response);
		 }
	 }


     /*
     Forwarding JSP: "viewNote.jsp"
     */
     private void doAddNoteLinkPost(HttpServletRequest request,
     									HttpServletResponse response)
     {
		 try {
			 PrintWriter out = response.getWriter();
			 log.debug("doAddNoteLink<br>");

			 DataInterfaceBean dib = new DataInterfaceBean();

			 String tfuID = request.getParameter(TAX_FORM_USER_ID);
			 long user_id;
			 if (tfuID != null) user_id = Long.parseLong(tfuID);
			 else user_id = 0;

			 dib.addObjectNoteLink(
				 Long.parseLong(request.getParameter(OBJECT_ID)),
				 Integer.parseInt(request.getParameter(OBJECT_TYPE)),
				 user_id,
				 Long.parseLong(request.getParameter(NOTE_ID)));

			 InternalDispatchNote bean =
			 	new InternalDispatchNote(request, response);

			 request.setAttribute(PACTS_INTERNAL_RESULT,bean.get());

			 forward(INTERNAL_NOTE_JSP,request, response);
		 } catch (Exception e) {
			 e.printStackTrace(); doError(request, response);
		 }
	 }

	 private void doPayPayments(HttpServletRequest request,
	 								HttpServletResponse response)
	 {
		 try {
			 PrintWriter out = response.getWriter();
			 log.debug("doPayPayments<br>");

			 String[] values = request.getParameterValues(PAYMENT_ID);
			 long[] payments = new long[values.length];
			 for (int n = 0; n < values.length; n++) {
				 payments[n] = Long.parseLong(values[n]);
			 }

			 DataInterfaceBean dib = new DataInterfaceBean();

			 dib.markPaymentsPaid(payments);

			 request.setAttribute("message","Payments have been marked as Paid");
			 if (PAYMENT_UPDATE_FORWARD_OPTION == TO_QUERY_OPTION && request.getParameter("individual_payment") == null) forward(request.getParameter("query"), request, response);
			 else doError(request, response);


		 } catch (Exception e) {
			 e.printStackTrace(); doError(request, response);
		 }
	 }

	 private void doPrintPayments(HttpServletRequest request,
	 								HttpServletResponse response)
	 {
		 try {
			 HttpSession session = request.getSession(true);

			 DataInterfaceBean dib = new DataInterfaceBean();

			 String files[] = dib.printPayments();

			 log.debug("saved " + files.length + " files in the session");

			 session.setAttribute(PACTS_QUICKBOOKS_FILES,files);

			 String message = "<html><head><title>PACTS</title></head><body><h1>PACTS</h1><h2>Files</h2>\n";

			 String filename, ext, date;
			 Date d;
			 boolean includes_date;

			 if (files.length == 0) message = "Error: No Files!";

			 for (int fileNum = 0; fileNum < files.length; fileNum++) {
				if (FILES.length <= fileNum) filename = DEFAULT_FILE;
				else filename = FILES[fileNum];

				if (EXTS.length <= fileNum) ext = DEFAULT_EXT;
				else ext = EXTS[fileNum];

				if (INCLUDES_DATE.length <= fileNum) includes_date = DEFAULT_INCLUDES_DATE;
				else includes_date = INCLUDES_DATE[fileNum];

				if (includes_date) {
					d = new Date(System.currentTimeMillis());
					date = d.toString();
				    date = replaceInternal(date,":",".");
					filename += FILE_TOKEN + date;
				}
				filename += "." + ext;

				message += "<a href=\""+INTERNAL_SERVLET_URL+"?"+TASK_STRING;
				message += "="+PAYMENT_TASK+"&"+CMD_STRING+"="+FILE_CMD;
				message += "&file_num="+fileNum+"\">"+filename+"</a><br>\n";


		 	 }

			 message += "</body></html>";

			 request.setAttribute("message",message);
			 doError(request, response);
			 return;

		 } catch (Exception e) {
			 e.printStackTrace(); doError(request, response);
		 }
	 }

	 private void doPaymentStatus(HttpServletRequest request,
	 								HttpServletResponse response)
	 {
		 try {
			 PrintWriter out = response.getWriter();
			 log.debug("doPaymentStatus<br>");

			 String[] values = request.getParameterValues(PAYMENT_ID);
			 long[] payments = new long[values.length];
			 for (int n = 0; n < values.length; n++) {
				 payments[n] = Long.parseLong(values[n]);
			 }

			 DataInterfaceBean dib = new DataInterfaceBean();

			 dib.batchUpdatePaymentStatus(payments, Integer.parseInt(request.getParameter("status_id")));

			 request.setAttribute("message","Payments Being Updated in the Background");
			 if (PAYMENT_UPDATE_FORWARD_OPTION == TO_QUERY_OPTION) forward(request.getParameter("query"), request, response);
			 else doError(request, response);

		 } catch (Exception e) {
			 e.printStackTrace(); doError(request, response);
		 }
	 }

	 private void doReviewPayments(HttpServletRequest request,
	 								HttpServletResponse response)
	 {
		 try {
			 PrintWriter out = response.getWriter();
			 log.debug("doReviewPayments<br>");

			 String[] values = request.getParameterValues(PAYMENT_ID);
			 long[] payments = new long[values.length];
			 for (int n = 0; n < values.length; n++) {
				 payments[n] = Long.parseLong(values[n]);
			 }

			 DataInterfaceBean dib = new DataInterfaceBean();

			 dib.reviewPayments(payments);

			 request.setAttribute("message","Payments have been reviewed");
			 if (PAYMENT_UPDATE_FORWARD_OPTION == TO_QUERY_OPTION && request.getParameter("individual_payment") == null) forward(request.getParameter("query"), request, response);
			 else doError(request, response);

		 } catch (Exception e) {
			 e.printStackTrace(); doError(request, response);
		 }
	 }

	 private void doFile(HttpServletRequest request,
	 						HttpServletResponse response)
	 {
		 try {

			int fileNum = Integer.parseInt(request.getParameter("file_num"));
			HttpSession session = request.getSession(true);
			String[] files = (String[]) session.getAttribute(PACTS_QUICKBOOKS_FILES);
			if (files == null || files.length <= fileNum) {
				request.setAttribute("message","File not found");
				doError(request, response);
				return;
			}
			String mime_type, filename, ext, date;
			Date d;
			boolean includes_date;

			if (FILES.length <= fileNum) filename = DEFAULT_FILE;
			else filename = FILES[fileNum];

			if (EXTS.length <= fileNum) ext = DEFAULT_EXT;
			else ext = EXTS[fileNum];

			if (MIME_TYPES.length <= fileNum) mime_type = DEFAULT_MIME_TYPE;
			else mime_type = MIME_TYPES[fileNum];

			if (INCLUDES_DATE.length <= fileNum) includes_date = DEFAULT_INCLUDES_DATE;
			else includes_date = INCLUDES_DATE[fileNum];

			if (includes_date) {
				d = new Date(System.currentTimeMillis());
				date = d.toString();
				date = replaceInternal(date,":",".");
				filename += FILE_TOKEN + date;
			}
			filename += "." + ext;

			response.setContentType(mime_type);
			response.setHeader("Content-disposition",
			                   "attachment; filename=\"" +
			                   filename+"\"" );

			log.debug("filename is " + filename);

			 PrintWriter out = response.getWriter();
			 out.print(files[fileNum]);
			 return;

		 } catch (Exception e) {
			 e.printStackTrace(); doError(request, response);
		 }
	 }

};
