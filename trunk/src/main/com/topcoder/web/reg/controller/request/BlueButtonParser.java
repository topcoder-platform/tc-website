/*
 * Copyright (C)  2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg.controller.request;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * <p>The parser to parse the blue button data.</p>
 * 
 * <p>
 * Currently it will only collect the "DoD MOS/Occupation Codes" table under "DOD MILITARY SERVICE INFORMATION" section.
 * It's easy to add more tables by adding the predefined data to {@link #SECTION_TABLES} field in the class static section.
 * </p>
 * 
 * @author TCSASSEMBER
 * @version 1.0
 */
public class BlueButtonParser {
    /**
     * Represents the table name of "DoD MOS/Occupation Codes" table.
     */
    public static final String DOD_MOS_CODES_TABLE = "DoD MOS/Occupation Codes";
    
    /**
     * This class will hold the result table data parsed by this parser.
     * 
     * @author TCSASSEMBER
     * @version 1.0
     */
    public static class ResultDataTable {
        /**
         * Represents the columns of the table.
         */
        private List<String> columns;
        /**
         * Represents the rows of the table.
         */
        private List<List<String>> rows;
        
        /**
         * Default constructor.
         */
        public ResultDataTable() {
            this.columns = new ArrayList<String>();
            this.rows = new ArrayList<List<String>>();
        }

        /**
         * Gets the columns of the table.
         * 
         * @return the columns of the table.
         */
        public List<String> getColumns() {
            return columns;
        }

        /**
         * Sets the columns of the table.
         * 
         * @param columns the columns of the table.
         */
        public void setColumns(List<String> columns) {
            this.columns = columns;
        }

        /**
         * Gets the rows of the table.
         * 
         * @return the rows of the table.
         */
        public List<List<String>> getRows() {
            return rows;
        }

        /**
         * Sets the rows of the table.
         * 
         * @param rows the rows of the table.
         */
        public void setRows(List<List<String>> rows) {
            this.rows = rows;
        }
    }
    
    /**
     * This class will hold the result data parsed by this parser.
     * 
     * @author TCSASSEMBER
     * @version 1.0
     */
    public static class ResultData {
        /**
         * Represents all the tables. The key is the table name, the value is the table.
         */
        private Map<String, ResultDataTable> tables;
        
        /**
         * Default constructor.
         */
        public ResultData() {
            this.tables = new HashMap<String, ResultDataTable>();
        }

        /**
         * Gets all the tables.
         * 
         * @return all the tables.
         */
        public Map<String, ResultDataTable> getTables() {
            return tables;
        }

        /**
         * Sets all the tables.
         * 
         * @param tables all the tables.
         */
        public void setTables(Map<String, ResultDataTable> tables) {
            this.tables = tables;
        }
    }
    
    /**
     * Represents the regular pattern which used by skipped.
     */
    private static final List<Pattern> ALWAYS_SKIP_LINES = Arrays.asList(new Pattern[] {
            Pattern.compile("^[-]+$"),
            Pattern.compile("^[-]+[ ]+$"),
            Pattern.compile("^[ ]+[-]+"),
            Pattern.compile("^[=]+$"),
            Pattern.compile("^(- ){5,}"),
            Pattern.compile("END OF MY HEALTHEVET")
    });
    
    /**
     * This class defines the table information which should be parsed by this parser.
     * 
     * @author TCSASSEMBER
     * @version 1.0
     */
    private static class Table {
        /**
         * Represents the table name.
         */
        String name;
        /**
         * Represents the text which indicates the starting of the table.
         */
        String startWith;
        /**
         * Represents the columns names of the table.
         */
        List<String> columns;
        
        /**
         * Constructor.
         *  
         * @param name the table name.
         * @param startWith the text which indicates the starting of the table.
         * @param columns the columns names of the table.
         */
        Table(String name, String startWith, String[] columns) {
            this.name = name;
            this.startWith = startWith;
            this.columns = Arrays.asList(columns);
        }
    }
    
    /**
     * This class defines the table data information.
     * 
     * @author TCSASSEMBER
     * @version 1.0
     */
    private static class TableInfo {
        /**
         * Represents the columns names of the table.
         */
        List<String> columns;
        /**
         * Represents the starting index of each column.
         */
        List<Integer> widths;
    }
    
    /**
     * Represents the predefined tables which should be parsed by the parser.
     */
    private static final Map<String, List<Table>> SECTION_TABLES = new HashMap<String, List<Table>>();
    /**
     * Represents the predefined line patterns which should be skipped by the parser.
     */
    private static final Map<String, List<Pattern>> SECTION_SKIPLINES = new HashMap<String, List<Pattern>>();
    
    /**
     * Initialize the static fields.
     */
    static {
        List<Table> tables = new ArrayList<Table>();
        tables.add(new Table(DOD_MOS_CODES_TABLE, "-- Note: Both Service and DoD Generic codes", new String[] {
                "Service",
                "Begin Date",
                "Enl/Off",
                "Type",
                "Svc Occ Code",
                "DoD Occ Code"
        }));
        SECTION_TABLES.put("DOD MILITARY SERVICE INFORMATION", tables);
        SECTION_SKIPLINES.put("DOD MILITARY SERVICE INFORMATION", Arrays.asList(new Pattern[] {Pattern.compile("^Translations of Codes Used in this Section")}));
    }
    
