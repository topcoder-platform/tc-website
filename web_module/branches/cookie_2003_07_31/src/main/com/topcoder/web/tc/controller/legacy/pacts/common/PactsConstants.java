/**
 * Constants that are used throughout the PACTS system.
 *
 * @author  Dave Pecora
 * @version 1.00, 03/06/2002
 */
package com.topcoder.web.tc.controller.legacy.pacts.common;


public interface PactsConstants {
    // Object types
    // Coordinate with note_type_lu table in the DB
    public static final int USER_PROFILE_OBJ = 4;
    public static final int NOTE_OBJ = 6;
    public static final int AFFIDAVIT_OBJ = 51;
    public static final int CONTRACT_OBJ = 52;
    public static final int PAYMENT_OBJ = 53;
    public static final int TAX_FORM_OBJ = 55;
    public static final int USER_TAX_FORM_OBJ = 57;

    // Message Properties
    public static final String STATUS_PROPERTY = "status_id";
    public static final String USER_PROPERTY = "user_id";
    public static final String UPDATE_TYPE_PROPERTY = "update_type";

    // Types of updates that are queued
    public static final int REVIEW_UPDATE_TYPE = 1;
    public static final int STATUS_UPDATE_TYPE = 2;
    public static final int PAID_UPDATE_TYPE = 3;

    // Default email address to which update results should be mailed
    public static final String DEFAULT_STAFF_EMAIL = "grunt@topcoder.com";

    // Group ID codes
    public static final int TC_MEMBER = 10;
    public static final int TC_STAFF = 13;
    public static final int NON_EXISTENT_GROUP = -1;

    // Affidavit type codes
    public static final int CONTEST_WINNING_AFFIDAVIT = 1;

    // Payment type codes
    public static final int CONTEST_PAYMENT = 1;
    public static final int CONTRACT_PAYMENT = 2;
    public static final int PROBLEM_PAYMENT = 3;
    public static final int CODER_REFERRAL_PAYMENT = 4;

    // Contract type codes
    public static final int DEVELOPMENT_CONTRACT = 1;
    public static final int MAINTENANCE_CONTRACT = 2;
    public static final int PROBLEM_WRITER_CONTRACT = 3;
    public static final int PROBLEM_TESTER_CONTRACT = 4;

    // Modficiation rationale codes
    public static final int MODIFICATION_NEW = 1;
    public static final int MODIFICATION_STATUS = 8;

    // Referral type codes
    public static final int CODER_REFERRAL_TYPE = 40;

    // What percentage a referring coder gets for another's winnings
    public static final float REFERRAL_PERCENTAGE = 0.1F;

    // How long before a contest affidavit expires, in days
    public static final int AFFIDAVIT_EXPIRE_TIME = 60;

    // How long before a contest payment comes due, in days
    public static final int DUE_DATE_INTERVAL = 28;

    // Status of active coder in the user table
    public static final String ACTIVE_CODER_STATUS = "A";

    // How long database queries wait for a table lock to clear, in seconds
    // dpecora - This needs to be > than time to do a print payments, batch
    // review, batch mark paid, and generate round payments.  In stress tests
    // the first three tasks took 17, 11, and 20 seconds for 3000 payments,
    // while payment generation for a contest with 75 rooms took 24 seconds.
    // At the same time, this needs to be < than browser timeouts (when I tried,
    // Netscape died at 1 minute, IE at 2 minutes).  This value seems to be
    // a good compromise.
    public static final int LOCK_TIMEOUT_VALUE = 50;

    // Account names
    public static final String CONTEST_ACCOUNT = "Prize Money";
    public static final String CONTRACTOR_ACCOUNT = "IT:IT Salaries:Independent contractor work";
    public static final String PROBLEM_WRITER_TESTER_ACCOUNT =
            "IT:IT Salaries:Independent contractor work";
    public static final String CODER_REFERRAL_ACCOUNT = "Referral Commission";
    public static final String MAINTENANCE_ACCOUNT =
            "IT:IT Salaries:Independent contractor work:Maintenance Fee";
    public static final String PAYABLE_ACCOUNT = "Accounts Payable";
    public static final String WITHHOLDING_ACCOUNT = "Accrued Foreign Tax Withholding";

