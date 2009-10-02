package com.topcoder.web.tc.controller.request.util;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TreeMap;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class ReliabilityBonusCalculator {
    
    private static final String INPUT_FILENAME = "paymentRanges.xml";
    
    private static ReliabilityBonusCalculator instance = null;

    /**
     * This variable saves information about bonuses.
     */
    private TreeMap<Date,TreeMap<Long, TreeMap<Double, Double>>> bonusTable;
    
    protected ReliabilityBonusCalculator() throws Exception {
        parseReliabilityDetails(INPUT_FILENAME);
    }
    
    public static ReliabilityBonusCalculator getInstance() throws Exception {
        if (instance == null) {
            synchronized (ReliabilityBonusCalculator.class) {
                if (instance == null) {
                    instance = new ReliabilityBonusCalculator();
                }
            }
        }
        
        return instance;
    }

    public double getReliabilityPercent(double reliability, Date reliabilityDate, long projectTypeId) {
        Date startDate = new Date();
        for (Date date : bonusTable.keySet()) {
            if (date.compareTo(reliabilityDate) > 0) break;
            startDate = date;
        }
        
        TreeMap<Long, TreeMap<Double, Double>> categoryMap = bonusTable.get(startDate);
        Long cId = new Long(0);
        if (categoryMap.containsKey(new Long(projectTypeId))) {
            cId = new Long(projectTypeId);
        }
    
        TreeMap<Double, Double> bonus = categoryMap.get(cId);
        double reliabilityValue = .0;
        for (double rel : bonus.keySet()) {
            if (rel > reliability) break;
            reliabilityValue = rel;
        }
        return bonus.get(new Double(reliabilityValue));
    }

    private void parseReliabilityDetails(String reliabilityFilename) throws Exception {
        bonusTable = new TreeMap<Date,TreeMap<Long, TreeMap<Double, Double>>>();
        DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
        Document doc = docBuilder.parse(
        		new File(ReliabilityBonusCalculator.class.getClassLoader().getResource(reliabilityFilename).getFile()));
        doc.getDocumentElement().normalize();
    
        NodeList paymentRangesList = doc.getElementsByTagName("paymentRange");
    
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm a");
    
        for (int i = 0; i < paymentRangesList.getLength(); ++i) {
            Element paymentRange = (Element) paymentRangesList.item(i);
            Node startDateAttr =  paymentRange.getAttributes().getNamedItem("startDate");
            Date startDate;
            if (startDateAttr != null) {
                startDate = df.parse(startDateAttr.getNodeValue());
            } else {
                startDate = df.parse("1900-01-01 01:00 AM");
            }
            
            NodeList projectCategoryList = doc.getElementsByTagName("projectCategory");
            TreeMap<Long, TreeMap<Double, Double>> projectCategoryMap = new TreeMap<Long, TreeMap<Double, Double>>();
            projectCategoryMap.put(new Long(0),new TreeMap<Double, Double>());
            for (int k = 0; k < projectCategoryList.getLength(); k++) {
                Element projectCategory = (Element) projectCategoryList.item(k);
                Node categoryAttr =  projectCategory.getAttributes().getNamedItem("category");
                long categoryId = 0;
                if (categoryAttr != null) {
                    categoryId = new Long(Long.parseLong(categoryAttr.getNodeValue()));
                }
            	            	
            	NodeList reliabilities = projectCategory.getElementsByTagName("reliabilityAbove");
            	TreeMap<Double, Double> reliabilitiesMap = new TreeMap<Double, Double>();
            	reliabilitiesMap.put(0.0, 0.0);
            	for (int j = 0; j < reliabilities.getLength(); ++j) {
                	NamedNodeMap attr = reliabilities.item(j).getAttributes();
                	double reliabilityValue = Double.parseDouble(attr.getNamedItem("reliability").getNodeValue());
                	double paymentPercentage = Double.parseDouble(attr.getNamedItem("paymentPercentage").getNodeValue());
                	reliabilitiesMap.put(reliabilityValue, paymentPercentage);
            	}
            	projectCategoryMap.put(categoryId,reliabilitiesMap);
            }
           
            bonusTable.put(startDate,  projectCategoryMap);
        }
    }
}
