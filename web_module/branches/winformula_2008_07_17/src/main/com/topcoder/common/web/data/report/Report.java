package com.topcoder.common.web.data.report;

import com.topcoder.web.common.TCRequest;

import java.io.Serializable;
import java.util.ArrayList;

public class Report implements Serializable {

    private Integer id;
    private String title;
    private String subTitle;
    private String[] columnHeadings;
    private Query query;
    private ArrayList result;
    private Parameter[] parameters;

    public Report() {
        this.id = new Integer(-1);
        this.title = new String();
        this.subTitle = new String();
        this.columnHeadings = new String[0];
        this.query = new Query();
        this.parameters = new Parameter[0];
        this.result = new ArrayList();
    }

    public Report(Integer id, String title, String[] columnHeadings, Query query) {
        this.id = id;
        this.title = title;
        this.subTitle = new String();
        this.columnHeadings = columnHeadings;
        this.query = query;
        this.parameters = new Parameter[0];
        this.result = new ArrayList();
    }

    public Report(Integer id, String title, String[] columnHeadings, Query query, Parameter[] parameters) {
        this.id = id;
        this.title = title;
        this.subTitle = new String();
        this.columnHeadings = columnHeadings;
        this.query = query;
        this.parameters = parameters;
        this.result = new ArrayList();
    }

    //sets
    public void setId(Integer id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setSubTitle(String subTitle) {
        this.subTitle = subTitle;
    }

    public void setColumnHeadings(String[] columnHeadings) {
        this.columnHeadings = columnHeadings;
    }

    public void setQuery(Query query) {
        this.query = query;
    }

    public void setParameters(Parameter[] parameters) {
        this.parameters = parameters;
    }

    public void setResult(ArrayList result) {
        this.result = result;
    }


    //gets
    public Integer getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getSubTitle() {
        return subTitle;
    }

    public String[] getColumnHeadings() {
        return columnHeadings;
    }

    public Query getQuery() {
        return query;
    }

    public Parameter[] getParameters() {
        return parameters;
    }

    public ArrayList getResult() {
        return result;
    }

    public boolean hasParameters() {
        if (parameters.length > 0) return true;
        return false;
    }

    public String toString() {
        return title;
    }

    public void fillParameters(TCRequest request) {
        for (int i = 0; i < parameters.length; i++)
            parameters[i].setValue(request.getParameter(parameters[i].getColumnName()));
    }

    public boolean hasNullParameter() {
        for (int i = 0; i < parameters.length; i++)
            if (parameters[i].getValue() == null) return true;
        return false;
    }

    public void fillQueryParameters() {
        for (int i = 0; i < parameters.length; i++)
            query.setValue(parameters[i].getValue());
    }
}
