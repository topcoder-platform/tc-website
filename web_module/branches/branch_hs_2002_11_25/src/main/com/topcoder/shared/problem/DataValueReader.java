package com.topcoder.shared.problem;

import java.io.*;

public class DataValueReader {
    private PushbackReader reader;
    private int line, column, prevcolumn = -1;
    private boolean eof = false;

    public DataValueReader(String text)
            throws IOException {
        this(text, 1, 1);
    }

    public DataValueReader(String text, int line, int column)
            throws IOException {
        this(new StringReader(text), line, column);
    }

    public DataValueReader(Reader reader)
            throws IOException {
        this(reader, 1, 1);
    }

    public DataValueReader(Reader reader, int line, int column)
            throws IOException {
        this.reader = new PushbackReader(reader);
        this.line = line;
        this.column = column;
    }

    public void exception(String message)
            throws DataValueParseException {
        throw new DataValueParseException(message, line, column);
    }

    public int read()
            throws IOException, DataValueParseException {
        return read(false);
    }

    void incrementColumn() {
        column++;
    }

    void incrementLine() {
        line++;
        prevcolumn = column;
        column = 1;
    }

    void decrementColumn() {
        if (column < 2) {
            column = prevcolumn;
            prevcolumn = -1;
        } else
            column--;
    }

    public int read(boolean errorOnEOF)
            throws IOException, DataValueParseException {
        if (eof) {
            if (errorOnEOF)
                exception("Unexpected EOF");
            return -1;
        }

        int i = reader.read();

        if (i == -1) {
            eof = true;
            if (errorOnEOF)
                exception("Unexpected EOF");
            incrementColumn();
            return -1;
        }
        if ((char) i == '\n')
            incrementLine();
        else
            incrementColumn();
        return i;
    }

    public void unread(int c)
            throws IOException {
        decrementColumn();
        if (eof)
            eof = false;
        if (c != -1)
            reader.unread(c);
    }

    public void skipWhitespace()
            throws IOException, DataValueParseException {
        int i = read();

        while (i != -1 && Character.isWhitespace((char) i))
            i = read();
        unread(i);
    }

    void expect(char c)
            throws IOException, DataValueParseException {
        expect(c, false);
    }

    void expect(char c, boolean whitespace)
            throws IOException, DataValueParseException {
        if (whitespace)
            skipWhitespace();

        int i = read();

        if (i == -1) {
            unread(i);
            expectedException(c, "EOF");
        }
        if ((char) i != c) {
            unread(i);
            expectedException(c, i);
        }
    }

    void expectedException(int x, int y)
            throws DataValueParseException {
        if (x == -1)
            expectedException("EOF", y);
        if (y == -1)
            expectedException(x, "EOF");
        expectedException("``" + (char) x + "''", "``" + (char) y + "''");
    }

    void expectedException(String x, int y)
            throws DataValueParseException {
        if (y == -1)
            expectedException(x, "EOF");
        expectedException(x, "``" + (char) y + "''");
    }

    void expectedException(int x, String y)
            throws DataValueParseException {
        if (x == -1)
            expectedException("EOF", y);
        expectedException("``" + (char) x + "''", y);
    }

    void expectedException(String x, String y)
            throws DataValueParseException {
        exception("Expected " + x + ", got " + y);
    }

    boolean checkAhead(char c)
            throws IOException, DataValueParseException {
        return checkAhead(c, false);
    }

    boolean checkAhead(char c, boolean whitespace)
            throws IOException, DataValueParseException {
        if (whitespace)
            skipWhitespace();

        int i = read();

        if ((char) i == c)
            return true;
        unread(i);
        return false;
    }
}