    // Contractor types
    public static final String CONTRACTOR_1099 = "1099 Contractor";
    public static final String CONTRACTOR_1042S = "1042S Contractor";

    // Tax form names of interest
    public static final String W9_TAX_FORM = "W-9";
    public static final String W8BEN_TAX_FORM = "W-8BEN";

    // Date format string - the database routines will expect date strings
    // in this format.  Matt and Sam - feel free to change this if you want
    // to use some other format on the front end.
    public static final String DATE_FORMAT_STRING = "MM/dd/yyyy";
    // Front-end default for dates that are not filled in
    public static final String EMPTY_DATE_STRING = "00/00/0000";
    // dpecora - Rather than have this constant I would prefer the data classes
    // to use the default EMPTY_DATE_STRING above, or null
    public static final String ANOTHER_EMPTY_DATE_STRING = "00/00/00";

    // Decimal Format string - monies should be displayed to the user in a
    // standard format.  MTM 6/5/02
    public static final String DECIMAL_FORMAT_STRING = "$ ############,##0.00";

    // These describe what is in a particular ResultSetContainer
    // dpecora 3/25 - this is a mess (mea culpa), so revised.  The old version
    // is commented out below

    // Affidavits
    public static final String AFFIDAVIT_HEADER_LIST = "affidavit_header_list";
    public static final String AFFIDAVIT_DETAIL = "affidavit_detail";
    // Contracts
    public static final String CONTRACT_HEADER_LIST = "contract_header_list";
    public static final String CONTRACT_DETAIL = "contract_detail";
    // User profiles
    public static final String USER_PROFILE_HEADER_LIST = "user_profile_header_list";
    public static final String USER_GROUP_LIST = "user_group_list";
    public static final String USER_PROFILE_DETAIL = "user_profile_detail";
    // Notes
    public static final String NOTE_HEADER_LIST = "note_header_list";
    public static final String NOTE_DETAIL = "note_detail";
    // Payments - note that details are also in a list, since a payment
    // can have multiple detail records
    public static final String PAYMENT_HEADER_LIST = "payment_header_list";
    public static final String PAYMENT_DETAIL_LIST = "payment_detail_list";
    public static final String CURRENT_CODER_ADDRESS = "current_coder_address";
    // Generic tax forms
    public static final String TAX_FORM_LIST = "tax_form_list";
    // User-specific tax forms
    public static final String USER_TAX_FORM_HEADER_LIST = "user_tax_form_header_list";
    public static final String USER_TAX_FORM_DETAIL = "user_tax_form_detail";
    // Code lookups
    public static final String AFFIDAVIT_TYPE_LIST = "affidavit_type_list";
    public static final String CONTRACT_TYPE_LIST = "contract_type_list";
    public static final String MODIFICATION_RATIONALE_LIST = "modification_rationale_list";
    public static final String NOTE_TYPE_LIST = "note_type_list";
    public static final String PAYMENT_TYPE_LIST = "payment_type_list";
    public static final String STATUS_CODE_LIST = "status_code_list";
    public static final String USER_TYPE_LIST = "user_type_list";
    // Miscellaneous
    public static final String TEXT = "text";
    public static final String ROUND_LIST = "round_list";
    public static final String USER_DEMOGRAPHICS = "user_demographics";
    public static final String ENTRY_HEADER_LIST = "entry_header_list";
    public static final String USER_CURRENT_SCHOOL = "user_current_school";

