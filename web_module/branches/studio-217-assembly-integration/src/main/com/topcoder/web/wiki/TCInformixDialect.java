package com.topcoder.web.wiki;

import net.sf.hibernate.dialect.InformixDialect;

import java.sql.Types;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 6, 2007
 */
public class TCInformixDialect extends InformixDialect {
    public TCInformixDialect() {
        super();
/*
        registerColumnType(Types.BLOB, "byte");
        registerColumnType(Types.CLOB, "text");
*/
        registerColumnType(Types.BLOB, "blob");
        registerColumnType(Types.CLOB, "clob");
        registerColumnType(Types.DOUBLE, "float");

    }
}
