<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:jn="http://www.json.org">

  <xsl:output method="text"/>

  <xsl:template match="/testResults">
    {
      "result": <xsl:value-of select="sum(sample/@t)" />
    }
  </xsl:template>
</xsl:stylesheet>