    /*
    public static final String AFFIDAVIT_DETAIL = "affidavit";
    public static final String CONTRACT = "contract";
    public static final String CONTRACT_HEADER = "contract_header";
    public static final String CONTRACT_DESC = "contract_desc";
    public static final String NOTE = "note";
    // Payments details come in a list
    public static final String PAYMENT_HEADER = "payment_header";
    public static final String AFFIDAVIT_HEADER = "affidavit_header";
    public static final String PAYMENT_DETAIL_HEADER_LIST = "payment_detail_header_list";
    public static final String PAYMENT_ADDRESS = "payment_address";
    public static final String PAYMENT_DETAIL = "payment_detail";
    public static final String PAYMENT_DETAIL_LIST = "payment_detail_list";
    public static final String USER_TAX_FORM = "tax_form";
    public static final String USER_PROFILE = "user_profile";
    public static final String USER_PROFILE_DETAIL = "user_profile_detail";
    public static final String USER_GROUP_LIST = "user_group_list";
    public static final String USER_HEADER_SUMMARY = "user_header_summary";
    public static final String USER_PROFILE_HEADER = "user_profile_header";

    public static final String AFFIDAVIT_HEADER_LIST = "affidavit_header_list";
    public static final String CONTRACT_HEADER_LIST = "contract_header_list";
    public static final String ENTRY_HEADER_LIST = "entry_header_list";
    public static final String NOTE_HEADER_LIST = "note_header_list";
    public static final String PAYMENT_HEADER_LIST = "payment_header_list";
    public static final String USER_TAX_FORM_HEADER_LIST = "tax_form_header_list";
    public static final String USER_PROFILE_HEADER_LIST = "user_profile_header_list";
    public static final String TEXT = "text";

    public static final String AFFIDAVIT_TYPE_LIST = "affidavit_type_list";
    public static final String CONTRACT_TYPE_LIST = "contract_type_list";
    public static final String PAYMENT_TYPE_LIST = "payment_type_list";
    public static final String NOTE_TYPE_LIST = "note_type_list";
    public static final String USER_TYPE_LIST = "user_type_list";
    public static final String MODIFICATION_RATIONALE_LIST = "modification_rationale_list";
    public static final String STATUS_CODE_LIST = "status_code_list";
    */

    // Criteria input types
    public static final int INTEGER = 1;
    public static final int DECIMAL = 2;
    public static final int BOOLEAN = 3;
    public static final int DATE = 4;
    public static final int STRING = 5;

    //status_id

    public static final int CONTRACT_INACTIVE_STATUS = 50;
    public static final int CONTRACT_ACTIVE_STATUS = 51;

    public static final int PRINTED_STATUS = 52;
    public static final int PAID_STATUS = 53;
    public static final int READY_TO_PRINT_STATUS = 54;
    public static final int PAYMENT_ON_HOLD_STATUS = 55;
    public static final int PAYMENT_OWED_STATUS = 56;
    public static final int PAYMENT_PENDING_STATUS = 64;
    public static final int PAYMENT_CANCELED_STATUS = 65;

    public static final int AFFIDAVIT_PENDING_STATUS = 57;
    public static final int AFFIDAVIT_AFFIRMED_STATUS = 58;
    public static final int AFFIDAVIT_EXPIRED_STATUS = 59;


    // Criteria descriptors
    // Shared across searches
    public static final String USER_ID = "user_id";
    public static final String STATUS_CODE = "status_code";
    public static final String TYPE_CODE = "type_code";
    public static final String EARLIEST_CREATION_DATE = "earliest_creation_date";
    public static final String LATEST_CREATION_DATE = "latest_creation_date";
    public static final String PAYMENT_ID = "payment_id";
    public static final String CONTRACT_ID = "contract_id";
    public static final String AFFIDAVIT_ID = "affidavit_id";
    public static final String TAX_FORM_ID = "tax_form_id";
    public static final String NOTE_ID = "note_id";
    public static final String HANDLE = "handle";

    // Payment searches
    public static final String EARLIEST_DUE_DATE = "earliest_due_date";
    public static final String LATEST_DUE_DATE = "latest_due_date";
    public static final String EARLIEST_PRINT_DATE = "earliest_print_date";
    public static final String LATEST_PRINT_DATE = "latest_print_date";
    public static final String EARLIEST_PAY_DATE = "earliest_pay_date";
    public static final String LATEST_PAY_DATE = "latest_pay_date";
    public static final String LOWEST_NET_AMOUNT = "lowest_net_amount";
    public static final String HIGHEST_NET_AMOUNT = "highest_net_amount";
    // public static final String PAYMENT_TYPE_CODE = "payment_type_code";
    public static final String IS_REVIEWED = "reviewed";

    // Affidavit searches
    public static final String IS_AFFIRMED = "is_affirmed";
    public static final String IS_NOTARIZED = "is_notarized";
    public static final String ROUND_ID = "round_id";

