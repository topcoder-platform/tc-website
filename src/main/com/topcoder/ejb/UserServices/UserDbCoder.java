package com.topcoder.ejb.UserServices;

import com.topcoder.common.web.data.*;
import com.topcoder.common.web.error.TCException;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.address.Address;
import com.topcoder.web.ejb.address.AddressHome;
import com.topcoder.web.ejb.phone.Phone;
import com.topcoder.web.ejb.phone.PhoneHome;
import com.topcoder.web.ejb.user.UserAddress;
import com.topcoder.web.ejb.user.UserAddressHome;

import javax.naming.InitialContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;


final class UserDbCoder {
    private static Logger log = Logger.getLogger(UserDbCoder.class);
    private static final int ADDRESS_TYPE_ID = 2; //home
    private static final int DEFAULT_PHONE_TYPE_ID = 2;
    private static final int CODER_RATING_RANK_TYPE_ID = 2;

//                                 INSERT



    static void insertCoder(Connection conn, CoderRegistration coder)
            throws TCException {
        log.debug("ejb.User.UserDbCoder:insertCoder() called ...");
        boolean demogError = false;
        PreparedStatement ps = null;

        ArrayList demographicResponses = null;
//        ArrayList coderConfirmations = null;
        StringBuffer query = new StringBuffer(500);
        query.append(" INSERT INTO");
        query.append(" coder (");
        query.append(" coder_id");
        query.append(" ,first_name");
        query.append(" ,last_name");
        query.append(" ,middle_name");
        query.append(" ,address1");
        query.append(" ,address2");
        query.append(" ,city");
        query.append(" ,state_code");
        query.append(" ,country_code");
        query.append(" ,zip");
        query.append(" ,home_phone");
        query.append(" ,work_phone");
        query.append(" ,activation_code");
        query.append(" ,notify");
        query.append(" ,quote");
        query.append(" ,member_since");
        query.append(" ,editor_id");
        query.append(" ,language_id");
        query.append(" ,coder_type_id");
        query.append(" ,comp_country_code");
        query.append(" )");
        query.append(" VALUES (");
        query.append(" ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ");
        query.append(" ,CURRENT,");
        query.append(" ?, ?, ?, ?)");
        try {
            State states = coder.getHomeState();
            Country country = coder.getHomeCountry();
            Editor editorType = coder.getEditor();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, coder.getCoderId());
            ps.setString(2, coder.getFirstName());
            ps.setString(3, coder.getLastName());
            ps.setString(4, coder.getMiddleName());
            ps.setString(5, coder.getHomeAddress1());
            ps.setString(6, coder.getHomeAddress2());
            ps.setString(7, coder.getHomeCity());
            if (country.getCountryCode().equals("840")) {
                ps.setString(8, states.getStateCode());
            } else {
                ps.setNull(8, java.sql.Types.VARCHAR);
            }

            ps.setString(9, country.getCountryCode());
            ps.setString(10, coder.getHomeZip());
            ps.setString(11, coder.getHomePhone());
            ps.setString(12, coder.getWorkPhone());
            ps.setString(13, coder.getActivationCode());
            ps.setString(14, coder.getNotify());
            ps.setString(15, coder.getQuote());
            ps.setInt(16, editorType.getEditorId());
            ps.setInt(17, coder.getLanguage().getLanguageId());
            ps.setInt(18, coder.getCoderType().getCoderTypeId());
            ps.setString(19, coder.getCompCountry().getCountryCode());
            int RetVal = ps.executeUpdate();
            if (RetVal != 1) {
                throw new TCException(
                        "ejb.User.UserDbCoder:insertCoder():failed:\n"
                );
            }
            coder.getRating().setCoderId(coder.getCoderId());
            insertRating(conn, coder.getRating());

            ArrayList notifications = coder.getNotifications();
            if (notifications.size() == 0) {
                insertCoderNotify(conn, coder.getCoderId(), 0);
            } else {
                for (int i = 0; i < notifications.size(); i++) {
                    Notify notify = (Notify) notifications.get(i);
                    insertCoderNotify(conn, coder.getCoderId(), notify.getNotifyId());
                }
            }
            coder.getCoderReferral().setCoderId(coder.getCoderId());
            insertCoderReferral(conn, coder.getCoderReferral());
            coder.getCurrentSchool().setUserId(coder.getCoderId());
            if (coder.getCoderType().getCoderTypeId() == 1) //if they're a student
                insertCurrentSchool(conn, coder.getCurrentSchool());
            demographicResponses = coder.getDemographicResponses();
//            coderConfirmations = coder.getCoderConfirmations();
            HashSet qIdsForCoderType = getDemographicQuestionIds(conn, coder.getCoderType().getCoderTypeId());
            demogError = true;
            //int inserted = 0;
            for (int i = 0; i < demographicResponses.size(); i++) {
                DemographicResponse demographicResponse = (DemographicResponse) demographicResponses.get(i);
                if (qIdsForCoderType != null && qIdsForCoderType.contains(new Integer(demographicResponse.getDemographicQuestionId()))) {
                    demographicResponse.setCoderId(coder.getCoderId());
                    insertDemographicResponse(conn, demographicResponse);
                    //inserted++;
                } else {
                    if (qIdsForCoderType != null) {
                        demographicResponses.remove(i);
                        i--;
                    }
                }
            }
/*            for (int i = 0; i < coderConfirmations.size(); i++) {
                CoderConfirmation cc = (CoderConfirmation) coderConfirmations.get(i);
                cc.setCoderId(coder.getCoderId());
                insertCoderConfirmation(conn, (CoderConfirmation) coderConfirmations.get(i));
            }
*/
            InitialContext ctx = new InitialContext();
            Address addressEJB = ((AddressHome) ctx.lookup(AddressHome.EJB_REF_NAME)).create();
            Phone phoneEJB = ((PhoneHome) ctx.lookup(PhoneHome.EJB_REF_NAME)).create();
            UserAddress userAddressEJB = ((UserAddressHome) ctx.lookup(UserAddressHome.EJB_REF_NAME)).create();

            long addressId = addressEJB.createAddress(DBMS.COMMON_OLTP_DATASOURCE_NAME, DBMS.COMMON_OLTP_DATASOURCE_NAME);
            addressEJB.setAddress1(addressId, coder.getHomeAddress1(), DBMS.COMMON_OLTP_DATASOURCE_NAME);
            addressEJB.setAddress2(addressId, coder.getHomeAddress2(), DBMS.COMMON_OLTP_DATASOURCE_NAME);
            addressEJB.setCity(addressId, coder.getHomeCity(), DBMS.COMMON_OLTP_DATASOURCE_NAME);
            addressEJB.setStateCode(addressId, coder.getHomeState().getStateCode(), DBMS.COMMON_OLTP_DATASOURCE_NAME);
            addressEJB.setCountryCode(addressId, coder.getHomeCountry().getCountryCode(), DBMS.COMMON_OLTP_DATASOURCE_NAME);
            addressEJB.setZip(addressId, coder.getHomeZip(), DBMS.COMMON_OLTP_DATASOURCE_NAME);
            addressEJB.setAddressTypeId(addressId, ADDRESS_TYPE_ID, DBMS.COMMON_OLTP_DATASOURCE_NAME);

            userAddressEJB.createUserAddress(coder.getCoderId(), addressId, DBMS.COMMON_OLTP_DATASOURCE_NAME);

            long phoneId = phoneEJB.createPhone(coder.getCoderId(), DBMS.COMMON_OLTP_DATASOURCE_NAME, DBMS.COMMON_OLTP_DATASOURCE_NAME);
            phoneEJB.setNumber(phoneId, coder.getHomePhone(), DBMS.COMMON_OLTP_DATASOURCE_NAME);
            phoneEJB.setPrimaryPhoneId(coder.getCoderId(), phoneId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
            phoneEJB.setPhoneTypeId(phoneId, DEFAULT_PHONE_TYPE_ID, DBMS.COMMON_OLTP_DATASOURCE_NAME);

            //if ( inserted != qIdsForCoderType.size() ) throw new TCException ( "INCORRECT NUMBER OF DEMOG INFO INSERTED!!!" );
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException(sqe.getMessage());
        } catch (Exception ex) {
            ex.printStackTrace();
            if (demogError) {
                demographicResponses = coder.getDemographicResponses();
                XMLDocument err = new XMLDocument("DEMOG_ERROR_FULL_LIST");
                try {
                    err.addTag(RecordTag.getListXML("DEMOGS", demographicResponses));
                } catch (Exception ignore) {
                }
                log.debug(err.getXML(2));
            }
            StringBuffer msg = new StringBuffer(300);
            msg.append("ejb.User.UserDbCoder:insertCoder:");
            msg.append("coderId=");
            msg.append(coder.getCoderId());
            msg.append(":failed:\n");
            msg.append(ex);
            throw new TCException(msg.toString());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
        }
    }

