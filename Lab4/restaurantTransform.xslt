<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
    xmlns:al="http://www.algonquincollege.com/onlineservice/reviews"
    >
  <xsl:param name="ratingInput">0</xsl:param>
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head></head>
      <body>
        <xsl:for-each select="al:Restaurants/al:Restaurant">
          <xsl:sort select="al:Rating" data-type="number" order="descending"/>
          <xsl:choose>
            <xsl:when test="al:Rating &gt;= $ratingInput">
              <h2>
                <xsl:value-of select="al:Name"/>
              </h2>
              <ul>
                <li>
                  <xsl:value-of select="al:RestaurantAddress/al:Address"/>, <xsl:value-of select="al:RestaurantAddress/al:City"/>
                </li>
                <li>
                  <xsl:value-of select="al:PhoneNumber"/>
                </li>
              </ul>
              <br/>
              <h3>Review:</h3>
              <p>
                <xsl:value-of select="al:Summary"/>
              </p>
              <h3>
                Rating: <xsl:value-of select="al:Rating"/>
              </h3>
              <br/>
              <h3>Menu</h3>
              <br/>
              <table class="table">
                <tr>
                  <th>Description</th>
                  <th>Quantity</th>
                  <th>Price</th>
                </tr>
                <tr>
                  <td colspan="3" style="text-align: center;">Appetizers</td>
                </tr>
                <xsl:for-each select="al:Menu/al:Appetizers/al:AppetizerFoodItem">
                  <tr>
                    <td>
                      <xsl:value-of select="al:ItemDescription"/>
                    </td>
                    <td>
                      <xsl:value-of select="al:PiecesPerOrder"/>
                    </td>
                    <td>
                      <xsl:value-of select="al:ItemPrice"/>
                    </td>
                  </tr>
                </xsl:for-each>
                <tr>
                  <td colspan="3" style="text-align: center;">Entrees</td>
                </tr>
                <xsl:for-each select="al:Menu/al:Entrees/al:EntreeFoodItem">
                  <tr>
                    <td>
                      <xsl:value-of select="al:ItemDescription"/>
                    </td>
                    <td>
                      <xsl:value-of select="al:PiecesPerOrder"/>
                    </td>
                    <td>
                      <xsl:value-of select="al:ItemPrice"/>
                    </td>
                  </tr>
                </xsl:for-each>
              </table>
            </xsl:when>
          </xsl:choose>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