    // Contract searches
    public static final String EARLIEST_START_DATE = "earliest_start_date";
    public static final String LATEST_START_DATE = "latest_start_date";
    public static final String EARLIEST_END_DATE = "earliest_end_date";
    public static final String LATEST_END_DATE = "latest_end_date";
    // dpecora - these are duplicates of above start/end date searches
    // (EARLIEST_ACTIVE_DATE = LATEST_END_DATE, LATEST_ACTIVE_DATE = EARLIEST_START_DATE)
    // public static final String EARLIEST_ACTIVE_DATE = "earliest_active_date";
    // public static final String LATEST_ACTIVE_DATE = "latest_active_date";
    public static final String CONTRACT_NAME = "contract_name";

    // Tax form searches
    public static final String EARLIEST_DATE_FILED = "earliest_date_filed";
    public static final String LATEST_DATE_FILED = "latest_date_filed";
    public static final String LOWEST_WITHHOLDING_AMOUNT = "lowest_withholding_amount";
    public static final String HIGHEST_WITHHOLDING_AMOUNT = "highest_withholding_amount";
    public static final String LOWEST_WITHHOLDING_PERCENTAGE = "lowest_withholding_percentage";
    public static final String HIGHEST_WITHHOLDING_PERCENTAGE = "highest_withholding_percentage";

    // User searches
    public static final String FIRST_NAME = "first_name";
    public static final String MIDDLE_NAME = "middle_name";
    public static final String LAST_NAME = "last_name";
    public static final String HAS_ACTIVE_CONTRACTS = "has_active_contracts";
    public static final String HAS_PENDING_AFFIDAVITS = "has_pending_affidavits";
    public static final String HAS_TAX_FORMS_ON_FILE = "has_tax_forms_on_file";
    public static final String IS_OWED_MONEY = "is_owed_money";

    // Note searches
    public static final String SUBMITTING_USER_ID = "submitting_user_id";
    public static final String SUBMITTING_HANDLE = "submitting_handle";
    public static final String TAX_FORM_USER_ID = "tax_form_user_id";
    public static final String IN_DEPTH_HANDLE = "in_depth_handle";

    // servlet and jsps
    public static final String INTERNAL_JSP_DIR = "/pacts/internal";
    public static final String MEMBER_JSP_DIR = "/pacts/client/";
    public static final String MEMBER_SERVLET_URL = "PactsMemberServlet";

    public static final String INTERNAL_SERVLET_URL = "/PactsInternalServlet";
    public static final String LOGIN_URL = "/tc?&module=Login";
    public static final String TASK_STRING = "t";
    public static final String CMD_STRING = "c";
    public static final String NAV_OBJECT_ATTR = "navigation";
    public static final String TABLE_MODEL = "table_data";

    // affidavit member jsps
    public static final String AFFIDAVIT_TASK = "affidavit";
    public static final String AFFIDAVIT_HISTORY_CMD = "affidavit_history";
    public static final String AFFIDAVIT_PAYMENT_DETAILS_CMD = "affidavit_payment_details";
    public static final String AFFIDAVIT_DETAILS_CMD = "affidavit_details";
    public static final String AFFIRM_AFFIDAVIT_CMD = "affirm_affidavit";
    public static final String AFFIDAVIT_RENDER_CMD = "render_affidavit";
    public static final int INDIA_COUNTRY_CODE = 356;

    // contract member jsps
    public static final String CONTRACT_TASK = "contracts";
    public static final String CONTRACT_HISTORY_CMD = "contract_history";
    public static final String CONTRACT_PAYMENT_SUMMARY_CMD = "contract_pmt_sum";
    public static final String CONTRACT_PAYMENT_DETAILS_CMD = "contract_pmt_det";
    public static final String CONTRACT_DETAILS_CMD = "contract_details";

    // user profile member jsps
    public static final String USER_PROFILE_TASK = "user_profile";
    public static final String GET_USER_PROFILE_CMD = "get_profile";
    public static final String UPDATE_USER_PROFILE_CMD = "update_profile";

    // payment member jsps
    // NOTE: affidavidt and contracts have specialized payments
    public static final String PAYMENT_TASK = "payments";
    public static final String PAYMENT_HISTORY_CMD = "payment_history";
    public static final String PAYMENT_DETAILS_CMD = "payment_details";

