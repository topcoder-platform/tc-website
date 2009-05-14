package com.topcoder.web.tc.controller.request;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.RowNotFoundException;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.CoderSessionInfo;
import com.topcoder.web.ejb.address.Address;
import com.topcoder.web.ejb.coder.Coder;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.jobposting.JobPostingServices;
import com.topcoder.web.ejb.phone.Phone;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.ejb.user.UserAddress;
import com.topcoder.web.ejb.user.UserPreference;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.JobHitData;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Map;

/**
 * User: dok
 * Date: Jul 28, 2004
 * Time: 5:47:07 PM
 */
public class JobHit extends Base {

    protected void businessProcessing() throws TCWebException {
        JobPostingServices jpServices = null;
        long jobId = 0;
        int hitType = 0;
        ArrayList jobHits = new ArrayList();


        try {
            if (!SecurityHelper.hasPermission(getLoggedInUser(), new ClassResource(this.getClass()))) {
                throw new PermissionException(getLoggedInUser(), new ClassResource(this.getClass()));
            }

            Enumeration parameterNames = getRequest().getParameterNames();
            while (parameterNames.hasMoreElements()) {
                String parameterName = parameterNames.nextElement().toString();
                String[] parameterValues = getRequest().getParameterValues(parameterName);
                if (parameterValues != null) {
                    String value = parameterValues[0];
                    value = (value == null ? "" : value.trim());

                    if (parameterName.equalsIgnoreCase(Constants.JOB_HIT_TYPE_PARAM)) {
                        hitType = (Integer.parseInt(value));
                    } else if (parameterName.equalsIgnoreCase(Constants.JOB_ID_PARAM)) {
                        jobId = (Long.parseLong(value));
                    } else if (parameterName.startsWith(Constants.JOB_HIT_PREFIX)) {
                        jobHits.add(new Long(parameterName.substring(Constants.JOB_HIT_PREFIX.length())));
                    }
                }
            }


            JobHitData hit = getData();
            getRequest().setAttribute("JobHitData", hit);

            if (log.isDebugEnabled()) {
                log.debug("user rating: " + hit.getRating());
            }
            jpServices = (JobPostingServices) BaseProcessor.createEJB(getInitialContext(), JobPostingServices.class);
            if (hitType == Constants.PLACEMENT_CLICK_THRU_ID) {
                if (jpServices.jobExists(jobId, DBMS.OLTP_DATASOURCE_NAME)) {
                    jpServices.addJobHit(hit.getUserId(), jobId, hitType, DBMS.OLTP_DATASOURCE_NAME);
                    SessionInfo sessionInfo = (SessionInfo)
                            getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);

                    UserPreference prefBean = (UserPreference) createEJB(getInitialContext(), UserPreference.class);
                    int flag = 0;
                    boolean isContractor = false;
                    boolean isPermanent = false;
                    try {
                        isContractor = Constants.PREFERENCE_CONTRACTING_TRUE ==
                                prefBean.getPreferenceValueID(hit.getUserId(),
                                        Constants.PREFERENCE_CONTRACTING, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                    } catch (RowNotFoundException e) {
                        flag++;
                    }
                    try {
                        isPermanent = Constants.PREFERENCE_PERMANENT_TRUE ==
                                prefBean.getPreferenceValueID(hit.getUserId(),
                                        Constants.PREFERENCE_PERMANENT, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                    } catch (RowNotFoundException e) {
                        flag++;
                    }

                    if (flag == 2) {
                        //they never signed up for placement
                        setNextPage(sessionInfo.getServletPath() +
                                "?" + Constants.MODULE_KEY + "=ContractingPreferences&" + Constants.MESSAGE +
                                "=" + Constants.JOB_HIT_MESSAGE_NOT_REGISTERED);

                    } else if (isContractor || isPermanent) {
                        //just have them confirm that their info is all set.
                        setNextPage(sessionInfo.getServletPath() +
                                "?" + Constants.MODULE_KEY + "=ContractingConfirm");
                    } else {
                        //they have choosen not to be available for placement
                        setNextPage(sessionInfo.getServletPath() +
                                "?" + Constants.MODULE_KEY + "=ContractingPreferences&" + Constants.MESSAGE +
                                "=" + Constants.JOB_HIT_MESSAGE_UN_REGISTERED);
                    }
                    setIsNextPageInContext(false);
                } else {
                    throw new Exception("job: " + jobId + " either doesn't exist or isn't active");
                }
            } else {
                //if (hit.isRated()) {
                //    if (hit.hasResume()) {
                        if (jobHits.size() > 0) {
                            for (int i = 0; i < jobHits.size(); i++) {
                                long currJob = ((Long) jobHits.get(i)).intValue();
                                try {
                                    if (jpServices.jobExists(currJob, DBMS.OLTP_DATASOURCE_NAME)) {
                                        jpServices.addJobHit(hit.getUserId(), currJob, Constants.JOB_POSTING_ID, DBMS.OLTP_DATASOURCE_NAME);
                                    } else {
                                        throw new Exception("job: " + currJob + " either doesn't exist or isn't active");
                                    }
                                } catch (Exception e) {
                                    throw new Exception("failed to add job hit for user: " + hit.getUserId() +
                                            " job: " + jobHits.get(i) +
                                            " hit type: " + Constants.JOB_POSTING_ID);
                                }
                            }
                            setNextPage(Constants.PROFILE_PAGE);
                            setIsNextPageInContext(true);
                        } else {
                            try {
                                if (jpServices.jobExists(jobId, DBMS.OLTP_DATASOURCE_NAME)) {
                                    jpServices.addJobHit(hit.getUserId(), jobId, hitType, DBMS.OLTP_DATASOURCE_NAME);
                                    if (hitType == Constants.CLICK_THRU_ID) {
                                        setNextPage(jpServices.getLink(jobId, DBMS.OLTP_DATASOURCE_NAME));
                                        setIsNextPageInContext(false);
                                    } else {
                                        setNextPage(Constants.PROFILE_PAGE);
                                        setIsNextPageInContext(true);
                                    }
                                } else {
                                    throw new Exception("job: " + jobId + " either doesn't exist or isn't active");
                                }
                            } catch (Exception e) {
                                throw new Exception("failed to add job hit for user: " + hit.getUserId() +
                                        " job: " + jobId +
                                        " hit type: " + Constants.JOB_POSTING_ID + "\n" + e.getMessage());
                            }
                        }
                //    } else {
                //        setNextPage(Constants.NO_RESUME_PAGE);
                //        setIsNextPageInContext(true);
                //    }
                //} else {
                //    setNextPage(Constants.UNRATED_PAGE);
                //    setIsNextPageInContext(true);
                //}
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }

    }


    private JobHitData getData() throws Exception {

        JobHitData ret = new JobHitData();
        Request dataRequest = new Request();
        dataRequest.setContentHandle("member_profile_info");
        dataRequest.setProperty("mid", "" + ret.getUserId());
        DataAccess data = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
        Map oltpMap = data.getData(dataRequest);
        ResultSetContainer profileInfo = (ResultSetContainer) oltpMap.get("TCES_Member_Profile");
        ResultSetContainer nextMatch = (ResultSetContainer) oltpMap.get("Next_SRM");

        data = new DataAccess(DBMS.DW_DATASOURCE_NAME);
        Map dwMap = data.getData(dataRequest);
        ResultSetContainer dwResult = (ResultSetContainer) dwMap.get("TCES_Coder_Stats");
        if (!dwResult.isEmpty()) {
            ret.setMostRecentEvent(dwResult.getItem(0, "last_rated_event").toString());
        }

        CoderSessionInfo info = (CoderSessionInfo) getSessionInfo();

        User userBean = (User) createEJB(getInitialContext(), User.class);
        Email emailBean = (Email) createEJB(getInitialContext(), Email.class);
        UserAddress userAddressBean = (UserAddress) createEJB(getInitialContext(), UserAddress.class);
        Address addressBean = (Address) createEJB(getInitialContext(), Address.class);
        Phone phoneBean = (Phone) createEJB(getInitialContext(), Phone.class);
        Coder coderBean = (Coder) createEJB(getInitialContext(), Coder.class);
/*
        CurrentSchool csBean = (CurrentSchool) createEJB(getInitialContext(), CurrentSchool.class);
*/

        ResultSetContainer addresses = userAddressBean.getUserAddresses(info.getUserId(), DBMS.JTS_OLTP_DATASOURCE_NAME);
        long addressId = addresses.getLongItem(0, "address_id");

        ret.setUserId(info.getUserId());
        ret.setRating(info.getRating());
        ret.setFirstName(userBean.getFirstName(info.getUserId(), DBMS.JTS_OLTP_DATASOURCE_NAME));
        ret.setLastName(userBean.getLastName(info.getUserId(), DBMS.JTS_OLTP_DATASOURCE_NAME));
        ret.setAddress1(addressBean.getAddress1(addressId, DBMS.JTS_OLTP_DATASOURCE_NAME));
        ret.setAddress2(addressBean.getAddress2(addressId, DBMS.JTS_OLTP_DATASOURCE_NAME));
        ret.setCity(addressBean.getCity(addressId, DBMS.JTS_OLTP_DATASOURCE_NAME));
        ret.setState(addressBean.getStateCode(addressId, DBMS.JTS_OLTP_DATASOURCE_NAME));
        ret.setZip(addressBean.getZip(addressId, DBMS.JTS_OLTP_DATASOURCE_NAME));
        ret.setCountry(addressBean.getCountryCode(addressId, DBMS.JTS_OLTP_DATASOURCE_NAME));
        ret.setPhone(phoneBean.getNumber(phoneBean.getPrimaryPhoneId(info.getUserId(), DBMS.JTS_OLTP_DATASOURCE_NAME), DBMS.JTS_OLTP_DATASOURCE_NAME));
        ret.setHandle(info.getHandle());
        ret.setEmail(emailBean.getAddress(emailBean.getPrimaryEmailId(info.getUserId(), DBMS.JTS_OLTP_DATASOURCE_NAME), DBMS.JTS_OLTP_DATASOURCE_NAME));
        int coderTypeId = coderBean.getCoderTypeId(info.getUserId(), DBMS.JTS_OLTP_DATASOURCE_NAME);
        ret.setCoderType(coderTypeId == 1 ? "Student" : "Professional");
        ret.setCoderTypeId(String.valueOf(coderBean.getCoderTypeId(info.getUserId(), DBMS.JTS_OLTP_DATASOURCE_NAME)));
        ret.setRated(isRated(info.getUserId()));
        if (!profileInfo.isEmpty()) {
            ret.setSchool(profileInfo.getItem(0, "school_name").toString());
            ret.setMemberSince(profileInfo.getItem(0, "member_since_date").toString());
        }
        if (!nextMatch.isEmpty()) {
            ret.setNextRoundId(((Long) nextMatch.getItem(0, "round_id").getResultData()).intValue());
            ret.setNextRoundName(nextMatch.getItem(0, "round_name").toString());
            ret.setNextContestId(((Long) nextMatch.getItem(0, "contest_id").getResultData()).intValue());
            ret.setNextContestName(nextMatch.getItem(0, "contest_name").toString());
        }

        dataRequest = new Request();
        dataRequest.setContentHandle("member_demographics");
        dataRequest.setProperty("mid", "" + ret.getUserId());
        data = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
        Map resultMap = data.getData(dataRequest);
        ResultSetContainer rsc = (ResultSetContainer) resultMap.get("TCES_Member_Demographics");


        ResultSetContainer.ResultSetRow qrListRow = null;

        for (int rowI = 0; rowI < rsc.getRowCount(); rowI++) {
            qrListRow = rsc.getRow(rowI);

            ret.addDemographic(qrListRow.getItem("demographic_question_text").toString(),
                    qrListRow.getItem("demographic_answer_text").toString());
        }


        ResumeServices rServices = null;
        try {
            rServices = (ResumeServices) BaseProcessor.createEJB(getInitialContext(), ResumeServices.class);
            ret.setHasResume(rServices.hasResume(ret.getUserId(), DBMS.OLTP_DATASOURCE_NAME));
        } catch (Exception e) {
            log.error("could not determine if user has a resume or not");
            throw e;
        }
        return ret;
    }


    private boolean isRated(long coderId) throws Exception {
        Request r = new Request();
        r.setContentHandle("coder_all_ratings");
        r.setProperty("cr", String.valueOf(coderId));
        CachedDataAccess da = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
        ResultSetContainer rsc = da.getData(r).get("coder_all_ratings");
        return !rsc.isEmpty() && rsc.getItem(0, "coder_id").getResultData() != null && (rsc.getIntItem(0, "algorithm_rating") > 0 ||
                rsc.getIntItem(0, "hs_algorithm_rating") > 0 || rsc.getIntItem(0, "marathon_match_rating") > 0 ||
                rsc.getIntItem(0, "design_rating") > 0 || rsc.getIntItem(0, "development_rating") > 0);
    }
}
