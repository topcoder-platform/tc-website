/*
 * PDFGenerator.java
 *
 * Created on January 3, 2005, 1:27 PM
 */

package com.topcoder.web.tc.controller.request.profile;

import java.awt.Color;

import com.lowagie.text.*;
import com.lowagie.text.pdf.*; 

import java.util.List;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.PlacementConfig;
import com.topcoder.common.web.render.*;
import com.topcoder.shared.problem.DataType;
import com.topcoder.shared.problem.TextElement;
import com.topcoder.shared.problem.TestCase;
import java.io.FileOutputStream;
/**
 *
 * @author rfairfax
 */
public class PDFGenerator extends BaseProcessor { 
    
    PlacementConfig info;
    
    private PlacementConfig getConfig() {
        return new PlacementConfig();
    }
    
    protected void businessProcessing() throws TCWebException {
        //load config values
        info = getConfig();
        
        //create document
        Document doc = new Document(PageSize.A4, 35,35,35,35);
        try {
            getResponse().setContentType("application/pdf");
            
            PdfWriter writer = PdfWriter.getInstance(doc,  getResponse().getOutputStream());
            
            //atach events class
            MyPageEvents events = new MyPageEvents();
            writer.setPageEvent(events);
            
            Phrase hp = new Phrase("-", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.NORMAL, Color.BLACK));
            
            HeaderFooter header = new HeaderFooter(new Phrase("  "), false);
            header.setBackgroundColor(new Color(204,0,0)); //#cc0000
            header.setBorder(Rectangle.NO_BORDER);
            
            HeaderFooter footer = new HeaderFooter(hp,hp);
            footer.setAlignment(Element.ALIGN_RIGHT);
            footer.setBorder(Rectangle.NO_BORDER);
            footer.setBackgroundColor(new Color(204,204,204)); //#cccccc
            doc.setHeader(header);
            doc.setFooter(footer);
            
            doc.open();
            
            drawPageOne(doc, info);
            drawPageTwo(doc, info);
            drawPageThree(doc, info);
            drawPageFour(doc, info);
            
            drawResume(doc, info);
            
            doc.close();
            
            //write out the document
            getResponse().getOutputStream().flush();
            getResponse().getOutputStream().close();

            getResponse().flushBuffer();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }    
    
    private void drawPageOne(Document doc, PlacementConfig info) throws Exception {
        Image logo = Image.getInstance("http://www.topcoder.com/i/profile/topcoder_logo_tagline.jpg");
        logo.setAlignment(Element.ALIGN_CENTER);
        logo.scalePercent(60f);
        Paragraph p = new Paragraph(" ");
        doc.add(logo);
        doc.add(p);
        doc.add(p);

        //draw out table
        PdfPTable t = new PdfPTable(2);
        t.setWidthPercentage(90);
        t.setWidths(new int[] {35, 65});

        t.getDefaultCell().setPadding(3);
        t.getDefaultCell().setBorderWidth(0);
        t.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
        t.addCell(new Phrase("Presented to:", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.NORMAL, Color.BLACK)));
        
