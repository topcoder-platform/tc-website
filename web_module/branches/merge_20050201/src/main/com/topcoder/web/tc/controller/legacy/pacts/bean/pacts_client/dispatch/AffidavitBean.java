/**
 * this class is used to extract affidavit information from the
 * db.  Like all member beans, it will check if IDs are valid
 * but will not try to figure out if the person has authority.
 * that is the job of the servlet.
 *
 * @author Sam King
 */

package com.topcoder.web.tc.controller.legacy.pacts.bean.pacts_client.dispatch;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.ValueTag;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.*;

import javax.xml.transform.*;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.Map;


public class AffidavitBean implements PactsConstants {
    private static Logger log = Logger.getLogger(AffidavitBean.class);

    /**
     * contstuctor
     */
    public AffidavitBean() {
        // nothing to do, stateless bean
    }

    /**
     * used to get the full affidavit for a given affidavit id
     *
     * @param affidavitId the affidavit id
     * @return the affidavit if the id was valid, null otherwise
     */
    public Affidavit getAffidavit(long affidavitId) {
        log.debug("getAffidavit, affidavitId = " + affidavitId);
        DataInterfaceBean bean = new DataInterfaceBean();
        java.util.Map reply = null;
        try {
            reply = bean.getAffidavit(affidavitId);
        } catch (Exception e1) {
            log.error("did not get affidavit in getAffidavit");
            e1.printStackTrace();
            return null;
        }

        Affidavit a = new Affidavit(reply);
        return a;

    }

    /**
     * used to get all pending affidavits for a user
     *
     * @param memberId the id of the member
     */
    public Affidavit[] getPendingAffidavitsForUser(long memberId) {
        Affidavit[] full;
        Affidavit[] pend;

        full = getAffidavitsForUser(memberId);
        if ((full == null) || (full.length <= 0)) {
            log.debug("did not get any affidavits");
            return full;
        }

        int numPend = 0;
        int idx;
        for (idx = 0; idx < full.length; idx++) {
            if (full[idx]._header._statusID == AFFIDAVIT_PENDING_STATUS) {
                numPend++;
            }
        }

        pend = new Affidavit[numPend];
        int aIdx = 0;
        for (idx = 0; idx < full.length; idx++) {
            if (full[idx]._header._statusID == AFFIDAVIT_PENDING_STATUS) {
                pend[aIdx++] = full[idx];
            }
        }

        return pend;
    }

    /**
     * used to find all affidavits for a given member, will return
     * an array of Affidavits
     *
     * @param memberId the member id of the person in question
     * @return Affdavit[] the array of affidavits, null if member if
     *         either does not have any, or the member ID is invalid
     */
    public Affidavit[] getAffidavitsForUser(long memberId) {
        log.debug("getAffidavitsForUser, memberId = " + memberId);
        DataInterfaceBean bean = new DataInterfaceBean();
        java.util.Map reply = null;

        try {
            log.debug("getting the affidavit for member " + memberId);
            reply = bean.getUserAffidavitList(memberId);
        } catch (Exception e1) {
            log.debug("did not get user affidavit list");
            e1.printStackTrace();
            return null;
        }

        // the query just extraced the headers send them to the classes
        AffidavitHeaderList aList = new AffidavitHeaderList(reply);

        //now scan through the results and see if we got anything
        if (aList.headerList.length <= 0) {
            log.debug("There were not affidavit headers returned");
            return null;
        }

        Affidavit[] a = new Affidavit[aList.headerList.length];

        for (int i = 0; i < a.length; i++) {
            try {
                log.debug("getting the affidavit " + aList.headerList[i]._id +
                        " for member " + memberId);
                reply = bean.getUserAffidavitList(memberId);
            } catch (Exception e1) {
                log.debug("did not get user affidavit list");
                e1.printStackTrace();
                return null;
            }

            a[i] = getAffidavit(aList.headerList[i]._id);
        }

        return a;
    }


    /**
     * used to get the actual text of the affidavit
     */
    public String getAffidavitText(long affidavitId) {
        log.debug("getAffidavitText, affidavitId = " + affidavitId);
        DataInterfaceBean bean = new DataInterfaceBean();
        String text = new String("");

        try {
            Map results = bean.getText(affidavitId, AFFIDAVIT_OBJ);
            ResultText t = new ResultText(results);
            text = t.text;
        } catch (Exception e) {
            log.error("we got excepted trying to get the affidavit text" +
                    "for affidavit " + affidavitId);
            e.printStackTrace();
        }

        return text;
    }

    /**
     * this class is used to form an affidavit and get the text.
     * It just makes calls to other methods to form the object
     */
    public AffidavitWithText getAffidavitWithText(long affidavitId) {
        return getAffidavitWithText(affidavitId, null);
    }

