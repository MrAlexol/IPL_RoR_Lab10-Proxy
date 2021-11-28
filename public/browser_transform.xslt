<?xml version="1.0" encoding="UTF-8"?>
<!--XSLT - документ является XML - документом. --> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!-- Описание XSLT - документа -->
<xsl:template match="/">
<!-- Правило обработки корневого элемента XML - документа -->
<HTML>
<HEAD>
    <TITLE>Преобразование XML</TITLE>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
</HEAD>
<BODY>
<h1 class="m-3">Результат поиска</h1>
<xsl:if test="output/input">
    <P class="m-3">Вы ввели: <xsl:value-of select="output/input"/></P>
</xsl:if> 
<xsl:choose>
<xsl:when test="output/error">
    <P class="text-danger m-3">Ошибка: <xsl:value-of select="output/error"/></P>
</xsl:when> 
<xsl:otherwise>
<DIV class="w-25 m-3 table-responsive">
<TABLE class="table table-striped table-sm table-bordered"> 
    <THEAD class="text-center">
    <TR>
            <TH scope="col">No.</TH>
            <TH scope="col">Последовательность</TH>
    </TR>
    </THEAD>
    <xsl:for-each select="output/calculations/sequence">
    <!-- Перебор в цикле всех элементов sequence. -->
    <TR>
        <TH scope="row" class="col-1 text-center"><xsl:value-of select="@data-index"/></TH>

        <TD><xsl:value-of select="."/></TD>
        <!-- Содержимое текущего элемента (контекст) -->

    </TR> 
    </xsl:for-each> 
    
    <TR>
    <TH scope="row" class="col-1 text-center">Ответ</TH>
    <TD><xsl:value-of select="output/answer/sequence"/></TD>
    </TR>
</TABLE> 
</DIV>
</xsl:otherwise>
</xsl:choose>
<BUTTON type="button" class="btn btn-link">
    <A href="/">Домой</A>
</BUTTON>
</BODY>
</HTML>

</xsl:template>
</xsl:stylesheet>