    // tax form member jsps
    public static final String TAX_FORM_TASK = "tax_forms";
    public static final String TAX_FORM_HISTORY_CMD = "tax_forms_history";
    public static final String TAX_FORM_DETAILS_CMD = "tax_form_details";

    // member jsp session data contants
    public static final String AFFIDAVIT_ARRAY_DATA = "affidavit_array_data";
    public static final String AFFIDAVIT_DATA = "affidavit_data";
    public static final String AFFIDAVIT_HEADER_DATA = "affidavit_header_data";


    // internal tasks
    public static final String INPUT_TASK = "input";
    public static final String LIST_TASK = "list";
    public static final String VIEW_TASK = "view";
    public static final String ADD_TASK = "add";
    public static final String UPDATE_TASK = "update";
    public static final String RECONCILE_TASK = "reconcile";
    public static final String LOGOUT_TASK = "logout";
    public static final String SEARCH_TASK = "search";
    public static final String AFFIRM_TASK = "affirm";

    // internal commands
    public static final String SEARCH_CMD = "search";
    public static final String NOTE_CMD = "note";
    public static final String AFFIDAVIT_CMD = "affidavit";
    public static final String CONTRACT_CMD = "contract";
    public static final String PAYMENT_CMD = "payment";
    public static final String PAYMENT_AUDIT_TRAIL_CMD = "payment_audit_trail";
    public static final String USER_CMD = "user";
    public static final String TEXT_CMD = "text";
    public static final String COMBO_CMD = "combo";
    public static final String TAX_FORM_CMD = "tax_form";
    public static final String USER_TAX_FORM_CMD = "user_tax_form";
    public static final String NOTE_LINK_CMD = "note_link";
    public static final String PAID_CMD = "Mark Selected Payments Paid";
    public static final String PRINT_CMD = "print";
    public static final String REVIEW_CMD = "Review Selected Payments";
    public static final String STATUS_CMD = "Update Selected Payments' Status";
    public static final String FILE_CMD = "file";

    // internal parameters
    public static final String OBJECT_ID = "object_id";
    public static final String OBJECT_TYPE = "object_type";

    // request attributes
    public static final String PACTS_INTERNAL_RESULT = "pacts_internal_result";
    public static final String PACTS_MEMBER_RESULT = "pacts_member_result";

    // member jsp page names
    public static final String AFFIDAVIT_HISTORY_JSP = MEMBER_JSP_DIR + "AffidavitHistory.jsp";
    public static final String AFFIDAVIT_DETAILS_JSP = MEMBER_JSP_DIR + "AffidavitDetails.jsp";
    public static final String AFFIDAVIT_PAYMENT_DETAILS_JSP = MEMBER_JSP_DIR + "AffidavitPaymentDetails.jsp";
    public static final String CONTRACT_HISTORY_JSP = MEMBER_JSP_DIR + "ContractHistory.jsp";
    public static final String CONTRACT_PAYMENT_DETAILS_JSP = MEMBER_JSP_DIR + "ContractPaymentDetails.jsp";
    public static final String CONTRACT_PAYMENT_SUMMARY_JSP = MEMBER_JSP_DIR + "ContractPaymentSummary.jsp";
    public static final String CONTRACT_DETAILS_JSP = MEMBER_JSP_DIR + "ContractDetails.jsp";
    public static final String PAYMENT_HISTORY_JSP = MEMBER_JSP_DIR + "PaymentHistory.jsp";
    public static final String PAYMENT_DETAILS_JSP = MEMBER_JSP_DIR + "PaymentDetails.jsp";
    public static final String TAX_FORM_HISTORY_JSP = MEMBER_JSP_DIR + "TaxFormHistory.jsp";
    public static final String TAX_FORM_DETAILS_JSP = MEMBER_JSP_DIR + "TaxFormDetails.jsp";
    public static final String AFFIDAVIT_RENDER_JSP = MEMBER_JSP_DIR + "AffidavitRender.jsp";

