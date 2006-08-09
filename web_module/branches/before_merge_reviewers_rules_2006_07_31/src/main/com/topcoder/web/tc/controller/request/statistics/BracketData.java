package com.topcoder.web.tc.controller.request.statistics;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import org.xml.sax.Attributes;
import org.xml.sax.helpers.AttributesImpl;

import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.sax.SAXTransformerFactory;
import javax.xml.transform.sax.TransformerHandler;
import javax.xml.transform.stream.StreamResult;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Iterator;

/**
 * @author dok
 * Date: Mar 18, 2004
 */
public class BracketData extends Base {

    public void businessProcessing() throws TCWebException {

        try {
            String roundId = StringUtils.checkNull(getRequest().getParameter("rd"));
            if (roundId.equals("")) {
                throw new TCWebException("Round id parameter not included in request");
            }

            getResponse().setContentType("text/xml");
            PrintWriter out = getResponse().getWriter();
            StreamResult streamResult = new StreamResult(out);
            SAXTransformerFactory tf = (SAXTransformerFactory) SAXTransformerFactory.newInstance();

            TransformerHandler hd = tf.newTransformerHandler();
            Transformer serializer = hd.getTransformer();
            serializer.setOutputProperty(OutputKeys.ENCODING, "ISO-8859-1");
            //flash doesn't like the whitespace
            serializer.setOutputProperty(OutputKeys.INDENT, "no");
            hd.setResult(streamResult);
            hd.startDocument();

            Request competitorRequest = new Request();
            competitorRequest.setContentHandle("round_competitors");
            competitorRequest.setProperty("rd", roundId);

            Request profileRequest = new Request();
            profileRequest.setContentHandle("member_profile");

            ResultSetContainer competitorRsc =
                    (ResultSetContainer) getDataAccess(DBMS.OLTP_DATASOURCE_NAME, true).getData(competitorRequest).get("round_competitors");

            ResultSetContainer profileRsc = null;
            ResultSetContainer.ResultSetRow rsr = null;

            DataAccessInt dataAccess = getDataAccess(true);

            AttributesImpl emptyAtts = new AttributesImpl();
            hd.startElement("", "", "bracket_data", emptyAtts);

            SimpleDateFormat sdf = new SimpleDateFormat("MM.dd.yyyy");
            DecimalFormat df = new DecimalFormat("0.00");

            for (Iterator it = competitorRsc.iterator(); it.hasNext();) {
                rsr = (ResultSetContainer.ResultSetRow) it.next();
                profileRequest.setProperty("cr", rsr.getStringItem("coder_id"));
                profileRsc = (ResultSetContainer) dataAccess.getData(profileRequest).get("Coder_Data");

                hd.startElement("", "", "competitor", emptyAtts);
                addElement(hd, "handle", profileRsc.getStringItem(0, "handle"), emptyAtts);
                addElement(hd, "photo", profileRsc.getStringItem(0, "image_path"), emptyAtts);
                addElement(hd, "alg_rating", profileRsc.getStringItem(0, "rating"), emptyAtts);
                addElement(hd, "alg_rank", profileRsc.getStringItem(0, "rank"), emptyAtts);
                addElement(hd, "alg_percentile", df.format(profileRsc.getDoubleItem(0, "percentile")), emptyAtts);
                addElement(hd, "member_since", sdf.format(profileRsc.getItem(0, "member_since").getResultData()), emptyAtts);
                addElement(hd, "competitions", profileRsc.getStringItem(0, "num_competitions"), emptyAtts);
                addElement(hd, "room_seed", rsr.getStringItem("room_seed"), emptyAtts);
                hd.endElement("", "", "competitor");
            }

            hd.endElement("", "", "bracket_data");
            hd.endDocument();

            getResponse().flushBuffer();

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private void addElement(TransformerHandler hd, String name, String value, Attributes atts) throws Exception {
        String temp = value == null ? "" : value;
        hd.startElement("", "", name, atts);
        hd.characters(temp.toCharArray(), 0, temp.length());
        hd.endElement("", "", name);

    }


}

