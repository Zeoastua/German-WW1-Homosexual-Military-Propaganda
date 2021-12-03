<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
        indent="yes"/>
    <xsl:template match="/">
        <html>
        <head>
            <title>cinderella - Grimms' Fairy Tales</title>
            <link rel="stylesheet" href="styles.css" />
        </head>
            <body>
                <!--#include virtual="menu.xhtml" -->
                <main>	
                    <!--#include virtual="storynav.xhtml" -->
                    <h1>
                        <xsl:apply-templates select="//tale[2]/metadata/title"/>
                    </h1>
                    <div class="grid-story">
                        <div class="grid-item grid-item-11">German Version</div>
                        <div class="grid-item grid-item-13">English Version</div>
                        <div class="grid-item grid-item-12">
                            <!-- textarea style -->
                            <p>
                                <xsl:apply-templates select="//tale[1]/story[1]"></xsl:apply-templates>
                            </p>
                        </div>
                        <div class="grid-item grid-item-14">
                            <!-- textarea style -->
                            <p>
                                <xsl:apply-templates select="//tale[2]/story"></xsl:apply-templates>
                            </p>
                        </div>
                    </div>
                </main>
                <!--#include virtual="footer.xhtml" -->
            </body>
        </html>
     </xsl:template>
        
    
</xsl:stylesheet>