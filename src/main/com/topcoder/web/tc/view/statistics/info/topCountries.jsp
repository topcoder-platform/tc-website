<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="../../script.jsp" />
<title>TopCoder Info</title>
</head>
<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr valign="top" align="center">
         <td colspan="3"><br><img src="/i/tc_logo_help.gif" width="217" height="44" border="0"></td>
      </tr>

    <tr valign="top">

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1"></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td class="bodyText" WIDTH="100%"><br>
  <table border="0" cellspacing="0" cellpadding="0" width="100%">
      <tr>
         <td>
            <p class="bodyText">
            Country rankings are based on an aggregation of the TopCoder members within in a particular
            country that have competed within the last 180 days, in other words, those that are "active".
            </p>

            <p class="bodyText">
            The formula below has the property that if all the coders from a particular country have
            the same rating, then that country's rating would be the same as the individual ratings.
            When coder ratings differ, the country rating is based mostly on the top rated coders.
            The intent is to provide a better way to rank countries than a simple average.
            </p>

            <p class="bodyText">
            When generating the country rankings we take the individual ratings for active coders
            from a particular country, sorted in decreasing order.  These ratings are given
            by rating<sub>1</sub> ... rating<sub>M</sub>, where <b><i>M</i></b> is the total number
            of active coders from a country.
            </p>

            <table width="100%"><tr><td align="center"><img src="/i/rank_formula.gif"/></td></tr></table>

            <p class="bodyText">Where:
            <br/>
            <b><i>M</i></b> is the number of active coders from a particular country
            <br/>
            <b><i>i</i></b> is a 1 based index of active coders from a
            particular country when sorted by rating in descending order, in other words,
            their rank within their country
            <br/>
            <b><i>rating<sub>i </sub></i></b>is the rating of the coder
            with index i
            <br/>
            <b><i>R</i></b> is a constant that will dictate the weighting of the different ranks
            <br/>
            <br/>

            <p class="bodyText">One may determine the weighting (<b><i>R</i></b>) using the
            following equation.</p>

            <p class="bodyText"></p>

            <table width="100%"><tr><td align="center"><img src="/i/rank_weight_equation.gif"/></td></tr></table>

            <p class="bodyText"></p>

            <p class="bodyText">Where <b><i>X</i></b> is the fraction of a country’s rating
            that will be based on the top <b><i>K</i></b> coders within that country.</p>

            <p class="bodyText"></p>

            <p class="bodyText">We have chosen an <b><i>R</i></b> of .87, this means that
            the top 10 coders contribute about 75% of a country’s rating.</p>

         </td>
      </tr>
      <br/>
      <tr>
         <td align="center">
           <p><br /></p>
           <p align="center"><a href="javascript:window.close();" class="button" align="center">close</a></p>
           <p><br /></p>
         </td>
      </tr>
  </table>
</td>
<!-- Center Column Ends -->

<!-- Gutter -->
      <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>

</table>

</body>

</html>