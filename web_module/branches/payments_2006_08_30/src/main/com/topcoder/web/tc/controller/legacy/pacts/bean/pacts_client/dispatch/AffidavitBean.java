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
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.*;

import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
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
            if (full[idx].getHeader().getStatusId() == AFFIDAVIT_PENDING_STATUS) {
                numPend++;
            }
        }

        pend = new Affidavit[numPend];
        int aIdx = 0;
        for (idx = 0; idx < full.length; idx++) {
            if (full[idx].getHeader().getStatusId() == AFFIDAVIT_PENDING_STATUS) {
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
        if (aList.getHeaderList().length <= 0) {
            log.debug("There were not affidavit headers returned");
            return null;
        }

        Affidavit[] a = new Affidavit[aList.getHeaderList().length];

        for (int i = 0; i < a.length; i++) {
            try {
                log.debug("getting the affidavit " + aList.getHeaderList()[i].getId() +
                        " for member " + memberId);
                reply = bean.getUserAffidavitList(memberId);
            } catch (Exception e1) {
                log.debug("did not get user affidavit list");
                e1.printStackTrace();
                return null;
            }

            a[i] = getAffidavit(aList.getHeaderList()[i].getId());
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
            text = t.getText();
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

        a.setAffidavit(getAffidavit(affidavitId));
        a.setAffidavitText(getAffidavitText(affidavitId));

        if (a.getAffidavit().getPayment()!=null && a.getAffidavit().getPayment().getId()>0) {
            a.setPayment(bean.getPayment(a.getAffidavit().getPayment().getId()));
        } else {
            try {
                a.setPayment(bean.getEmptyPayment(a.getAffidavit().getHeader().getUser().getId()));
            } catch (Exception e) {
                e.printStackTrace();
                //todo don't friggin swallow exceptions in the damn app
            }
        }

        // Added by STK 5/28/02 so that entered birthdays can
        // be added to the affidavit text.
        if (birthday != null) {
            a.getAffidavit().setBirthday(birthday);
        }

        try {
            a.setHasAllDemographicAnswers(dbean.hasAllDemographicAnswers(a.getAffidavit().getHeader().getUser().getId()));
            a.setHasNotarizedAffidavit(dbean.hasNotarizedAffidavit(a.getAffidavit().getHeader().getUser().getId(), a.getAffidavit().getHeader().getTypeId()));
            a.setHasTaxForm(dbean.hasTaxForm(a.getAffidavit().getHeader().getUser().getId()));

            if (!a.getAffidavit().getHeader().isAffirmed()) {
                // replace the xml tags with proper values
                a.setAffidavitText(parseAffidavitXml(a.getAffidavitText(), a.getAffidavit(),
                        a.getPayment()));
                if (a.getAffidavitText() == null) {
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
     * @param payment the payment associated with the affidavit, used to get
     * some of the contact info.
     */
    private String parseAffidavitXml(String text, Affidavit affidavit, Payment payment) {
        try {
            UserProfileBean upb = new UserProfileBean();
            UserProfile profile = upb.getUserProfile(affidavit.getHeader().getUser().getId());
            UserDemographics demog = upb.getUserDemographics(affidavit.getHeader().getUser().getId());
            //first we must form the xml from the info
            XMLDocument tc = new XMLDocument("TC");
            //RecordTag tc = new RecordTag("TC");
            RecordTag a = new RecordTag("Affidavit");
            //get most of the info from the payment
            a.addTag(new ValueTag("first_name", payment.getFirstName()));
            a.addTag(new ValueTag("last_name", payment.getLastName()));
            a.addTag(new ValueTag("address1", payment.getAddress1()));
            a.addTag(new ValueTag("address2", payment.getAddress2()));
            a.addTag(new ValueTag("city", payment.getCity()));
            a.addTag(new ValueTag("state_name", payment.getState()));
            a.addTag(new ValueTag("zip", payment.getZip()));
            a.addTag(new ValueTag("country_name", payment.getCountry()));
            a.addTag(new ValueTag("round", affidavit.getRound()));
            // dpecora - fix compile error due to affidavit field change
            //a.addTag(new ValueTag("round_id",affidavit._roundID));
            long roundId = (affidavit.getRoundId() == null ? 0 : affidavit.getRoundId().longValue());
            a.addTag(new ValueTag("round_id", roundId));
            a.addTag(new ValueTag("date_of_birth", affidavit.getBirthday()));

            // now fill in the holes with the user profile
            a.addTag(new ValueTag("email", profile.getEmail()));
            a.addTag(new ValueTag("home_phone", profile.getHomePhone()));
            a.addTag(new ValueTag("work_phone", profile.getWorkPhone()));
            a.addTag(new ValueTag("handle", profile.getHeader().getHandle()));
            a.addTag(new ValueTag("coder_type_desc", profile.getCoderTypeDesc()));
            a.addTag(new ValueTag("has_notarized_affidavit",
                    new DataInterfaceBean().hasNotarizedAffidavit(
                            affidavit.getHeader().getUser().getId(), affidavit.getHeader().getTypeId())));

            // now the demographic data
            for (int idx = 0; idx < demog.getQuestions().length; idx++) {
                RecordTag dm = new RecordTag("demographic_assignment");
                dm.addTag(new ValueTag("demographic_question", demog.getQuestions()[idx]));
                dm.addTag(new ValueTag("demographic_answer", demog.getAnswers()[idx]));
                a.addTag(dm);
            }
            if (demog.getSchoolName().trim().length() > 0)
                a.addTag(new ValueTag("current_school", demog.getSchoolName()));
            tc.addTag(a);

            log.debug(tc.getXML(false, 2));
            TransformerFactory tFactory = TransformerFactory.newInstance();
            StringReader xmlIn = new StringReader(tc.getXML(false));
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
