<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
        indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:apply-templates select="//metadata/title"/>
                </title>
                <link rel="stylesheet" href="styles.css"/>
                <link rel="shortcut icon" type="image/jpg" href="red-riding-hood.png"/>
            </head>
            <body>

                <xsl:comment>#include virtual="menu.xhtml" </xsl:comment>

                <main>
                    <xsl:comment>#include virtual="storynav.xhtml" </xsl:comment>
                    <h1>
                        <xsl:apply-templates select="//metadata/title"/>
                    </h1>
                    <div class="grid-story">
                        <div class="grid-item grid-item-11">German Version</div>
                        <div class="grid-item grid-item-13">English Version</div>
                        <div class="grid-item grid-item-12">
                            <!-- textarea style -->
                            <p>
                            <xsl:text>
                                While beginning to mark-up The Juniper Tree from the 
                                original source for the German text, the team discovered 
                                that it was in Low German instead of Standard German.
					            Efforts to find a usable German version that we felt 
					            confident in from other sources proved unsuccessful. 
					            We have decided to include only the English version of
					            The Juniper Tree as it still offers interesting data 
					            as to our main research question of the Grimms' 
					            portrayal of women characters.
                            </xsl:text>
                            </p>
                        </div>
                        <div class="grid-item grid-item-14">
                            <!-- textarea style -->
                            <xsl:apply-templates select="//tale/story"/>

                            <xsl:apply-templates select="//tale/story/act[@effect = 'hostile']"/>
                            <xsl:apply-templates select="//tale/story/act[@effect = 'neutral']"/>
                            <xsl:apply-templates select="//tale/story/act[@effect = 'benevolent']"/>
                        </div>
                    </div>
                </main>
                <xsl:comment>#include virtual="footer.xhtml" </xsl:comment>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>

        </p>

    </xsl:template>

    <xsl:template match="act[@effect = 'hostile']">
        <span class="hostile">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="act[@effect = 'neutral']">
        <span class="neutral">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="act[@effect = 'benevolent']">
        <span class="benevolent">
            <xsl:apply-templates/>
        </span>
    </xsl:template>




</xsl:stylesheet>
