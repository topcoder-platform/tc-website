package com.topcoder.web.render.bean;

import com.topcoder.web.render.ejb.*;

import javax.ejb.CreateException;
import javax.naming.*;
import java.rmi.RemoteException;
import java.sql.SQLException;
import java.util.StringTokenizer;


public class renderBean implements RenderIfc {

    WebContentHome contentHome;
    SectorFileHome fileHome;

    public renderBean() throws NamingException {
        Object obj = null;

        //Context  ctx = TCContext.getInitial();
        Context ctx = new InitialContext();
        obj = ctx.lookup("com.topcoder.web.render.ejb.WebContent");
        contentHome = (WebContentHome) javax.rmi.PortableRemoteObject.narrow(obj, WebContentHome.class);
        obj = ctx.lookup("com.topcoder.web.render.ejb.SectorFile");
        fileHome = (SectorFileHome) javax.rmi.PortableRemoteObject.narrow(obj, SectorFileHome.class);
    }

    public String getContent(String str) throws RemoteException,
            CreateException, SQLException {
        WebContent client = contentHome.create();
        String keys = client.findByContentName(str);
        StringTokenizer st = new StringTokenizer(keys);
        int key;

        if (!st.hasMoreTokens())
            return (null);
        try {
            key = Integer.parseInt(st.nextToken());
        } catch (NumberFormatException e) {
            return (null);
        }
        return (client.getContent(new Integer(key)).toString());
    }

    public String getFileURL(int sectorId) throws RemoteException,
            CreateException, SQLException {
        return (fileHome.create().getLink(new Integer(sectorId)));
    }
}
