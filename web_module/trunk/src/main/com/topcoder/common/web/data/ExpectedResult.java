package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;
import java.util.ArrayList;

public final class ExpectedResult implements Serializable, TagRenderer {

    private int problemId;
    private int testCaseId;
    private String resultType;
    private ArrayList resultValue;
    private ArrayList argListTypes;
    private int Matrix2DRows;
    private String Matrix2DType;
    private String modified;


    public ExpectedResult() {
        problemId = 0;
        testCaseId = 0;
        resultType = "";
        resultValue = new ArrayList();
        argListTypes = new ArrayList();
        Matrix2DRows = 0;
        Matrix2DType = "";
        modified = "";
    }

    // set
    public void setProblemId(int problemId) {
        this.problemId = problemId;
    }

    public void setTestCaseId(int testCaseId) {
        this.testCaseId = testCaseId;
    }

    public void setResultType(String resultType) {
        this.resultType = resultType;
    }

    public void setResultValue(ArrayList resultValue) {
        this.resultValue = resultValue;
    }

    public void setArgListTypes(ArrayList argListTypes) {
        this.argListTypes = argListTypes;
    }

    public void setMatrix2DRows(int Matrix2DRows) {
        this.Matrix2DRows = Matrix2DRows;
    }

    public void setMatrix2DType(String Matrix2DType) {
        this.Matrix2DType = Matrix2DType;
    }

    public void setModified(String modified) {
        this.modified = modified;
    }

    // get
    public int getProblemId() {
        return problemId;
    }

    public int getTestCaseId() {
        return testCaseId;
    }

    public String getResultType() {
        return resultType;
    }

    public ArrayList getResultValue() {
        return resultValue;
    }

    public ArrayList getArgListTypes() {
        return argListTypes;
    }

    public int getMatrix2DRows() {
        return Matrix2DRows;
    }

    public String getMatrix2DType() {
        return Matrix2DType;
    }

    public String getModified() {
        return modified;
    }


    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("ExpectedResult");
            result.addTag(new ValueTag("ProblemId", problemId));
            result.addTag(new ValueTag("TestCaseId", testCaseId));
            result.addTag(new ValueTag("ResultType", resultType));
            if (resultType.equals("ArrayList")) {
                RecordTag arrayListTag = null;
                for (int i = 0; i < argListTypes.size(); i++) {
                    arrayListTag = new RecordTag("ArrayList");
                    arrayListTag.addTag(new ValueTag("ArrayListType", (String) argListTypes.get(i)));
                    if (resultValue.size() > 0) {
                        arrayListTag.addTag(new ValueTag("ArrayListValue", ((Object) resultValue.get(i)).toString()));
                    }
                    result.addTag(arrayListTag);
                }

            } else if (resultType.equals("Matrix2D")) {
                result.addTag(new ValueTag("Matrix2DRows", Matrix2DRows));
                result.addTag(new ValueTag("Matrix2DType", Matrix2DType));

                RecordTag rowTag = null;
                ArrayList matrix2DRow = null;

                for (int i = 0; i < Matrix2DRows; i++) {
                    rowTag = new RecordTag("Matrix2D");

                    //if there are argument values then create new "Value" tags for each
                    //otherwise, just an empty "Matrix2D" tag will be created
                    if (resultValue.size() > 0) {
                        matrix2DRow = (ArrayList) resultValue.get(i);

                        rowTag.addTag(new ValueTag("Value", buildCommaString(matrix2DRow)));

                    }
                    result.addTag(rowTag);
                }

            } else {
                if (resultValue.size() > 0) {
                    result.addTag(new ValueTag("ResultValue", ((Object) resultValue.get(0)).toString()));
                }
            }
            result.addTag(new ValueTag("Modified", modified));
        } catch (Exception e) {
            throw new Exception("common.web.data.ExpectedResult getXML ERROR: " + e);
        }
        return result;
    }

    /**
     *
     * @param ArrayList of values
     * @return String of values separated by commas
     */
    private static String buildCommaString(ArrayList values) {
        StringBuffer resultBuffer = new StringBuffer();

        for (int i = 0; i < values.size(); i++) {
            resultBuffer.append(((Object) values.get(i)).toString());

            if ((i + 1) != values.size()) {
                resultBuffer.append(",");
            }
        }

        return resultBuffer.toString();
    }
}
