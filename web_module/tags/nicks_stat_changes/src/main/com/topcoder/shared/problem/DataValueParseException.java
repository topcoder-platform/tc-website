package com.topcoder.shared.problem;

public class DataValueParseException
        extends Exception {
    private String message;
    private int line;
    private int column;

    public DataValueParseException(String message) {
        this(message, 0, 0);
    }

    public DataValueParseException(String message, int line, int column) {
        this.message = message;
        this.line = line;
        this.column = column;
    }

    public String getMessage() {
        return message;
    }

    public int getLine() {
        return line;
    }

    public int getColumn() {
        return column;
    }

    public String toString() {
        String result = "";

        if (line != 0)
            result += "Line " + line + ": ";
        if (column != 0)
            result += "Column " + column + ": ";
        return result + message;
    }
}