    // internal jsp page names (and loccations)
    public static final String INTERNAL_SEARCH_JSP = INTERNAL_JSP_DIR + "/search.jsp";
    public static final String INTERNAL_SEARCH_USERS_JSP = INTERNAL_JSP_DIR + "/searchUsers.jsp";
    public static final String INTERNAL_SEARCH_PAYMENTS_JSP = INTERNAL_JSP_DIR + "/searchPayments.jsp";
    public static final String INTERNAL_SEARCH_AFFIDAVITS_JSP = INTERNAL_JSP_DIR + "/searchAffidavits.jsp";
    public static final String INTERNAL_SEARCH_CONTRACTS_JSP = INTERNAL_JSP_DIR + "/searchContracts.jsp";
    public static final String INTERNAL_SEARCH_TAX_FORMS_JSP = INTERNAL_JSP_DIR + "/searchTaxForms.jsp";
    public static final String INTERNAL_SEARCH_USER_TAX_FORMS_JSP = INTERNAL_JSP_DIR + "/searchUserTaxForms.jsp";
    public static final String INTERNAL_SEARCH_NOTES_JSP = INTERNAL_JSP_DIR + "/searchNotes.jsp";
    public static final String INTERNAL_AFFIDAVIT_LIST_JSP = INTERNAL_JSP_DIR + "/affidavitList.jsp";
    public static final String INTERNAL_PAYMENT_LIST_JSP = INTERNAL_JSP_DIR + "/paymentList.jsp";
    public static final String INTERNAL_CONTRACT_LIST_JSP = INTERNAL_JSP_DIR + "/contractList.jsp";
    public static final String INTERNAL_TAX_FORM_LIST_JSP = INTERNAL_JSP_DIR + "/taxFormList.jsp";
    public static final String INTERNAL_USER_LIST_JSP = INTERNAL_JSP_DIR + "/userList.jsp";
    public static final String INTERNAL_USER_TAX_FORM_LIST_JSP = INTERNAL_JSP_DIR + "/userTaxFormList.jsp";
    public static final String INTERNAL_NOTE_LIST_JSP = INTERNAL_JSP_DIR + "/noteList.jsp";
    public static final String INTERNAL_COMBO_LIST_JSP = INTERNAL_JSP_DIR + "/comboList.jsp";
    public static final String INTERNAL_NOTE_JSP = INTERNAL_JSP_DIR + "/viewNote.jsp";
    public static final String INTERNAL_USER_JSP = INTERNAL_JSP_DIR + "/viewUser.jsp";
    public static final String INTERNAL_TEXT_JSP = INTERNAL_JSP_DIR + "/viewText.jsp";
    public static final String INTERNAL_FOOTER_JSP = INTERNAL_JSP_DIR + "/InternalFooter.jsp";
    public static final String INTERNAL_AFFIDAVIT_JSP = INTERNAL_JSP_DIR + "/viewAffidavit.jsp";
    public static final String INTERNAL_PAYMENT_JSP = INTERNAL_JSP_DIR + "/viewPayment.jsp";
    public static final String INTERNAL_PAYMENT_AUDIT_TRAIL_JSP = INTERNAL_JSP_DIR + "/viewPaymentAuditTrail.jsp";
    public static final String INTERNAL_CONTRACT_JSP = INTERNAL_JSP_DIR + "/viewContract.jsp";
    public static final String INTERNAL_TAX_FORM_JSP = INTERNAL_JSP_DIR + "/viewTaxForm.jsp";
    public static final String INTERNAL_USER_TAX_FORM_JSP = INTERNAL_JSP_DIR + "/viewUserTaxForm.jsp";
    public static final String INTERNAL_ADD_AFFIDAVIT_JSP = INTERNAL_JSP_DIR + "/addAffidavit.jsp";
    public static final String INTERNAL_ADD_CONTRACT_JSP = INTERNAL_JSP_DIR + "/addContract.jsp";
    public static final String INTERNAL_ADD_TAX_FORM_JSP = INTERNAL_JSP_DIR + "/addTaxForm.jsp";
    public static final String INTERNAL_ADD_NOTE_JSP = INTERNAL_JSP_DIR + "/addNote.jsp";
    public static final String INTERNAL_ADD_USER_TAX_FORM_JSP = INTERNAL_JSP_DIR + "/addUserTaxForm.jsp";
    public static final String INTERNAL_ADD_PAYMENT_JSP = INTERNAL_JSP_DIR + "/addPayment.jsp";
    public static final String INTERNAL_ADD_NOTE_LINK_JSP = INTERNAL_JSP_DIR + "/addNoteLink.jsp";
    public static final String INTERNAL_UPDATE_AFFIDAVIT_JSP = INTERNAL_JSP_DIR + "/updateAffidavit.jsp";
    public static final String INTERNAL_UPDATE_CONTRACT_JSP = INTERNAL_JSP_DIR + "/updateContract.jsp";
    public static final String INTERNAL_UPDATE_TAX_FORM_JSP = INTERNAL_JSP_DIR + "/updateTaxForm.jsp";
    public static final String INTERNAL_UPDATE_USER_TAX_FORM_JSP = INTERNAL_JSP_DIR + "/updateUserTaxForm.jsp";
    public static final String INTERNAL_UPDATE_PAYMENT_JSP = INTERNAL_JSP_DIR + "/updatePayment.jsp";
    public static final String INTERNAL_AFFIRM_AFFIDAVIT_JSP = INTERNAL_JSP_DIR + "/affirmAffidavit.jsp";
    public static final String INTERNAL_ERROR_JSP = INTERNAL_JSP_DIR + "/error.jsp";