    /**
     * Represents the current section.
     */
    private String currentSection;
    /**
     * Represents the current table.
     */
    private Table currentTable;
    /**
     * Represents the current table information.
     */
    private TableInfo currentTableInfo;
    
    /**
     * Constructor.
     */
    public BlueButtonParser() {
    }
    
    /**
     * Checks whether the line starts a new section.
     * 
     * @param line the line.
     * @return true if the line starts a new section, false otherwise.
     */
    private boolean newSection(String line) {
        Pattern pattern = Pattern.compile("^[-]+ (.*) [-]+");
        Matcher matcher = pattern.matcher(line);
        if (matcher.find()) {
            currentSection = matcher.group(1);
            currentTable = null;
            return true;
        }
        return false;
    }
    
    /**
     * Checks whether the line starts a new collection.
     * 
     * @param line the line.
     * @return true if the line starts a new collection, false otherwise.
     */
    private boolean newCollection(String line) {
        if (currentSection != null && SECTION_TABLES.containsKey(currentSection)) {
            // tables
            for (Table table : SECTION_TABLES.get(currentSection)) {
                if (line.matches("^" + table.startWith + ".*")) {
                    currentTable = table;
                    return true;
                }
            }
        }
        return false;
    }
    
    /**
     * Join the string list.
     * 
     * @param values the string list.
     * @param conjunction the conjunction used to join.
     * @return the joined string.
     */
    private static String join(List<String> values, String conjunction) {
        StringBuilder builder = new StringBuilder();
        for (String v : values) {
            if (builder.length() > 0) {
                builder.append(conjunction);
            }
            builder.append(v);
        }
        return builder.toString();
    }
    
    /**
     * Checks whether the line is a table column header, and if yes, parse the table column header.
     * 
     * @param line the line to be parsed.
     * @return true if line is a table column header, false otherwise.
     */
    private boolean parseTableColumnHead(String line) {
        String p = ".?" + join(currentTable.columns, ".*") + ".?";
        if (line.matches(p)) {
            currentTableInfo = new TableInfo();
            currentTableInfo.columns = currentTable.columns;
            currentTableInfo.widths = new ArrayList<Integer>();
            for (String c : currentTable.columns) {
                currentTableInfo.widths.add(line.indexOf(c));
            }
            currentTableInfo.widths.add(line.length());
            return true;
        }
        return false;
    }
    
    /**
     * Parse a table row data.
     * 
     * @param line the line containing the table row data.
     * @return the table row data.
     */
    private List<String> parseTableRow(String line) {
        List<String> row = new ArrayList<String>();
        for (int i = 0; i < currentTableInfo.widths.size() - 1; i++) {
            String col = line.substring(currentTableInfo.widths.get(i), Math.min(currentTableInfo.widths.get(i + 1), line.length()));
            row.add(col.trim());
        }
        return row;
    }
    
    /**
     * Parse the blue button content.
     * 
     * @return is the input stream containing the parsed data.
     * @throws IOException if any error occurs when reading the data.
     */
    public ResultData parse(InputStream is) throws IOException {
        currentSection = null;
        currentTable = null;
        currentTableInfo = null;
        
        ResultData resultData = new ResultData();
        BufferedReader reader = new BufferedReader(new InputStreamReader(is));
        String line;
        
        try {
            while ((line = reader.readLine()) != null) {
                // TODO: should be removed later
                System.out.println(line);
                boolean skip = false;
                for (Pattern p : ALWAYS_SKIP_LINES) {
                    if (p.matcher(line).find()) {
                        skip = true;
                        break;
                    }
                }
                if (skip) {
                    continue;
                }
                if (currentSection != null && SECTION_SKIPLINES.containsKey(currentSection)) {
                    for (Pattern p : SECTION_SKIPLINES.get(currentSection)) {
                        if (p.matcher(line).find()) {
                            skip = true;
                            break;
                        }
                    }
                    if (skip) {
                        continue;
                    }
                }
                
                if (currentSection != null && newCollection(line)) {
                    continue;
                }
                
                if (currentTable != null) {
                    if (line.trim().length() == 0) {
                        // end of table
                        currentTable = null;
                        currentTableInfo = null;
                        continue;
                    }
                    
                    if (currentTableInfo != null) {
                        // get the table row data
                        List<String> row = parseTableRow(line);
                        resultData.tables.get(currentTable.name).rows.add(row);
                        continue;
                    } else {
                        // start table column
                        if (parseTableColumnHead(line)) {
                            resultData.tables.put(currentTable.name, new ResultDataTable());
                            resultData.tables.get(currentTable.name).columns = currentTableInfo.columns;
                            continue;
                        }
                    }
                }
                
                if (newSection(line)) {
                    continue;
                }
            }
            return resultData;
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                }
            }
        }
    }
}