    private static void insertCoderReferral(Connection conn, CoderReferral coderReferral) throws TCException {
        log.debug("ejb.User.UserDbCoder:insertCoderReferral():called.");
        PreparedStatement ps = null;
        String query = "INSERT INTO coder_referral (coder_id, referral_id, reference_id, other) VALUES (?, ?, ?, ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, coderReferral.getCoderId());
            ps.setInt(2, coderReferral.getReferral().getReferralId());
            ps.setInt(3, coderReferral.getReferenceId());
            ps.setString(4, coderReferral.getOther());
            int RetVal = ps.executeUpdate();
            coderReferral.setModified("S");
        } catch (SQLException sqe) {
            log.debug("coder id: " + coderReferral.getCoderId());
            DBMS.printSqlException(true, sqe);
            throw new TCException(sqe.getMessage());
        } catch (Exception ex) {
            log.debug("coder id: " + coderReferral.getCoderId());
            StringBuffer msg = new StringBuffer(500);
            msg.append("ejb.User.UserDbCoder:insertCoderReferral():");
            if (coderReferral != null) {
                XMLDocument errDoc = new XMLDocument("ERROR");
                try {
                    errDoc.addTag(coderReferral.getXML());
                } catch (Exception ignore) {
                }
                msg.append(errDoc.getXML());
            }
            msg.append("\nfailed:\n");
            msg.append(ex);
            throw new TCException(msg.toString());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
        }
    }


    private static void insertCoderNotify(Connection conn, int coderId, int notifyId) throws TCException {
        log.debug("ejb.User.UserDbCoder:insertCoderNotify():called. coder: " + coderId + " notify: " + notifyId);
        PreparedStatement ps = null;
        String query = "INSERT INTO coder_notify (coder_id, notify_id) VALUES (?, ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, coderId);
            ps.setInt(2, notifyId);
            ps.executeUpdate();
        } catch (SQLException sqe) {
            log.debug("coder id: " + coderId);
            DBMS.printSqlException(true, sqe);
            throw new TCException(sqe.getMessage());
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new TCException(ex.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
        }
    }


    private static void insertCurrentSchool(Connection conn, School currentSchool) throws TCException {
        log.debug("ejb.User.UserDbCoder:insertCurrentSchool():called.");
        PreparedStatement ps = null;
        String query = "INSERT INTO current_school(coder_id, school_id, school_name, gpa, gpa_scale, viewable)" +
                " VALUES (?, ?, ?, ?, ?, ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, currentSchool.getUserId());
            ps.setInt(2, currentSchool.getSchoolId());
            ps.setString(3, currentSchool.getName());
            if (currentSchool.getGpa() > 0 || currentSchool.getGpaScale() > 0) {
                ps.setFloat(4, currentSchool.getGpa());
                ps.setFloat(5, currentSchool.getGpaScale());
            } else {
                ps.setNull(4, Types.FLOAT);
                ps.setNull(5, Types.FLOAT);
            }
            ps.setInt(6, currentSchool.isViewable()?1:0);
            int RetVal = ps.executeUpdate();
            currentSchool.setModified("S");
        } catch (SQLException sqe) {
            log.debug("coder id: " + currentSchool.getUserId());
            DBMS.printSqlException(true, sqe);
            throw new TCException(sqe.getMessage());
        } catch (Exception ex) {
            log.debug("coder id: " + currentSchool.getUserId());
            StringBuffer msg = new StringBuffer(500);
            msg.append("ejb.User.UserDbCoder:insertCurrentSchool():");
            if (currentSchool != null) {
                XMLDocument errDoc = new XMLDocument("ERROR");
                try {
                    errDoc.addTag(currentSchool.getXML());
                } catch (Exception ignore) {
                }
                msg.append(errDoc.getXML());
            }
            msg.append("\nfailed:\n");
            msg.append(ex);
            throw new TCException(msg.toString());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
        }
    }


    private static void insertRating(Connection conn, Rating rating)
            throws TCException {
        log.debug("ejb.User.UserDbCoder:insertRating() called ...");
        PreparedStatement ps = null;
        StringBuffer query = new StringBuffer(250);
        query.append(" INSERT");
        query.append(" INTO");
        query.append(" rating (");
        query.append(" coder_id");
        query.append(" ,round_id");
        query.append(" ,rating");
        query.append(" ,last_rated_event");
        query.append(" ,num_ratings");
        query.append(" )");
        query.append(" VALUES (");
        query.append(" ?, ?, ?, ?, ?");
        query.append(" )");
        try {
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, rating.getCoderId());
            ps.setInt(2, rating.getRoundId());
            ps.setInt(3, rating.getRating());
            if (rating.getLastRatedEvent() == null) {
                ps.setNull(4, java.sql.Types.DATE);
            } else {
                ps.setDate(4, rating.getLastRatedEvent());
            }
            ps.setInt(5, rating.getNumRatings());
            int RetVal = ps.executeUpdate();
            if (RetVal != 1) {
                throw new TCException("ejb.User.UserDbCoder:insertRating():failed.");
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException(sqe.getMessage());
        } catch (Exception ex) {
            StringBuffer msg = new StringBuffer(300);
            msg.append("ejb.User.UserDbCoder:insertRating:");
            msg.append("coderId=");
            msg.append(rating.getCoderId());
            msg.append(":failed:\n");
            msg.append(ex);
            throw new TCException(msg.toString());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
        }
    }


    private static void insertDemographicResponse(Connection conn, DemographicResponse demographicResponse)
            throws TCException {
        log.debug("ejb.User.UserDbCoder:insertDemographicResponse():called.");
        PreparedStatement ps = null;
        /**************************************************************/
        StringBuffer query = new StringBuffer(200);
        query.append(" INSERT");
        query.append(" INTO");
        query.append(" demographic_response (");
        query.append(" coder_id");
        query.append(" ,demographic_question_id");
        query.append(" ,demographic_answer_id");
        query.append(" ,demographic_response");
        query.append(" )");
        query.append(" VALUES ( ?, ?, ?, ? )");
        /**************************************************************/
        try {
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, demographicResponse.getCoderId());
            ps.setInt(2, demographicResponse.getDemographicQuestionId());
            ps.setInt(3, demographicResponse.getDemographicAnswerId());
            ps.setString(4, demographicResponse.getDemographicResponseText());
            int RetVal = ps.executeUpdate();
        } catch (SQLException sqe) {
            XMLDocument err = new XMLDocument("INSERT_DEMO_RESPONSE_ERROR");
            try {
                err.addTag(demographicResponse.getXML());
            } catch (Exception ignore) {
            }
            log.debug(err.getXML(2));
            DBMS.printSqlException(true, sqe);
            throw new TCException(sqe.getMessage());
        } catch (Exception ex) {
            StringBuffer msg = new StringBuffer(500);
            msg.append("ejb.User.UserDbCoder:insertDemographicResponse():");
            if (demographicResponse != null) {
                XMLDocument errDoc = new XMLDocument("ERROR");
                try {
                    errDoc.addTag(demographicResponse.getXML());
                } catch (Exception ignore) {
                }
                msg.append(errDoc.getXML());
            }
            msg.append("\nfailed:\n");
            msg.append(ex);
            throw new TCException(msg.toString());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
        }
    }


    /**
     * Method to add a confirmation codes for this coder.
     */