    /*
      veredox - Don't get your panties in a knot.
      This will not cause a Y2k+1 bug.
      Please see TCData.java for it's use.
      milo - It's ok, my panties are in tact. Thanks for the warning though.
    */
    public static final String YEAR_PREFIX = "20";

    //default add values
    // dpecora - I changed some of these to be consistent with status table
    public static final String DEFAULT_AFFIDAVIT_TYPE = "Contest Winning Affidavit";
    //public static final String DEFAULT_AFFIDAVIT_STATUS = "Inactive";
    public static final String DEFAULT_AFFIDAVIT_STATUS = "Pending";
    //public static final String DEFAULT_AFFIDAVIT_PAYMENT_STATUS = "Inactive";
    public static final String DEFAULT_AFFIDAVIT_PAYMENT_STATUS = "Pending";
    public static final String DEFAULT_AFFIDAVIT_PAYMENT_TYPE = "Contest Payment";
    public static final String DEFAULT_CONTRACT_PAYMENT_TYPE = "Contract Payment";
    public static final String DEFAULT_PAYMENT_TYPE = "Problem Payment";
    //public static final String DEFAULT_CONTRACT_PAYMENT_STATUS = "Inactive";
    //public static final String DEFAULT_PAYMENT_STATUS = "Inactive";
    public static final String DEFAULT_CONTRACT_PAYMENT_STATUS = "Pending";
    public static final String DEFAULT_PAYMENT_STATUS = "Pending";
    public static final String DEFAULT_CONTRACT_TYPE = "Problem Writer Contract";
    public static final String DEFAULT_CONTRACT_STATUS = "Inactive";
    public static final String DEFAULT_TAX_FORM_STATUS = "Inactive";
    public static final String DEFAULT_USER_TAX_FORM_STATUS = "Inactive";
    public static final String DEFAULT_USER_TAX_FORM = "W-9";
    public static final String DEFAULT_MODIFICATION_RATIONALE = "Status Change";
    public static final String DEFAULT_BATCH_STATUS = "Ready to Print";

    //Session attribute constants
    public static final String PACTS_QUICKBOOKS_FILES = "pacts_quickbooks_files";

    //File constants
    public static final String FILES[] = new String[]{"Payments File", "Vendor File"};
    public static final boolean INCLUDES_DATE[] = new boolean[]{true, true};
    public static final String EXTS[] = new String[]{"iif", "iif"};
    public static final String MIME_TYPES[] = new String[]{"application/quickbooks", "application/quickbooks"};
    public static final String FILE_TOKEN = " for ";
    public static final String FILE_DATE_FORMAT = "MM-dd-yyyy";

    //Default file constants
    public static final String DEFAULT_FILE = "filename";
    public static final String DEFAULT_MIME_TYPE = "text/plain";
    public static final String DEFAULT_EXT = "txt";
    public static final boolean DEFAULT_INCLUDES_DATE = false;

    //Forward options
    public static final int TO_QUERY_OPTION = 1;
    public static final int PAYMENT_UPDATE_FORWARD_OPTION = 0;

}

