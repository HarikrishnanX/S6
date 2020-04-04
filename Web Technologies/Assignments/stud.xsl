<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
    <body>
        <h2>Students Information</h2>
        <table style="border: 1px solid black;">
            <tr style="background-color: springgreen;">
                <th style="text-align: center;">Roll No</th>
                <th style="text-align: center;">Name</th>
                <th style="text-align: center;">Branch</th>
            </tr>
            <xsl:for-each select="students/student">
            <tr>
                <td><xsl:value-of select="roll_no"/></td>
                <td><xsl:value-of select="name"/></td>
                <td><xsl:value-of select="branch"/></td>
            </tr>
            </xsl:for-each>
        </table>
    </body>
</html>
</xsl:template>
</xsl:stylesheet>