/*
    private static void insertCoderConfirmation(Connection conn, CoderConfirmation coderConfirmation)
            throws TCException {
        log.debug("ejb.User.UserDbCoder:insertCoderConfirmation() called ...");
        log.debug(" coder: " + coderConfirmation.getCoderId() +
                " contest: " + coderConfirmation.getContestId() +
                " code: " + coderConfirmation.getCode());
        PreparedStatement ps = null;
        StringBuffer query = new StringBuffer(250);
        query.append(" INSERT");
        query.append(" INTO coder_confirmation (");
        query.append(" coder_id");
        query.append(" ,contest_id");
        query.append(" ,code)");
        query.append(" VALUES (?,?,?)");
        try {
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, coderConfirmation.getCoderId());
            ps.setInt(2, coderConfirmation.getContestId());
            ps.setString(3, coderConfirmation.getCode());
            int RetVal = ps.executeUpdate();
            if (RetVal != 1) {
                throw new TCException("ejb.User.UserDbCoder:insertRating():failed.");
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException(sqe.getMessage());
        } catch (Exception ex) {
            StringBuffer msg = new StringBuffer(300);
            msg.append("ejb.User.UserDbCoder:insertCoderConfirmation:");
            msg.append("coderId=" + coderConfirmation.getCoderId());
            msg.append(":failed:\n" + ex.getMessage());
            throw new TCException(msg.toString());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
        }
    }
*/