    public AffidavitWithText getAffidavitWithText(long affidavitId, String birthday) {
        log.debug("getAffidavitWithText, affidavitId = " + affidavitId);
        AffidavitWithText a = new AffidavitWithText();


        PaymentBean bean = new PaymentBean();
        DataInterfaceBean dbean = new DataInterfaceBean();

        a.affidavit = getAffidavit(affidavitId);
        a.affidavitText = getAffidavitText(affidavitId);
        a.payment = bean.getPayment(a.affidavit._payment._id);

        // Added by STK 5/28/02 so that entered birthdays can
        // be added to the affidavit text.
        if (birthday != null) {
            a.affidavit._birthday = birthday;
        }

        try {
            a.setHasAllDemographicAnswers(dbean.hasAllDemographicAnswers(a.affidavit._header._user._id));
            a.setHasNotarizedAffidavit(dbean.hasNotarizedAffidavit(a.affidavit._header._user._id, a.affidavit._header._typeID));
            a.setHasTaxForm(dbean.hasTaxForm(a.affidavit._header._user._id));

            if (!a.affidavit._header._affirmed) {
                // replace the xml tags with proper values
                a.affidavitText = parseAffidavitXml(a.affidavitText, a.affidavit,
                        a.payment);
                if (a.affidavitText == null) {
                    return null;
                }
            }
        } catch (Exception e) {
            log.error("We got excepted trying to see if affidavit could be" +
                    "Affirmed online");
            e.printStackTrace();
        }

        return a;
    }

    /**
     * actually affirms the affidavit
     */
    public void affirmAffidavit(long affidavitId, String finalText, String date) {
        DataInterfaceBean bean = new DataInterfaceBean();
        try {
            bean.affirmAffidavit(affidavitId, finalText, date);
        } catch (Exception e) {
            log.error("we got excepted trying to affirm an affidavit");
            e.printStackTrace();
        }
    }

    /**
     * used to parse the affidavit xml, placing the proper data where
     * it should go.
     *
     * @param text the affidavit template text
     * @param affidavit the affidavit in question
     * @param Payment the payment associated with the affidavit, used to get
     * some of the contact info.
     */
    private String parseAffidavitXml(String text, Affidavit affidavit, Payment payment) {
        try {
            UserProfileBean upb = new UserProfileBean();
            UserProfile profile = upb.getUserProfile(affidavit._header._user._id);
            UserDemographics demog = upb.getUserDemographics(affidavit._header._user._id);
            //first we must form the xml from the info
            RecordTag tc = new RecordTag("TC");
            RecordTag a = new RecordTag("Affidavit");
            //get most of the info from the payment
            a.addTag(new ValueTag("first_name", payment._firstName));
            a.addTag(new ValueTag("last_name", payment._lastName));
            a.addTag(new ValueTag("address1", payment._address1));
            a.addTag(new ValueTag("address2", payment._address2));
            a.addTag(new ValueTag("city", payment._city));
            a.addTag(new ValueTag("state_name", payment._state));
            a.addTag(new ValueTag("zip", payment._zip));
            a.addTag(new ValueTag("country_name", payment._country));
            a.addTag(new ValueTag("round", affidavit._round));
            // dpecora - fix compile error due to affidavit field change
            //a.addTag(new ValueTag("round_id",affidavit._roundID));
            long roundId = (affidavit._roundID == null ? 0 : affidavit._roundID.longValue());
            a.addTag(new ValueTag("round_id", roundId));
            a.addTag(new ValueTag("date_of_birth", affidavit._birthday));

            // now fill in the holes with the user profile
            a.addTag(new ValueTag("email", profile._email));
            a.addTag(new ValueTag("home_phone", profile._homePhone));
            a.addTag(new ValueTag("work_phone", profile._workPhone));
            a.addTag(new ValueTag("handle", profile._header._handle));
            a.addTag(new ValueTag("coder_type_desc", profile._coderTypeDesc));
            a.addTag(new ValueTag("has_notarized_affidavit",
                    new DataInterfaceBean().hasNotarizedAffidavit(
                            affidavit._header._user._id, affidavit._header._typeID)));

            // now the demographic data
            for (int idx = 0; idx < demog.questions.length; idx++) {
                RecordTag dm = new RecordTag("demographic_assignment");
                dm.addTag(new ValueTag("demographic_question", demog.questions[idx]));
                dm.addTag(new ValueTag("demographic_answer", demog.answers[idx]));
                a.addTag(dm);
            }
            if (demog._schoolName.trim().length()>0)
                a.addTag(new ValueTag("current_school", demog._schoolName));
            tc.addTag(a);

            log.debug(tc.getXML());
            TransformerFactory tFactory = TransformerFactory.newInstance();
            StringReader xmlIn = new StringReader(tc.getXML());
            StringReader xslIn = new StringReader(text);
            Source xmlSource = new StreamSource(xmlIn);
            Source xslSource = new StreamSource(xslIn);
            // Generate the transformer.
            Transformer transformer = tFactory.newTransformer(xslSource);
            // Perform the transformation, sending the output to the response.
            StringWriter res = new StringWriter();
            transformer.transform(xmlSource, new StreamResult(res));

            return res.toString();
        } catch (Exception e) {
            log.error("we got excepted trying to get transform xml affidavit to text");
            e.printStackTrace();
        }

        return null;
    }
}
