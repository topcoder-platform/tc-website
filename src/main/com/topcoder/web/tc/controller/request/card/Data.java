package com.topcoder.web.tc.controller.request.card;

import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.sax.SAXTransformerFactory;
import javax.xml.transform.sax.TransformerHandler;
import javax.xml.transform.Transformer;
import javax.xml.transform.OutputKeys;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.text.DecimalFormat;

import org.xml.sax.helpers.AttributesImpl;
import org.xml.sax.Attributes;

/**
 * @author dok
 * Date: Jan 19, 2004
 */
public class Data extends Base {

    protected void businessProcessing() throws TCWebException {

        try {
            PrintWriter out = getResponse().getWriter();
            StreamResult streamResult = new StreamResult(out);
            SAXTransformerFactory tf = (SAXTransformerFactory) SAXTransformerFactory.newInstance();

            TransformerHandler hd = tf.newTransformerHandler();
            Transformer serializer = hd.getTransformer();
            serializer.setOutputProperty(OutputKeys.ENCODING,"ISO-8859-1");
            serializer.setOutputProperty(OutputKeys.INDENT,"yes");
            hd.setResult(streamResult);
            hd.startDocument();


            String coderId = StringUtils.checkNull(getRequest().getParameter("cr"));
            if (coderId.equals("")) {
                throw new TCWebException("Coder id parameter not included in request");
            }

            Request profileRequest = new Request();
            profileRequest.setContentHandle("card_profile_info");
            profileRequest.setProperty("cr", coderId);

            Request distRequest = new Request();
            distRequest.setContentHandle("rating_distribution_graph");

            ResultSetContainer profileRsc =
                    (ResultSetContainer)getDataAccess(DBMS.DW_DATASOURCE_NAME, true).getData(profileRequest).get("card_profile_info");

            ResultSetContainer distRsc =
                    (ResultSetContainer)getDataAccess(DBMS.DW_DATASOURCE_NAME, true).getData(distRequest).get("Rating_Distribution_Graph");


            AttributesImpl emptyAtts = new AttributesImpl();

            hd.startElement("","","memberStats",emptyAtts);

            SimpleDateFormat sdf = new SimpleDateFormat("MM.dd.yyyy");
            DecimalFormat df = new DecimalFormat("0.00");

            addElement(hd, "handle", profileRsc.getStringItem(0, "handle"), emptyAtts);
            addElement(hd, "photo", profileRsc.getStringItem(0, "image_path"), emptyAtts);
            addElement(hd, "algorithmRating", profileRsc.getStringItem(0, "algorithm_rating"), emptyAtts);
            addElement(hd, "algorithmRatingMax", profileRsc.getStringItem(0, "highest_rating"), emptyAtts);
            addElement(hd, "rank", profileRsc.getStringItem(0, "rank"), emptyAtts);
            addElement(hd, "percentile", df.format(profileRsc.getDoubleItem(0, "percentile")), emptyAtts);
            addElement(hd, "memberSince", sdf.format(profileRsc.getItem(0, "member_since").getResultData()), emptyAtts);
            addElement(hd, "lastMatchDate", sdf.format(profileRsc.getItem(0, "last_match").getResultData()), emptyAtts);
            addElement(hd, "bestDvi1", profileRsc.getStringItem(0, "best_div1"), emptyAtts);
            addElement(hd, "bestDiv2", profileRsc.getStringItem(0, "best_div2"), emptyAtts);
            addElement(hd, "competitions", profileRsc.getStringItem(0, "num_competitions"), emptyAtts);
            addElement(hd, "designRating", profileRsc.getStringItem(0, "design_rating"), emptyAtts);
            addElement(hd, "developmentRating", profileRsc.getStringItem(0, "development_rating"), emptyAtts);

            hd.startElement("","", "algorithmRatingDistribution", emptyAtts);
            for (int i=0; i<distRsc.getColumnCount(); i++) {
                addElement(hd, "bucket", distRsc.getStringItem(0, i), emptyAtts);
            }
            hd.endElement("", "", "algorithmRatingDistribution");

            hd.endElement("","","memberStats");
            hd.endDocument();

            getResponse().setContentType("text/xml");
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private void addElement(TransformerHandler hd, String name, String value, Attributes atts) throws Exception {
        String temp = value==null?"":value;
        hd.startElement("", "", name, atts);
        hd.characters(temp.toCharArray(), 0, temp.length());
        hd.endElement("", "", name);

    }
}