        if(info.getCompanyLogo().getFile() != null) {
            byte[] b = new byte[(int)info.getCompanyLogo().getSize()];
            info.getCompanyLogo().getInputStream().read(b);
            Image companyLogo = Image.getInstance(b);

            t.addCell(companyLogo);
        } else {
            t.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.NORMAL, Color.BLACK)));
        }

        t.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.NORMAL, Color.BLACK)));
        t.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.NORMAL, Color.BLACK)));

        t.addCell(new Phrase("Presented By:", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.NORMAL, Color.BLACK)));

        Phrase email = new Phrase();
        email.add(new Chunk(info.getPresentedBy(), FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.BLACK)));
        t.addCell(email);

        t.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.NORMAL, Color.BLACK)));

        email = new Phrase();

        Anchor anchor = new Anchor(info.getPresentedByEmail(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.UNDERLINE, new Color(0, 0, 255)));
        anchor.setReference("mailto:" + info.getPresentedByEmail());
        anchor.setName(info.getPresentedByEmail()); 

        email.add(anchor);
        t.addCell(email);


        t.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.NORMAL, Color.BLACK)));
        t.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.NORMAL, Color.BLACK)));

        t.addCell(new Phrase("Member Name:", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.NORMAL, Color.BLACK)));
        t.addCell(new Phrase(info.getName(), FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.BLACK)));

        t.addCell(new Phrase("Handle:", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.NORMAL, Color.BLACK)));
        t.addCell(new Phrase(info.getHandle(), FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.BLACK)));

        doc.add(t);

        doc.newPage();
    }
    
    private void drawPageTwo(Document doc, PlacementConfig info) throws Exception {
        Paragraph p = new Paragraph(" ");
        
        doc.add(p);
            
        PdfPTable t = new PdfPTable(2);
        t.setWidthPercentage(100);
        t.setWidths(new int[] {35, 65});

        t.getDefaultCell().setPadding(3);
        t.getDefaultCell().setBorderWidth(0);
        t.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
        t.getDefaultCell().setVerticalAlignment(Element.ALIGN_TOP);

        PdfPTable skills = new PdfPTable(1);
        skills.setWidthPercentage(100);
        skills.getDefaultCell().setPadding(2);
        skills.getDefaultCell().setBorderWidth(0);
        skills.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);

        skills.addCell(new Phrase("Skills", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.BLACK)));

        java.util.List groups = info.getSkillGroups();
        
        for(int i = 0; i < groups.size(); i++) {
            PdfPTable inner = new PdfPTable(1);
            inner.setWidthPercentage(100);
            inner.getDefaultCell().setPadding(2);
            inner.getDefaultCell().setBorderWidth(1);
            inner.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);

            PdfPCell cell = new PdfPCell(new Phrase((String)groups.get(i), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.BLACK)));
            cell.setBackgroundColor(new Color(0xCC,0xCC,0xCC));
            inner.addCell(cell);
            
            java.util.List skillsList = info.getSkills((String)groups.get(i));

            for(int j = 0 ; j < skillsList.size(); j++) {
                inner.addCell(new Phrase((String)skillsList.get(j), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
            }

            skills.addCell(inner);
        }

        skills.addCell(" ");

        t.addCell(skills);

        PdfPTable ranking = new PdfPTable(1);
        ranking.setWidthPercentage(100);
        ranking.getDefaultCell().setPadding(2);
        ranking.getDefaultCell().setBorderWidth(0);
        ranking.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);

        ranking.addCell(new Phrase("Rating Position Among Members", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.BLACK)));

        //coder ranking table
        PdfPTable inner = new PdfPTable(4);
        inner.setWidthPercentage(100);
        inner.getDefaultCell().setPadding(2);
        inner.getDefaultCell().setBorderWidth(1);
        inner.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);

        PdfPCell cell = new PdfPCell(new Phrase("Coder Ranking (Based on x Events)", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.BLACK)));
        cell.setBackgroundColor(new Color(0xCC,0xCC,0xCC));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setColspan(4);

        inner.addCell(cell);

        cell = new PdfPCell(new Phrase("Rating", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.BLACK)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        inner.addCell(cell);

        inner.addCell(new Phrase("" + info.getRating(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));

        cell = new PdfPCell(new Phrase("Division", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.BLACK)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        inner.addCell(cell);

        inner.addCell(new Phrase(info.getRating() >= 1200 ? "1" : "2", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));

        cell = new PdfPCell(new Phrase("Rank", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.BLACK)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        inner.addCell(cell);

        inner.addCell(new Phrase(info.getRank(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));

        cell = new PdfPCell(new Phrase("Rank %", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.BLACK)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        inner.addCell(cell);

        inner.addCell(new Phrase("" + info.getRankPercentile(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));

        ranking.addCell(inner);
        ranking.addCell(" ");

        Image chart = Image.getInstance("http://www.topcoder.com/graph?c=rating_distribution_graph&width=600&height=400");
        ranking.addCell(chart);

        t.addCell(ranking);

        //lifetime stats

        PdfPTable lifetime = new PdfPTable(2);
        lifetime.setWidthPercentage(100);
        lifetime.getDefaultCell().setPadding(2);
        lifetime.getDefaultCell().setBorderWidth(0);
        lifetime.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);

        cell = new PdfPCell(new Phrase("Lifetime Competition Statistics", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.BLACK)));
        cell.setColspan(2);
        cell.setBorderWidth(0);
        lifetime.addCell(cell);

        PdfPTable competitors = new PdfPTable(2);
        competitors.setWidthPercentage(100);
        competitors.getDefaultCell().setPadding(2);
        competitors.getDefaultCell().setBorderWidth(1);
        competitors.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);

        cell = new PdfPCell(new Phrase("Challenges Against Competitors", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.BLACK)));
        cell.setBackgroundColor(new Color(0xCC,0xCC,0xCC));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        cell.setColspan(2);

        competitors.addCell(cell);

        cell = new PdfPCell(new Phrase("Total Challenged", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.BLACK)));
        cell.setBorderWidth(1);
        competitors.addCell(cell);

        competitors.addCell(new Phrase(info.getTotalChallenged(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));

        cell = new PdfPCell(new Phrase("Challenge Success Ratio", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.BLACK)));
        cell.setBorderWidth(1);
        competitors.addCell(cell);

        competitors.addCell(new Phrase(info.getChallengeSuccessRatio(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));

        lifetime.addCell(competitors);

        PdfPTable solutions = new PdfPTable(2);
        solutions.setWidthPercentage(100);
        solutions.getDefaultCell().setPadding(2);
        solutions.getDefaultCell().setBorderWidth(1);
        solutions.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);

        cell = new PdfPCell(new Phrase("Solutions Submitted", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.BLACK)));
        cell.setBackgroundColor(new Color(0xCC,0xCC,0xCC));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        cell.setColspan(2);

        solutions.addCell(cell);

        cell = new PdfPCell(new Phrase("Submission Ratio", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.BLACK)));
        cell.setBorderWidth(1);
        solutions.addCell(cell);

        solutions.addCell(new Phrase(info.getSubmissionRatio(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));

        cell = new PdfPCell(new Phrase("Submission Success Ratio", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.BLACK)));
        cell.setBorderWidth(1);
        solutions.addCell(cell);

        solutions.addCell(new Phrase(info.getSubmissionSuccessRatio(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));

        lifetime.addCell(solutions);

        cell = new PdfPCell(lifetime);
        cell.setColspan(2);
        cell.setBorderWidth(0);
        t.addCell(cell);

        doc.add(t);

        doc.newPage();
    }
    
    public void drawPageThree(Document doc, PlacementConfig info) throws Exception {
        //selected problem
        Paragraph p = new Paragraph(" ");
        
        PdfPTable problemStats = new PdfPTable(3);
        problemStats.setWidthPercentage(100);
        problemStats.getDefaultCell().setPadding(2);
        problemStats.getDefaultCell().setBorderWidth(1);
        problemStats.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);

        PdfPCell cell = new PdfPCell(new Phrase("Code Sample For:", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.BLACK)));
        cell.setBorderWidth(1);
        problemStats.addCell(cell);

        cell = new PdfPCell(new Phrase(info.getProblemName(), FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.BLACK)));
        cell.setBorderWidth(1);
        cell.setColspan(2);
        problemStats.addCell(cell);

        cell = new PdfPCell(new Phrase("Division Statistics", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.BLACK)));
        cell.setBorderWidth(1);
        cell.setColspan(2);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBackgroundColor(new Color(0xCC,0xCC,0xCC));
        problemStats.addCell(cell);

        cell = new PdfPCell(new Phrase("[" + info.getHandle() + "]'s Statistics", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.BLACK)));
        cell.setBorderWidth(1);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBackgroundColor(new Color(0xCC,0xCC,0xCC));
        problemStats.addCell(cell);

        problemStats.addCell(new Phrase("Average Elapsed Time to Submit", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.BLACK)));

        cell = new PdfPCell(new Phrase(info.getAvgTimeToSubmit(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
        cell.setBorderWidth(1);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        problemStats.addCell(cell);

        cell = new PdfPCell(new Phrase(info.getSubmissionTime(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
        cell.setBorderWidth(1);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        problemStats.addCell(cell);

        problemStats.addCell(new Phrase("Total Submission %", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.BLACK)));

        cell = new PdfPCell(new Phrase(info.getSubmissionPercent(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
        cell.setBorderWidth(1);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        problemStats.addCell(cell);

        cell = new PdfPCell(new Phrase("Submitted", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
        cell.setBorderWidth(1);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        problemStats.addCell(cell);

        problemStats.addCell(new Phrase("Successful Submission %", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.BLACK)));

        cell = new PdfPCell(new Phrase(info.getSuccessfulSubmissionPercent(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
        cell.setBorderWidth(1);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        problemStats.addCell(cell);

        cell = new PdfPCell(new Phrase("Successful", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
        cell.setBorderWidth(1);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        problemStats.addCell(cell);

        doc.add(problemStats);

        doc.add(p);

        PdfPTable problem = new PdfPTable(1);
        problem.setWidthPercentage(100);
        problem.getDefaultCell().setPadding(2);
        problem.getDefaultCell().setBorderWidth(0);
        problem.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);

        cell = new PdfPCell(new Phrase("Problem Statement", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.BLACK)));
        cell.setBorderWidth(0);
        cell.setBackgroundColor(new Color(0xCC,0xCC,0xCC));
        problem.addCell(cell);

        TextElementRenderer tr = new TextElementRenderer((TextElement)info.getProblem().getComponent(0).getIntro());
        
        Phrase statement = new Phrase();
        statement.add(new Paragraph(tr.toPlainText(info.getLanguage()), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));

        problem.addCell(statement);

        cell = new PdfPCell(new Phrase("Definition", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.BLACK)));
        cell.setBorderWidth(0);
        cell.setBackgroundColor(new Color(0xCC,0xCC,0xCC));
        problem.addCell(cell);

        PdfPTable def = new PdfPTable(3);
        def.setWidthPercentage(100);
        def.getDefaultCell().setPadding(2);
        def.getDefaultCell().setBorderWidth(0);
        def.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
        def.setWidths(new int[] {5, 20, 75});

        def.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
        def.addCell(new Phrase("Class:", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
        def.addCell(new Phrase(info.getProblem().getComponent(0).getClassName(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));

        def.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
        def.addCell(new Phrase("Method:", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
        def.addCell(new Phrase(info.getProblem().getComponent(0).getMethodName(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));

        String params = "";
        DataType[] paramTypes = info.getProblem().getComponent(0).getParamTypes();
        for (int i = 0; i < paramTypes.length; i++) {
            if (i > 0)
                params += ", ";
            params += new DataTypeRenderer(paramTypes[i]).toPlainText(info.getLanguage());
        }
        
        def.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
        def.addCell(new Phrase("Parameters:", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
        def.addCell(new Phrase(params, FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));

        def.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
        def.addCell(new Phrase("Returns:", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
        def.addCell(new Phrase(new DataTypeRenderer(info.getProblem().getComponent(0).getReturnType()).toPlainText(info.getLanguage()), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));

        def.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
        def.addCell(new Phrase("Method Signature:", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
        def.addCell(new Phrase(info.getLanguage().getMethodSignature(info.getProblem().getComponent(0).getMethodName(),
                info.getProblem().getComponent(0).getReturnType(),
                info.getProblem().getComponent(0).getParamTypes(),
                info.getProblem().getComponent(0).getParamNames()), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));

        def.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
        def.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
        def.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));

        problem.addCell(def);

        cell = new PdfPCell(new Phrase("Notes", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.BLACK)));
        cell.setBorderWidth(0);
        cell.setBackgroundColor(new Color(0xCC,0xCC,0xCC));
        problem.addCell(cell);

        PdfPTable notes = new PdfPTable(2);
        notes.setWidthPercentage(100);
        notes.getDefaultCell().setPadding(2);
        notes.getDefaultCell().setBorderWidth(0);
        notes.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
        notes.setWidths(new int[] {5, 95});

        com.topcoder.shared.problem.Element[] notesElements = info.getProblem().getComponent(0).getNotes();
        
        for(int i = 0; i < notesElements.length; i++) {
            notes.addCell(new Phrase("-", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
            notes.addCell(new Phrase(new TextElementRenderer((TextElement)notesElements[i]).toPlainText(info.getLanguage()), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
        }

        notes.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
        notes.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));

        problem.addCell(notes);

        cell = new PdfPCell(new Phrase("Constraints", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.BLACK)));
        cell.setBorderWidth(0);
        cell.setBackgroundColor(new Color(0xCC,0xCC,0xCC));
        problem.addCell(cell);

        PdfPTable constraints = new PdfPTable(2);
        constraints.setWidthPercentage(100);
        constraints.getDefaultCell().setPadding(2);
        constraints.getDefaultCell().setBorderWidth(0);
        constraints.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
        constraints.setWidths(new int[] {5, 95});
        
        com.topcoder.shared.problem.Element[] constraintsElements = info.getProblem().getComponent(0).getNotes();
        
        for(int i = 0; i < constraintsElements.length; i++) {
            constraints.addCell(new Phrase("-", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
            constraints.addCell(new Phrase(new TextElementRenderer((TextElement)constraintsElements[i]).toPlainText(info.getLanguage()), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
        }

        constraints.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
        constraints.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));

        problem.addCell(constraints);

        cell = new PdfPCell(new Phrase("Examples", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.BLACK)));
        cell.setBorderWidth(0);
        cell.setBackgroundColor(new Color(0xCC,0xCC,0xCC));
        problem.addCell(cell);
        
        TestCase[] testCases = info.getProblem().getComponent(0).getTestCases();

        int j = 0;
        
        for(int i =0; i < testCases.length; i++) {
            if(testCases[i].isExample()) {
                cell = new PdfPCell(new Phrase(j + ")", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
                j++;
                cell.setBorderWidth(0);
                problem.addCell(cell);

                PdfPTable example = new PdfPTable(2);
                example.setWidthPercentage(100);
                example.getDefaultCell().setPadding(2);
                example.getDefaultCell().setBorderWidth(0);
                example.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
                example.setWidths(new int[] {5, 95});
                
                for(int k = 0; k < testCases[i].getInput().length; k++) {
                    example.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.COURIER, 12, Font.NORMAL, Color.BLACK)));
                    example.addCell(new Phrase(testCases[i].getInput()[k], FontFactory.getFont(FontFactory.COURIER, 12, Font.NORMAL, Color.BLACK)));
                }


                example.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.COURIER, 12, Font.NORMAL, Color.BLACK)));
                example.addCell(new Phrase(testCases[i].getOutput(), FontFactory.getFont(FontFactory.COURIER, 12, Font.NORMAL, Color.BLACK)));

                if(testCases[i].getAnnotation() != null) {
                    example.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
                    example.addCell(new Phrase(new TextElementRenderer((TextElement)testCases[i].getAnnotation()).toPlainText(info.getLanguage()), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
                }
                
                problem.addCell(example);
            }
        }

        problem.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));
        problem.addCell(new Phrase("This problem statement is the exclusive and proprietary property of TopCoder, Inc.  Any unauthorized use or reproduction of this information without prior written consent of TopCoder, Inc. is strictly prohibited.  (c) 2004 TopCoder, Inc.  All rights reserved.", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.BLACK)));

        doc.add(problem);

        doc.newPage();
    }
    
    public void drawPageFour(Document doc, PlacementConfig info) throws Exception {
        PdfPTable submission = new PdfPTable(1);
        submission.setWidthPercentage(100);
        submission.getDefaultCell().setPadding(2);
        submission.getDefaultCell().setBorderWidth(0);
        submission.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);

        PdfPCell cell = new PdfPCell(new Phrase("[" + info.getHandle() + "]'s Submission", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.BLACK)));
        cell.setBorderWidth(0);
        cell.setBackgroundColor(new Color(0xCC,0xCC,0xCC));
        submission.addCell(cell);

        submission.addCell(new Phrase(info.getSubmissionText(), FontFactory.getFont(FontFactory.COURIER, 12, Font.NORMAL, Color.BLACK)));

        doc.add(submission);

        doc.newPage();
    }
    
    public void drawResume(Document doc, PlacementConfig info) throws Exception {
        doc.add(new Phrase("RESUME HERE"));    
    }
    
    final class MyPageEvents extends PdfPageEventHelper {
        // This is the contentbyte object of the writer
        PdfContentByte cb;

        public void onStartPage(PdfWriter writer, Document document) {
            try {
                if(writer.getPageNumber() > 1) {
                    cb = writer.getDirectContent();
                    cb.beginText();
                    cb.setColorFill(Color.WHITE);
                    cb.setColorStroke(Color.WHITE);
                    cb.setFontAndSize(BaseFont.createFont(BaseFont.HELVETICA_BOLD, BaseFont.CP1252, BaseFont.NOT_EMBEDDED ), 14);
                    cb.setTextMatrix(200, 810);
                    cb.showText("Member Profile for [" + info.getHandle() + "]");
                    cb.endText();
                }
            }
            catch(Exception e) {
                e.printStackTrace();
                System.err.println(e.getMessage());
            }
            
        }
        
        // we override the onEndPage method
        public void onEndPage(PdfWriter writer, Document document) {
            
            try {
                //super.onEndPage(writer, document);
                Image footerimg = Image.getInstance("http://www.topcoder.com/i/profiles/topcoder_logo_footer.jpg");
                footerimg.setAlignment(Element.ALIGN_LEFT);
                footerimg.scalePercent(70f);

                footerimg.setAbsolutePosition(45,30);

                cb = writer.getDirectContent();
                cb.addImage(footerimg);
            
            }
            catch(Exception e) {
                e.printStackTrace();
                System.err.println(e.getMessage());
            }
        }

    }

    
}
