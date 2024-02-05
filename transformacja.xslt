<!-- transformacja.xslt -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <head>
        <title>Książka telefoniczna</title>
        <link rel="stylesheet" type="text/css" href="index.css"/>
        <script type="text/javascript" src="index.js"/>
      </head>
      <body>
        <div class="header">
          <h1>Książka telefoniczna</h1>
        </div>
        <div class="container">
          <xsl:apply-templates select="//osoba"/>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="osoba">
    <div class="contact">
      <div class="name">
        <xsl:value-of select="daneOsobowe/imie"/> <xsl:text> </xsl:text><xsl:value-of select="daneOsobowe/nazwisko"/>
      </div>

      <div class="phone" >
        <span onmouseover="showTooltip(this)" onmouseout="hideTooltip(this)">
          <b style="color: #cc6633;font-size: 20px;">&#9742;</b> Telefon: <xsl:value-of select="numerTelefonu"/>
        </span>
        <div class="tooltip">Rodzaj: <xsl:value-of select="numerTelefonu/@rodzaj"/></div>
      </div>   
      
      <div class="email">
        <span onmouseover="showTooltip(this)" onmouseout="hideTooltip(this)">
          <b style="color: #cc6633;font-size: 20px;">&#9993;</b> E-mail: <xsl:value-of select="adresMailowy"/>
        </span>
        <div class="tooltip">Rodzaj: <xsl:value-of select="adresMailowy/@rodzaj"/></div>
      </div>

      <a class="details-link" href="javascript:void(0);" onclick="toggleDetails('details_{position()}')">Więcej informacji &#9660;</a>
      <div id="details_{position()}" class="details">
        <xsl:apply-templates select="daneOsobowe"/>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="daneOsobowe">
    <div>
      Imię: <xsl:value-of select="imie"/><br/>

      <xsl:if test="drugieImie">
      Drugie imię: <xsl:value-of select="drugieImie"/><br/>
    </xsl:if>

      Nazwisko: <xsl:value-of select="nazwisko"/><br/>
      Adres:
      <xsl:value-of select="adres/ulica"/> <xsl:text> </xsl:text>
      <xsl:value-of select="adres/nrDomu"/>
      <xsl:if test="adres/nrLokalu">
      <xsl:text>/</xsl:text>
      <xsl:value-of select="adres/nrLokalu" disable-output-escaping="yes"/>
      </xsl:if>
      <xsl:text>; </xsl:text>
      <xsl:value-of select="adres/miejscowosc"/><xsl:text>; </xsl:text>
      <xsl:value-of select="adres/kodPocztowy"/><br/>
      Miejsce pracy: <xsl:value-of select="miejscePracy"/><br/>
      
      <xsl:if test="../numerTelefonu[2]">
        <div>
          <span onmouseover="showTooltip(this)" onmouseout="hideTooltip(this)">
            Drugi telefon: <xsl:value-of select="../numerTelefonu[2]"/><br/>
          </span>
          <div class="tooltip">Rodzaj: <xsl:value-of select="../numerTelefonu[2]/@rodzaj"/></div>
        </div>
      </xsl:if>

      <xsl:if test="../adresMailowy[2]">
        <div>
          <span onmouseover="showTooltip(this)" onmouseout="hideTooltip(this)">
            Drugi e-mail: <xsl:value-of select="../adresMailowy[2]"/>
          </span>
          <div class="tooltip">Rodzaj: <xsl:value-of select="../adresMailowy[2]/@rodzaj"/></div>
        </div>
      </xsl:if>

    </div>
  </xsl:template>

</xsl:stylesheet>
