package com.topcoder.shared.problem;

import com.topcoder.shared.netCommon.*;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;

public class SimpleComponent
        implements Serializable, CustomSerializable {
    int problemID;
    int componentID;
    int componentTypeID;
    String className;
    String methodName;
    DataType[] paramTypes;
    DataType returnType;
    ArrayList componentDependencies = new ArrayList();
    ArrayList webServiceDependencies = new ArrayList();

    public SimpleComponent() {
    }

    public void customWriteObject(CSWriter writer)
            throws IOException {
        writer.writeString(className);
        writer.writeString(methodName);
        writer.writeObject(returnType);
        writer.writeObjectArray(paramTypes);
        writer.writeInt(componentID);
        writer.writeInt(componentTypeID);
        writer.writeInt(problemID);
        writer.writeArrayList(webServiceDependencies);
    }

    public void customReadObject(CSReader reader)
            throws IOException {
        Object[] o_paramTypes;

        className = reader.readString();
        methodName = reader.readString();
        returnType = (DataType) reader.readObject();
        o_paramTypes = reader.readObjectArray();
        componentID = reader.readInt();
        componentTypeID = reader.readInt();
        problemID = reader.readInt();

        if (o_paramTypes == null)
            o_paramTypes = new Object[0];
        paramTypes = new DataType[o_paramTypes.length];
        for (int i = 0; i < o_paramTypes.length; i++)
            paramTypes[i] = (DataType) o_paramTypes[i];
        webServiceDependencies = reader.readArrayList();
    }

    public int getProblemID() {
        return problemID;
    }

    public void setProblemID(int problemID) {
        this.problemID = problemID;
    }

    public int getComponentID() {
        return componentID;
    }

    public void setComponentID(int componentID) {
        this.componentID = componentID;
    }

    public int getComponentTypeID() {
        return componentTypeID;
    }

    public void setComponentTypeID(int componentTypeID) {
        this.componentTypeID = componentTypeID;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

    public DataType[] getParamTypes() {
        return paramTypes;
    }

    public void setParamTypes(DataType[] paramTypes) {
        this.paramTypes = paramTypes;
    }

    public DataType getReturnType() {
        return returnType;
    }

    public void setReturnType(DataType returnType) {
        this.returnType = returnType;
    }

    public static String getCacheKey(int componentID) {
        return "SimpleProblemComponent." + componentID;
    }

    public String getCacheKey() {
        return "SimpleProblemComponent." + componentID;
    }

    /**
     * @param language the languageID
     * @return the return type for the languageID
     */
    public String getReturnType(int language) {
        return returnType.getDescriptor(language);
    }
//    /**
//     * @deprecated
//     */
//    public String getResultType(){
//        return returnType.getDescriptor(ContestConstants.JAVA);
//    }
//    /**
//     * @deprecated
//     * for old stuff, just gets array list of java types.
//     */
//    public ArrayList getArgs(){
//        ArrayList ret = new ArrayList();
//        for(int i = 0; i<paramTypes.length;i++){
//            ret.add(paramTypes[i].getDescriptor(ContestConstants.JAVA));
//        }
//        return ret;
//    }


    public boolean hasComponentDependencies() {
        return componentDependencies.size() > 0;
    }

    public boolean hasWebServiceDependencies() {
        return webServiceDependencies.size() > 0;
    }

    public Iterator getComponentDependencies() {
        return componentDependencies.iterator();
    }

    public Iterator getWebServiceDependencies() {
        return webServiceDependencies.iterator();
    }

    public void addWebServiceDependency(int webServiceID) {
        webServiceDependencies.add(new Integer(webServiceID));
    }

    public void addComponentDependency(int componentID) {
        componentDependencies.add(new Integer(componentID));
    }

    public String toString() {
        StringBuffer ret = new StringBuffer(1000);
        ret.append("(com.topcoder.shared.problem.SimpleComponent) [");
        ret.append("problemID = ");
        ret.append(problemID);
        ret.append(", ");
        ret.append("componentID = ");
        ret.append(componentID);
        ret.append(", ");
        ret.append("componentTypeID = ");
        ret.append(componentTypeID);
        ret.append(", ");
        ret.append("className = ");
        if (className == null) {
            ret.append("null");
        } else {
            ret.append(className.toString());
        }
        ret.append(", ");
        ret.append("methodName = ");
        if (methodName == null) {
            ret.append("null");
        } else {
            ret.append(methodName.toString());
        }
        ret.append(", ");
        ret.append("paramTypes = ");
        if (paramTypes == null) {
            ret.append("null");
        } else {
            ret.append("{");
            for (int i = 0; i < paramTypes.length; i++) {
                ret.append(paramTypes[i].toString() + ",");
            }
            ret.append("}");
        }
        ret.append(", ");
        ret.append("returnType = ");
        if (returnType == null) {
            ret.append("null");
        } else {
            ret.append(returnType.toString());
        }
        ret.append(", ");
        ret.append("componentDependencies = ");
        if (componentDependencies == null) {
            ret.append("null");
        } else {
            ret.append(componentDependencies.toString());
        }
        ret.append(", ");
        ret.append("webServiceDependencies = ");
        if (webServiceDependencies == null) {
            ret.append("null");
        } else {
            ret.append(webServiceDependencies.toString());
        }
        ret.append(", ");
        ret.append("]");
        return ret.toString();
    }
}
