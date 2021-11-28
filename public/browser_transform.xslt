<?xml version="1.0" encoding="UTF-8"?>
<!--XSLT - документ является XML - документом. --> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!-- Описание XSLT - документа -->
<xsl:template match="/">
<!-- Правило обработки корневого элемента XML - документа -->
<HTML>
<BODY>
<xsl:if test="output/input">
    <P>Вы ввели: <xsl:value-of select="output/input"/></P>
</xsl:if> 
<xsl:choose>
<xsl:when test="output/error">
    <P>Ошибка: <xsl:value-of select="output/error"/></P>
</xsl:when> 
<xsl:otherwise>
<TABLE BORDER="2"> <TR>
            <TH>No.</TH>
            <TH>Последовательность</TH>
    </TR>
    <xsl:for-each select="output/calculations/sequence">
    <!-- Перебор в цикле всех элементов sequence. -->
    <TR>
    <TD><xsl:value-of select="@data-index"/></TD>
    <!-- Выбор значения атрибута id элемента language --> 

    <TD><xsl:value-of select="."/></TD>
    <!-- Содержимое текущего элемента (контекст) -->

    </TR> 
    </xsl:for-each> 
    
    <TR>
    <TD>Ответ</TD>
    <TD><xsl:value-of select="output/answer/sequence"/></TD>
    </TR>
</TABLE> 
</xsl:otherwise>
</xsl:choose>
</BODY>
</HTML>

</xsl:template>
</xsl:stylesheet>