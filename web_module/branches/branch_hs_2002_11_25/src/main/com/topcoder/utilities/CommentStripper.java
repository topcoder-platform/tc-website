package com.topcoder.utilities;

import java.io.FileInputStream;

public class CommentStripper {
    int idx;
    int ptr;

    public String stripComments(String input) {
        idx = 0;
        ptr = 0;
        String ret = code((" " + input + " ").toCharArray());
//        System.out.println(ret.length());
        return ret;
    }

    private String code(char[] chars) {
        char ret[] = new char[chars.length];
        while (idx < chars.length) {
            if (chars[idx] == '\'') {
                ret[ptr++] = chars[idx++];
                if (chars[idx] == '\\') {
                    if (idx < chars.length) ret[ptr++] = chars[idx++];
                }
                if (idx < chars.length) ret[ptr++] = chars[idx++];
                if (idx < chars.length) ret[ptr++] = chars[idx++];
            } else if (chars[idx] == '"') {
                ret[ptr++] = chars[idx++];
                while (idx < chars.length && chars[idx] != '"') {
                    if (chars[idx] == '\\') {
                        ret[ptr++] = chars[idx++];
                    }
                    ret[ptr++] = chars[idx++];
                }
                if (idx < chars.length) ret[ptr++] = chars[idx++];
            } else if (chars[idx] == '/' && chars[idx + 1] == '/') {
                while (idx < chars.length && chars[idx] != '\n') idx++;
            } else if (idx + 1 < chars.length && chars[idx] == '/' && chars[idx + 1] == '*') {
                idx += 4;
                while (idx < chars.length && !(chars[idx - 2] == '*' && chars[idx - 1] == '/')) idx++;
            } else if (chars[idx] == ' ' || chars[idx] == '\t' || chars[idx] == '\n' || chars[idx] == '\r') {
                if (chars[idx] == '\r')
                    chars[idx] = '\n';
                ret[ptr++] = chars[idx++];
                while (idx < chars.length && (chars[idx] == ' ' || chars[idx] == '\t' || chars[idx] == '\n' || chars[idx] == '\r')) idx++;
            } else
                ret[ptr++] = chars[idx++];
        }
        return new String(ret, 0, ptr);
    }

    public static void main(String args[]) {
        try {

            FileInputStream fis = new FileInputStream(args[0]);
            byte b[] = new byte[100000];
            int len = fis.read(b);
            String s = new CommentStripper().stripComments(new String(b, 0, len));
            System.out.println(s);
        } catch (Exception e) {

            e.printStackTrace();
        }
    }

}