//                                 UPDATE








    static void updateCoder(Connection conn, CoderRegistration coder)
            throws TCException {
        log.debug("ejb.User.UserDbCoder:updateCoder() called...");
        PreparedStatement ps = null;
        try {
            if (coder.getModified().equals("A")) {
                insertCoder(conn, coder);
            } else {
                if (coder.getModified().equals("U")) {
                    StringBuffer query = new StringBuffer(540);
                    query.append(" UPDATE");
                    query.append(" coder");
                    query.append(" SET ");
                    query.append(" first_name=?");
                    query.append(" ,last_name=?");
                    query.append(" ,middle_name=?");
                    query.append(" ,address1=?");
                    query.append(" ,address2=?");
                    query.append(" ,city=?");
                    query.append(" ,state_code=?");
                    query.append(" ,country_code=?");
                    query.append(" ,zip=?");
                    query.append(" ,work_phone=?");
                    query.append(" ,home_phone=?");
                    query.append(" ,activation_code=?");
                    query.append(" ,notify=?");
                    query.append(" ,quote=?");
                    query.append(" ,editor_id=?");
                    query.append(" ,language_id=?");
                    query.append(" ,coder_type_id=?");
                    query.append(" ,comp_country_code=?");
                    query.append(" WHERE");
                    query.append(" coder_id=?");
                    State state = coder.getHomeState();
                    Country country = coder.getHomeCountry();
                    Editor editorType = coder.getEditor();
                    ps = conn.prepareStatement(query.toString());
                    ps.setString(1, coder.getFirstName());
                    ps.setString(2, coder.getLastName());
                    ps.setString(3, coder.getMiddleName());
                    ps.setString(4, coder.getHomeAddress1());
                    ps.setString(5, coder.getHomeAddress2());
                    ps.setString(6, coder.getHomeCity());
                    if (country.getCountryCode().equals("840")) {
                        ps.setString(7, state.getStateCode());
                    } else {
                        ps.setNull(7, java.sql.Types.VARCHAR);
                    }
                    ps.setString(8, country.getCountryCode());
                    ps.setString(9, coder.getHomeZip());
                    ps.setString(10, coder.getWorkPhone());
                    ps.setString(11, coder.getHomePhone());
                    ps.setString(12, coder.getActivationCode());
                    ps.setString(13, coder.getNotify());
                    ps.setString(14, coder.getQuote());
                    ps.setInt(15, editorType.getEditorId());
                    ps.setInt(16, coder.getLanguage().getLanguageId());
                    ps.setInt(17, coder.getCoderType().getCoderTypeId());
                    ps.setString(18, coder.getCompCountry().getCountryCode());
                    ps.setInt(19, coder.getCoderId());
                    int RetVal = ps.executeUpdate();
                    if (RetVal != 1) {
                        throw new TCException(
                                "ejb.User.UserDbCoder:updateCoder():did not update record:\n"
                        );
                    }
                }
                updateRating(conn, coder.getRating());
/*
        ArrayList schools = coder.getSchools();
        if (schools.size() > 0)  {
          updateSchools(conn, schools);
        }
        ArrayList educations = coder.getEducations();
        if (educations.size() > 0)  {
          updateCoderEducations(conn, educations);
        }
        ArrayList skills = coder.getSkills();
        if (skills.size() > 0)  {
          updateCoderSkills(conn, skills);
        }
        ArrayList experiences = coder.getExperiences();
        if (experiences.size() > 0)  {
          updateExperiences(conn, experiences);
        }
*/
                updateCoderNotify(conn, coder);
                updateCoderReferral(conn, coder.getCoderReferral());
                if (coder.getCoderType().getCoderTypeId() == 1) //if they're a student
                    updateCurrentSchool(conn, coder.getCurrentSchool());
                ArrayList demographicResponses = coder.getDemographicResponses();
                updateDemographicResponses(conn, coder.getCoderType().getCoderTypeId(), demographicResponses);
//                updateCoderConfirmations(conn, coder.getCoderConfirmations());

                InitialContext ctx = new InitialContext();
                Address addressEJB = ((AddressHome) ctx.lookup(AddressHome.EJB_REF_NAME)).create();
                Phone phoneEJB = ((PhoneHome) ctx.lookup(PhoneHome.EJB_REF_NAME)).create();
                UserAddress userAddressEJB = ((UserAddressHome) ctx.lookup(UserAddressHome.EJB_REF_NAME)).create();

                ResultSetContainer addresses = userAddressEJB.getUserAddresses(coder.getCoderId(), DBMS.COMMON_OLTP_DATASOURCE_NAME);

                if (addresses.size() != 1) {
                    log.warn("Not sure what to do, user: " + coder.getCoderId() +
                            " does not have one address, they have " + addresses.size());
                } else {
                    long addressId = ((Long) addresses.getItem(0, "address_id").getResultData()).longValue();
                    addressEJB.setAddress1(addressId, coder.getHomeAddress1(), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                    addressEJB.setAddress2(addressId, coder.getHomeAddress2(), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                    addressEJB.setCity(addressId, coder.getHomeCity(), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                    addressEJB.setStateCode(addressId, coder.getHomeState().getStateCode(), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                    addressEJB.setCountryCode(addressId, coder.getHomeCountry().getCountryCode(), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                    addressEJB.setZip(addressId, coder.getHomeZip(), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                    addressEJB.setAddressTypeId(addressId, ADDRESS_TYPE_ID, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                }

                long phoneId = phoneEJB.getPrimaryPhoneId(coder.getCoderId(), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                phoneEJB.setNumber(phoneId, coder.getHomePhone(), DBMS.COMMON_OLTP_DATASOURCE_NAME);

            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException(sqe.getMessage());
        } catch (Exception ex) {
            ex.printStackTrace();
            StringBuffer msg = new StringBuffer(300);
            msg.append("ejb.User.UserDbCoder:updateCoder:");
            msg.append("coderId=");
            msg.append(coder.getCoderId());
            msg.append(":failed:\n");
            msg.append(ex);
            throw new TCException(msg.toString());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
        }
    }


    private static void updateCoderNotify(Connection conn, Coder coder) throws TCException {
        log.debug("ejb.User.UserDbCoder:updateCoderNotify():called.");
        PreparedStatement ps = null;
        try {
            /**************************************************************/
            String query = "DELETE FROM coder_notify WHERE coder_id = ?";
            /**************************************************************/
            ps = conn.prepareStatement(query);
            ps.setInt(1, coder.getCoderId());
            ps.executeUpdate();
            ArrayList notifications = coder.getNotifications();
            if (notifications.size() == 0) {
                insertCoderNotify(conn, coder.getCoderId(), 0);
            } else {
                for (int i = 0; i < notifications.size(); i++) {
                    Notify notify = (Notify) notifications.get(i);
                    if (notify.getNotifyId() != 0) {
                        insertCoderNotify(conn, coder.getCoderId(), notify.getNotifyId());
                    }
                }
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException(sqe.getMessage());
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new TCException("ejb.User.UserDbCoder:updateCoderReferral:ERROR:" + ex);
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
        }
    }


    private static void updateCoderReferral(Connection conn, CoderReferral coderReferral)
            throws TCException {
        log.debug("ejb.User.UserDbCoder:updateCoderReferral():called.");
        PreparedStatement ps = null;
        try {
            String modifiedFlag = coderReferral.getModified();
            if (modifiedFlag.equals("A") && coderReferral.getReferral().getReferralId() != 0) {
                insertCoderReferral(conn, coderReferral);
            } else if (modifiedFlag.equals("U")) {
                /**************************************************************/
                String query = "UPDATE coder_referral SET reference_id = ?, referral_id=?, other=? WHERE coder_id=?";
                /**************************************************************/
                ps = conn.prepareStatement(query);
                ps.setInt(1, coderReferral.getReferenceId());
                ps.setInt(2, coderReferral.getReferral().getReferralId());
                ps.setString(3, coderReferral.getOther());
                ps.setInt(4, coderReferral.getCoderId());
                int retVal = ps.executeUpdate();
                if (retVal != 1) {
                    log.error("coder: "
                            + coderReferral.getCoderId() + "  referralId: "
                            + coderReferral.getReferral().getReferralId() + "  reference: "
                            + coderReferral.getReferenceId());
                    throw new TCException("ejb.User.UserDbCoder:updateCoderReferral:update errror: " + retVal);
                }
                coderReferral.setModified("S");
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException(sqe.getMessage());
        } catch (Exception ex) {
            throw new TCException(
                    "ejb.User.UserDbCoder:updateCoderReferral:ERROR:" + ex
            );
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
        }
    }


    private static void updateCurrentSchool(Connection conn, School currentSchool)
            throws TCException {
        log.debug("ejb.User.UserDbCoder:updateCurrentSchool():called.");
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            /**************************************************************/
            String query = "SELECT 1 FROM current_school WHERE coder_id=?";
            /**************************************************************/
            ps = conn.prepareStatement(query);
            ps.setInt(1, currentSchool.getUserId());
            rs = ps.executeQuery();
            ps.clearParameters();
            if (rs.next()) {
                /**************************************************************/
                query = "UPDATE current_school SET school_id=?, school_name=?, gpa=?, gpa_scale=?, viewable = ? WHERE coder_id=?";
                /**************************************************************/
                ps = conn.prepareStatement(query);
                ps.setInt(1, currentSchool.getSchoolId());
                ps.setString(2, currentSchool.getName());
                if (currentSchool.getGpa() > 0 || currentSchool.getGpaScale() > 0) {
                    log.debug("setting gpa: " + currentSchool.getGpa());
                    log.debug("setting gpaScale: " + currentSchool.getGpaScale());
                    ps.setFloat(3, currentSchool.getGpa());
                    ps.setFloat(4, currentSchool.getGpaScale());
                } else {
                    log.debug("setting gpa null");
                    log.debug("setting gpaScale");
                    ps.setNull(3, Types.FLOAT);
                    ps.setNull(4, Types.FLOAT);
                }
                ps.setInt(5, currentSchool.isViewable()?1:0);
                ps.setInt(6, currentSchool.getUserId());
                ps.executeUpdate();
                currentSchool.setModified("S");
            } else {
                insertCurrentSchool(conn, currentSchool);
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException(sqe.getMessage());
        } catch (Exception ex) {
            throw new TCException(
                    "ejb.User.UserDbCoder:updateCurrentSchool:ERROR:" + ex
            );
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
        }
    }


    private static void updateDemographicResponses(Connection conn, int coderTypeId, ArrayList demographicResponses)
            throws TCException {
        log.debug("ejb.User.UserDbCoder:updateDemographicResponses():called.");
        PreparedStatement ps = null;
        try {
            log.debug("CODER_TYPE_ID=" + coderTypeId);
            HashSet qIdsForCoderType = getDemographicQuestionIds(conn, coderTypeId);
            for (int i = 0; i < demographicResponses.size(); i++) {
                DemographicResponse demographicResponse = (DemographicResponse) demographicResponses.get(i);
                if (qIdsForCoderType != null && !qIdsForCoderType.contains(new Integer(demographicResponse.getDemographicQuestionId()))) {
                    demographicResponse.setModified("D");
                }
                String modifiedFlag = demographicResponse.getModified();
                if (modifiedFlag.compareToIgnoreCase("A") == 0) {
                    insertDemographicResponse(conn, demographicResponse);
                } else if (modifiedFlag.compareToIgnoreCase("U") == 0) {
                    StringBuffer query = new StringBuffer(200);
                    query.append(" UPDATE");
                    query.append(" demographic_response");
                    query.append(" SET");
                    query.append(" demographic_response=?");
                    query.append(" WHERE");
                    query.append(" coder_id=?");
                    query.append(" AND demographic_question_id=?");
                    query.append(" AND demographic_answer_id=?");
                    ps = conn.prepareStatement(query.toString());
                    ps.setString(1, demographicResponse.getDemographicResponseText());
                    ps.setInt(2, demographicResponse.getCoderId());
                    ps.setInt(3, demographicResponse.getDemographicQuestionId());
                    ps.setInt(4, demographicResponse.getDemographicAnswerId());
                    int RetVal = ps.executeUpdate();
                    if (RetVal != 1) {
                        log.error("ejb.User.UserDbCoder:updateDemographicResponses():update:failed");
                    }
                } else if (modifiedFlag.compareToIgnoreCase("D") == 0) {
                    /**************************************************************/
                    String query = "DELETE FROM demographic_response WHERE demographic_question_id=? AND demographic_answer_id=? AND coder_id=?";
                    /**************************************************************/
                    ps = conn.prepareStatement(query);
                    ps.setInt(1, demographicResponse.getDemographicQuestionId());
                    ps.setInt(2, demographicResponse.getDemographicAnswerId());
                    ps.setInt(3, demographicResponse.getCoderId());
                    int retVal = ps.executeUpdate();
                    if (retVal != 1) {
                        log.error("q=" + demographicResponse.getDemographicQuestionId());
                        log.error("a=" + demographicResponse.getDemographicAnswerId());
                        log.error("c=" + demographicResponse.getCoderId());
                        log.error("ejb.User.UserDbCoder:updateDemographicResponses():ERROR:" + retVal + " records deleted");
                    }
                }
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException(sqe.getMessage());
        } catch (Exception ex) {
            throw new TCException(
                    "ejb.User.UserDbCoder:updateDemographicResponses:ERROR:" + ex
            );
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
        }
    }


    private static void updateRating(Connection conn, Rating cr)
            throws TCException {
        log.debug("ejb.User.UserDbCoder:updateRating() called ...");
        PreparedStatement ps = null;
        String modifiedFlag = "";
        StringBuffer query = new StringBuffer(230);
        try {
            modifiedFlag = cr.getModified();
            if (modifiedFlag.equals("A")) {
                insertRating(conn, cr);
            } else if (modifiedFlag.equals("U")) {
                query.append(" UPDATE");
                query.append(" rating");
                query.append(" SET");
                query.append(" round_id=?");
                query.append(" ,rating=?");
                query.append(" ,last_rated_event=?");
                query.append(" ,num_ratings=?");
                query.append(" WHERE");
                query.append(" coder_id=?");
                ps = conn.prepareStatement(query.toString());
                ps.setInt(1, cr.getRoundId());
                ps.setInt(2, cr.getRating());
                ps.setDate(3, cr.getLastRatedEvent());
                ps.setInt(4, cr.getNumRatings());
                ps.setInt(5, cr.getCoderId());
                int RetVal = ps.executeUpdate();
                if (RetVal != 1) {
                    throw new TCException("ejb.User.UserDbCoder:updateRating():failed.");
                }
            } else if (modifiedFlag.equals("D")) {
                query.append("DELETE FROM rating WHERE coder_id=?");
                ps = conn.prepareStatement(query.toString());
                ps.setInt(1, cr.getCoderId());
                int RetVal = ps.executeUpdate();
                if (RetVal != 1) {
                    throw new TCException("ejb.User.UserDbCoder:updateRating():failed.");
                }
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException(sqe.getMessage());
        } catch (Exception ex) {
            StringBuffer msg = new StringBuffer(300);
            msg.append("ejb.User.UserDbCoder:updateRating:");
            msg.append("coderId=");
            msg.append(cr.getCoderId());
            msg.append(":contestId=");
            msg.append(cr.getContestId());
            msg.append(":roundId=");
            msg.append(cr.getRoundId());
            msg.append(":failed:\n");
            msg.append(ex);
            throw new TCException(msg.toString());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
        }
    }

    /**
     * Update coder_confirmation table for this user.
     */
/*
    private static void updateCoderConfirmations(Connection conn, ArrayList coderConfirmations)
            throws TCException {
        log.debug("ejb.User.UserDbCoder:updateCoderConfirmations():called.");
        PreparedStatement ps = null;
        try {
            for (int i = 0; i < coderConfirmations.size(); i++) {
                CoderConfirmation coderConfirmation = (CoderConfirmation) coderConfirmations.get(i);
                String modifiedFlag = coderConfirmation.getModified();
                if (modifiedFlag.compareToIgnoreCase("A") == 0) {
                    insertCoderConfirmation(conn, coderConfirmation);
                } else if (modifiedFlag.compareToIgnoreCase("U") == 0) {
                    StringBuffer query = new StringBuffer(200);
                    query.append(" UPDATE coder_confirmation");
                    query.append(" SET code = ?");
                    query.append(" WHERE coder_id = ?");
                    query.append(" AND contest_id = ?");
                    ps = conn.prepareStatement(query.toString());
                    ps.setString(1, coderConfirmation.getCode());
                    ps.setInt(2, coderConfirmation.getCoderId());
                    ps.setInt(3, coderConfirmation.getContestId());
                    int RetVal = ps.executeUpdate();
                    if (RetVal != 1) {
                        log.error("ejb.User.UserDbCoder:updateCoderConfirmation():update:failed");
                    }
                }
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException(sqe.getMessage());
        } catch (Exception ex) {
            throw new TCException(
                    "ejb.User.UserDbCoder:updateCoderConfirmations():ERROR:" + ex
            );
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
        }
    }
 */





//                                 SELECT





    static void loadCoder(Connection conn, User user)
            throws TCException {
        log.debug("loadCoder():called...");
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = new StringBuffer(1000);
        query.append(" SELECT");
        query.append(" c.first_name");
        query.append(" ,c.last_name");
        query.append(" ,c.middle_name");
        query.append(" ,c.address1");
        query.append(" ,c.address2");
        query.append(" ,c.city");
        query.append(" ,c.state_code");
        query.append(" ,c.country_code");
        query.append(" ,c.zip");
        query.append(" ,c.work_phone");
        query.append(" ,c.home_phone");
        query.append(" ,c.activation_code");
        query.append(" ,c.member_since");
        query.append(" ,c.notify");
        query.append(" ,c.quote");
        query.append(" ,s.state_name");
        query.append(" ,s.demographic_decline");
        query.append(" ,co.country_name");
        query.append(" ,co.participating");
        query.append(" ,c.editor_id");
        query.append(" ,e.editor_desc");
        query.append(" ,c.language_id");
        query.append(" ,l.language_name");
        query.append(" ,c.coder_type_id");
        query.append(" ,ct.coder_type_desc");
        query.append(" ,crr.referral_id");
        query.append(" ,crr.referral_desc");
        query.append(" ,crr.reference_id");
        query.append(" ,crr.other");
        query.append(" ,(SELECT count(*)");
        query.append(" FROM coder_image_xref cix");
        query.append(" , image i");
        query.append(" WHERE cix.image_id = i.image_id");
        query.append(" AND cix.coder_id = c.coder_id");
        query.append(" AND i.image_type_id = 1) as image_flag");
        query.append(" ,c.comp_country_code");
        query.append(" ,co1.country_name as comp_country_name");
        query.append(" FROM");
        query.append(" coder c");
        query.append(" ,country co");
        query.append(" , country co1");
        query.append(" ,language l");
        query.append(" ,coder_type ct");
        query.append(" ,editor e");
        query.append(" ,OUTER state s");
        query.append(" ,OUTER");
        query.append(" TABLE(MULTISET(");
        query.append(" SELECT");
        query.append(" cr.coder_id");
        query.append(" ,cr.referral_id");
        query.append(" ,r.referral_desc");
        query.append(" ,cr.other");
        query.append(" ,cr.reference_id ");
        query.append(" FROM");
        query.append(" coder_referral cr");
        query.append(" ,referral r");
        query.append(" WHERE");
        query.append(" r.referral_id = cr.referral_id");
        query.append(" AND cr.coder_id = ?");
        query.append(" )) crr");
        query.append(" WHERE");
        query.append(" c.coder_id = ?");
        query.append(" AND c.country_code = co.country_code");
        query.append(" AND c.comp_country_code = co1.country_code");
        query.append(" AND c.language_id = l.language_id");
        query.append(" AND c.coder_type_id  = ct.coder_type_id");
        query.append(" AND c.editor_id = e.editor_id");
        query.append(" AND c.state_code = s.state_code");
        query.append(" AND c.coder_id = crr.coder_id");

        try {
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, user.getUserId());
            ps.setInt(2, user.getUserId());
            rs = ps.executeQuery();
            if (rs.next()) {
                HashMap userTypeDetails = user.getUserTypeDetails();
                CoderRegistration coder = new CoderRegistration();
                State state = coder.getHomeState();
                Country country = coder.getHomeCountry();
                Editor editorType = coder.getEditor();
                Language subject = coder.getLanguage();
                CoderType coderType = coder.getCoderType();
                CoderReferral coderReferral = coder.getCoderReferral();
                Referral referral = coderReferral.getReferral();
                userTypeDetails.put("Coder", coder);
                coder.setCoderId(user.getUserId());
                coder.setFirstName(rs.getString(1));
                coder.setLastName(rs.getString(2));
                coder.setMiddleName(rs.getString(3));
                coder.setHomeAddress1(rs.getString(4));
                coder.setHomeAddress2(rs.getString(5));
                coder.setHomeCity(rs.getString(6));
                state.setStateCode(rs.getString(7));
                country.setCountryCode(rs.getString(8));
                coder.setHomeZip(rs.getString(9));
                coder.setWorkPhone(rs.getString(10));
                coder.setHomePhone(rs.getString(11));
                coder.setActivationCode(rs.getString(12));
                coder.setMemberSince(rs.getDate(13));
                coder.setNotify(rs.getString(14));
                coder.setQuote(rs.getString(15));
                state.setStateName(rs.getString(16));
                state.setDemographicDecline(rs.getInt(17));
                country.setCountryName(rs.getString(18));
                country.setParticipating(rs.getInt(19));
                editorType.setEditorId(rs.getInt(20));
                editorType.setEditorDesc(rs.getString(21));
                subject.setLanguageId(rs.getInt(22));
                subject.setName(rs.getString(23));
                coderType.setCoderTypeId(rs.getInt(24));
                coderType.setCoderTypeDesc(rs.getString(25));
                coderReferral.setCoderId(user.getUserId());
                referral.setReferralId(rs.getInt(26));
                referral.setReferralDesc(rs.getString(27));
                coderReferral.setReferenceId(rs.getInt(28));
                coderReferral.setOther(rs.getString(29));
                Country compCountry = new Country();
                compCountry.setCountryCode(rs.getString("comp_country_code"));
                compCountry.setCountryName(rs.getString("comp_country_name"));
                coder.setCompCountry(compCountry);
                if (rs.getInt(30) == 0)
                    coder.setHasImage(false);
                else if (rs.getInt(30) == 1)
                    coder.setHasImage(true);
                coder.setModified("S");
                //loadCoderEducation           ( conn, coder      );
                //loadCoderSchool              ( conn, coder      );
                //loadCoderSkill               ( conn, coder      );
                //loadExperience               ( conn, coder      );
                loadCoderNotify(conn, coder);
                loadRating(conn, coder);
                loadRanking(coder);
                loadDemographicResponses(conn, coder);
                if (coder.getCoderType().getCoderTypeId() == 1) //if they're a student
                    loadCurrentSchool(conn, coder);
//                loadCoderConfirmations(conn, coder);
                Coder tempCoder = (Coder) user.getUserTypeDetails().get("Coder");
                log.debug("loaded coder " + tempCoder.getFirstName() + " " + tempCoder.getLastName());
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException(sqe.getMessage());
        } catch (Exception ex) {
            log.debug("MIKE SAYS:" + ex.getMessage());
            ex.printStackTrace();
            StringBuffer msg = new StringBuffer(300);
            msg.append("ejb.User.UserDbCoder:loadCoder:");
            msg.append("coderId=");
            msg.append(user.getUserId());
            msg.append(":failed:\n");
            msg.append(ex);
            throw new TCException(msg.toString());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
        }
    }

    private static void loadDemographicResponses(Connection conn, CoderRegistration coder)
            throws TCException {
        log.debug("ejb.User.UserDbCoder:loadDemographicResponses():called.");
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = new StringBuffer(200);
        /**************************************************************/
        query.append(" SELECT demographic_question_id");
        query.append(" ,demographic_answer_id");
        query.append(" ,demographic_response");
        query.append(" FROM demographic_response");
        query.append(" WHERE coder_id = ?");
        /**************************************************************/
        try {
            ArrayList demographicResponses = coder.getDemographicResponses();
            demographicResponses.clear();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, coder.getCoderId());
            rs = ps.executeQuery();
            while (rs.next()) {
                DemographicResponse demographicResponse = new DemographicResponse();
                demographicResponse.setCoderId(coder.getCoderId());
                demographicResponse.setDemographicQuestionId(rs.getInt(1));
                demographicResponse.setDemographicAnswerId(rs.getInt(2));
                demographicResponse.setDemographicResponseText(rs.getString(3));
                demographicResponse.setModified("S");
                demographicResponses.add(demographicResponse);
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException(sqe.getMessage());
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new TCException(
                    "ejb.User.UserDbCoder:loadDemographicResponses:" + coder.getCoderId() + ":failed:\n" + ex
            );
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
        }
    }


    private static void loadCoderNotify(Connection conn, CoderRegistration coder)
            throws TCException {
        log.debug("ejb.User.UserDbCoder:loadCoderNotify():called.");
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList notifications = coder.getNotifications();
        notifications.clear();
        StringBuffer query = new StringBuffer(170);
        query.append(" SELECT");
        query.append(" c.notify_id");
        query.append(" ,n.name");
        query.append(" FROM");
        query.append(" coder_notify c");
        query.append(" ,notify_lu n");
        query.append(" WHERE");
        query.append(" c.coder_id=?");
        query.append(" AND c.notify_id=n.notify_id");
        try {
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, coder.getCoderId());
            rs = ps.executeQuery();
            while (rs.next()) {
                Notify notify = new Notify();
                notify.setNotifyId(rs.getInt(1));
                notify.setName(rs.getString(2));
                notifications.add(notify);
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException(sqe.getMessage());
        } catch (Exception ex) {
            throw new
                    TCException("ejb.User.UserDbCoder:loadCoderNotify:" + coder.getCoderId() + ":failed:\n" + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
        }
    }


    private static void loadRating(Connection conn, CoderRegistration coder)
            throws TCException {
        log.debug("ejb.User.UserDbCoder:loadRating():called.");
        PreparedStatement ps = null;
        ResultSet rs = null;
        Rating coderRating = coder.getRating();
        StringBuffer query = new StringBuffer(170);
        query.append(" SELECT");
        query.append(" round_id");
        query.append(" ,rating");
        query.append(" ,last_rated_event");
        query.append(" ,num_ratings");
        query.append(" FROM");
        query.append(" rating");
        query.append(" WHERE");
        query.append(" coder_id=?");
        try {
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, coder.getCoderId());
            rs = ps.executeQuery();
            while (rs.next()) {
                coderRating.setCoderId(coder.getCoderId());
                coderRating.setRoundId(rs.getInt(1));
                coderRating.setRating(rs.getInt(2));
                coderRating.setLastRatedEvent(rs.getDate(3));
                coderRating.setNumRatings(rs.getInt(4));
                coderRating.setModified("S");
            }
            rs.close();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException(sqe.getMessage());
        } catch (Exception ex) {
            throw new
                    TCException("ejb.User.UserDbCoder:loadRating:" + coder.getCoderId() + ":failed:\n" + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
        }
    }

    private static void loadCurrentSchool(Connection conn, CoderRegistration coder)
            throws TCException {
        log.debug("ejb.User.UserDbCoder:loadCurrentSchool():called.");
        PreparedStatement ps = null;
        ResultSet rs = null;
        School currentSchool = coder.getCurrentSchool();
        StringBuffer query = new StringBuffer(170);
        query.append(" SELECT");
        query.append(" c.school_id");
        query.append(" ,c.school_name");
        query.append(" ,s.name");
        query.append(" ,s.city");
        query.append(" ,s.state_code");
        query.append(" ,st.state_name");
        query.append(" ,s.country_code");
        query.append(" ,ct.country_name");
        query.append(" ,c.gpa");
        query.append(" ,c.gpa_scale");
        query.append(" ,c.viewable");
        query.append(" FROM");
        query.append(" current_school c");
        query.append(" ,school s");
        query.append(" ,state st");
        query.append(" ,country ct");
        query.append(" WHERE");
        query.append(" coder_id=?");
        query.append(" AND c.school_id = s.school_id");
        query.append(" AND s.state_code = st.state_code");
        query.append(" AND s.country_code = ct.country_code");
        try {
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, coder.getCoderId());
            rs = ps.executeQuery();
            if (rs.next()) {
                currentSchool.setUserId(coder.getCoderId());
                currentSchool.setSchoolId(rs.getInt("school_id"));
                if (currentSchool.getSchoolId() == 0) {
                    currentSchool.setName(rs.getString("school_name"));
                } else {
                    currentSchool.setName(rs.getString("name"));
                }
                currentSchool.setCity(rs.getString("city"));
                currentSchool.getState().setStateCode(rs.getString("state_code"));
                currentSchool.getState().setStateName(rs.getString("state_name"));
                currentSchool.getCountry().setCountryCode(rs.getString("country_code"));
                currentSchool.getCountry().setCountryName(rs.getString("country_name"));
                currentSchool.setGpa(rs.getFloat("gpa"));
                currentSchool.setGpaScale(rs.getFloat("gpa_scale"));
                currentSchool.setViewable(rs.getInt("viewable")==1);
                currentSchool.setModified("S");
            }
            XMLDocument test = new XMLDocument("test");
            test.addTag(currentSchool.getXML());
            log.debug(test.getXML(2));
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException(sqe.getMessage());
        } catch (Exception ex) {
            throw new
                    TCException("ejb.User.UserDbCoder:loadCurrentSchool:" + coder.getCoderId() + ":failed:\n" + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
        }
    }

    /**
     *********************************************************************************************
     * loadRanking()
     * Gets a particular coder's ranking
     *********************************************************************************************
     */
    private static void loadRanking(CoderRegistration coder) throws TCException {
        log.debug("ejb:User:loadRanking called...");
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = null;
        Connection conn = null;

        try {
            query = new StringBuffer(300);
            query.append(" SELECT rank");
            query.append(" FROM coder_rank");
            query.append(" WHERE coder_id = ?");
            query.append(" AND coder_rank_type_id = ?");
            conn = DBMS.getConnection(DBMS.DW_DATASOURCE_NAME);

            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, coder.getCoderId());
            ps.setInt(2, CODER_RATING_RANK_TYPE_ID);
            rs = ps.executeQuery();
            int rank = 0;
            if (rs.next())
                rank = rs.getInt(1);
            coder.setRanking(rank);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException(sqe.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            throw new TCException(e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("rs close problem");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("ps close problem");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("conn close problem");
                }
            }

        }
    }


    private static HashSet getDemographicQuestionIds(Connection conn, int coderTypeId)
            throws TCException {
        HashSet result = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = new StringBuffer(200);
        query.append(" SELECT");
        query.append(" demographic_question_id");
        query.append(" FROM");
        query.append(" demographic_assignment");
        query.append(" WHERE");
        query.append(" coder_type_id = ?");
        try {
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, coderTypeId);
            rs = ps.executeQuery();
            while (rs.next()) {
                if (result == null) result = new HashSet();
                result.add(new Integer(rs.getInt(1)));
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException(sqe.getMessage());
        } catch (Exception ex) {
            ex.printStackTrace(); //XXX
            throw new
                    TCException("ejb.User.UserDbCoder:getDemographicQuestionIds:" + coderTypeId + ":failed:\n" + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }

    /**
     * Load up information from coder_confirmation for this coder.
     */
    /*
    private static void loadCoderConfirmations(Connection conn, CoderRegistration coder)
            throws TCException {
        log.debug("ejb.User.UserDbCoder:loadCoderConfirmations():called.");
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = new StringBuffer(200);
        query.append(" SELECT coder_id");
        query.append(" ,contest_id");
        query.append(" ,code");
        query.append(" FROM coder_confirmation");
        query.append(" WHERE coder_id = ?");
        try {
            ArrayList coderConfirmations = coder.getCoderConfirmations();
            coderConfirmations.clear();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, coder.getCoderId());
            rs = ps.executeQuery();
            while (rs.next()) {
                CoderConfirmation coderConfirmation = new CoderConfirmation();
                coderConfirmation.setCoderId(coder.getCoderId());
                coderConfirmation.setContestId(rs.getInt(2));
                coderConfirmation.setCode(rs.getString(3));
                coderConfirmation.setModified("S");
                coderConfirmations.add(coderConfirmation);
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new TCException(sqe.getMessage());
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new TCException(
                    "ejb.User.UserDbCoder:loadCoderConfirmations:" + coder.getCoderId() + ":failed:\n" + ex
            );
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
        }
    }
    */
}
