<%@ page language="java"%>

<%! String getUserDisplay(com.coolservlets.forum.User u) {
      String styleClass = "coderTextWhite";
      if ( u.getRating() > 2199 ) {
        styleClass = "coderTextRed";
      } else if ( u.getRating() > 1499 && u.getRating() < 2200 ) {
        styleClass = "coderTextYellow";
      } else if ( u.getRating() > 1199 && u.getRating() < 1500 ) {
        styleClass = "coderTextBlue";
      } else if ( u.getRating() > 899 && u.getRating() < 1200 ) {
        styleClass = "coderTextGreen";
      } else if (u.getRating() > 0 && u.getRating() < 900 ) {
        styleClass = "coderTextGray";
      } else if (u.getRating() < 0) {
        styleClass = "coderTextOrange";
      }
      if (u.getRating()>0)
        return "<A HREF=\"/stat?c=member_profile&cr="+u.getID()+"\" CLASS=\""+styleClass+"\">"+u.getUsername()+"</A>";
      else return "<SPAN class=\""+styleClass+"\">"+u.getUsername()+"</SPAN>";
    }
%>
