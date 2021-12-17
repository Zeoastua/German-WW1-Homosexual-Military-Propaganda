<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/2000/svg"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="bar-width" as="xs:integer" select="20"/>
    <xsl:variable name="space" as="xs:double" select="$bar-width div 2"/>
    <xsl:variable name="max-width" as="xs:double" select="20 * ($bar-width + $space) + $space"/>
    <xsl:variable name="max-height" as="xs:double" select="-100"/>
    <xsl:variable name="yscale" as="xs:integer" select="2"/>

    <xsl:template match="/">
        <svg height="400" width="550">
            <g transform="translate(30,330)">

                <!--axis-->
                <text x="-10" y="0" fill="black" font-size="12">0%</text>
                <text x="-10" y="{-$yscale * 25}" fill="black" font-size="12">25%</text>
                <text x="-10" y="{-$yscale * 50}" fill="black" font-size="12">50%</text>
                <text x="-10" y="{-$yscale * 75}" fill="black" font-size="12">75%</text>
                <text x="-15" y="{-$yscale * 100}" fill="black" font-size="12">100%</text>
                <line x1="20" x2="{$max-width}" y1="{-$yscale * 25}" y2="{-$yscale * 25}"
                    stroke="black" opacity="0.5" stroke-dasharray="2" stroke-width="0.5"/>
                <line x1="20" x2="{$max-width}" y1="{-$yscale * 50}" y2="{-$yscale * 50}"
                    stroke="black" opacity="0.5" stroke-dasharray="2" stroke-width="0.5"/>
                <line x1="20" x2="{$max-width}" y1="{-$yscale * 75}" y2="{-$yscale * 75}"
                    stroke="black" opacity="0.5" stroke-dasharray="2" stroke-width="0.5"/>
                <line x1="20" x2="{$max-width}" y1="{$max-height * $yscale}"
                    y2="{$max-height * $yscale}" stroke="black" opacity="0.5" stroke-dasharray="2"
                    stroke-width="0.5"/>
                <xsl:apply-templates select="//tales"/>

                <line x1="20" x2="20" y1="0" y2="{$max-height * $yscale}" stroke="black"
                    stroke-width="1"/>
                <line x1="20" x2="{$max-width}" y1="0" y2="0" stroke="black" stroke-width="1"/>


            </g>
        </svg>
    </xsl:template>
    <xsl:template match="tales">
        <xsl:variable name="total-English-uglygirl-speakers"
            select="count(//tale[1]//dialogue[@speaker = 'ugly girl'])"/>
        <xsl:variable name="total-English-nicegirl-speakers"
            select="count(//tale[1]//dialogue[@speaker = 'pretty girl'])"/>
        <xsl:variable name="total-English-FrauHolle-speakers"
            select="count(//tale[1]//dialogue[@speaker = 'old woman'])"/>
        <xsl:variable name="total-German-uglygirl-speakers"
            select="count(//tale[2]//dialogue[@speaker = 'die Faule'])"/>
        <xsl:variable name="total-German-nicegirl-speakers"
            select="count(//tale[2]//dialogue[@speaker = 'beautiful'])"/>
        <xsl:variable name="total-German-FrauHolle-speakers"
            select="count(//tale[2]//dialogue[@speaker = 'Frau Holle'])"/>

        <xsl:variable name="positive-English-uglygirl-speakers"
            select="count(//tale[1]//dialogue[@speaker = 'ugly girl' and @stateofbeing = 'positive'])"/>
        <xsl:variable name="positive-English-nicegirl-speakers"
            select="count(//tale[1]//dialogue[@speaker = 'pretty girl' and @stateofbeing = 'positive'])"/>
        <xsl:variable name="positive-English-FrauHolle-speakers"
            select="count(//tale[1]//dialogue[@speaker = 'old woman' and @stateofbeing = 'positive'])"/>
        <xsl:variable name="positive-German-uglygirl-speakers"
            select="count(//tale[2]//dialogue[@speaker = 'die Faule' and @stateofbeing = 'positive'])"/>
        <xsl:variable name="positive-German-nicegirl-speakers"
            select="count(//tale[2]//dialogue[@speaker = 'beautiful' and @stateofbeing = 'positive'])"/>
        <xsl:variable name="positive-German-FrauHolle-speakers"
            select="count(//tale[2]//dialogue[@speaker = 'Frau Holle' and @stateofbeing = 'positive'])"/>

        <xsl:variable name="positive-English-uglygirl-speakers-percent" as="xs:double"
            select="$positive-English-uglygirl-speakers div $total-English-uglygirl-speakers * 100"/>
        <xsl:variable name="positive-English-nicegirl-speakers-percent" as="xs:double"
            select="$positive-English-nicegirl-speakers div $total-English-nicegirl-speakers * 100"/>
        <xsl:variable name="positive-English-FrauHolle-speakers-percent" as="xs:double"
            select="$positive-English-FrauHolle-speakers div $total-English-FrauHolle-speakers * 100"/>
        <xsl:variable name="positive-German-uglygirl-speakers-percent" as="xs:double"
            select="$positive-German-uglygirl-speakers div $total-German-uglygirl-speakers * 100"/>
        <xsl:variable name="positive-German-nicegirl-speakers-percent" as="xs:double"
            select="$positive-German-nicegirl-speakers div $total-German-nicegirl-speakers * 100"/>
        <xsl:variable name="positive-German-FrauHolle-speakers-percent" as="xs:double"
            select="$positive-German-FrauHolle-speakers div $total-German-FrauHolle-speakers * 100"/>

        <xsl:variable name="negative-English-uglygirl-speakers"
            select="count(//tale[1]//dialogue[@speaker = 'ugly girl' and @stateofbeing = 'negative'])"/>
        <xsl:variable name="negative-English-nicegirl-speakers"
            select="count(//tale[1]//dialogue[@speaker = 'pretty girl' and @stateofbeing = 'negative'])"/>
        <xsl:variable name="negative-English-FrauHolle-speakers"
            select="count(//tale[1]//dialogue[@speaker = 'old woman' and @stateofbeing = 'negative'])"/>
        <xsl:variable name="negative-German-uglygirl-speakers"
            select="count(//tale[2]//dialogue[@speaker = 'die Faule' and @stateofbeing = 'negative'])"/>
        <xsl:variable name="negative-German-nicegirl-speakers"
            select="count(//tale[2]//dialogue[@speaker = 'beautiful' and @stateofbeing = 'negative'])"/>
        <xsl:variable name="negative-German-FrauHolle-speakers"
            select="count(//tale[2]//dialogue[@speaker = 'Frau Holle' and @stateofbeing = 'negative'])"/>

        <xsl:variable name="negative-English-uglygirl-speakers-percent" as="xs:double"
            select="$negative-English-uglygirl-speakers div $total-English-uglygirl-speakers * 100"/>
        <xsl:variable name="negative-English-nicegirl-speakers-percent" as="xs:double"
            select="$negative-English-nicegirl-speakers div $total-English-nicegirl-speakers * 100"/>
        <xsl:variable name="negative-English-FrauHolle-speakers-percent" as="xs:double"
            select="$negative-English-FrauHolle-speakers div $total-English-FrauHolle-speakers * 100"/>
        <xsl:variable name="negative-German-uglygirl-speakers-percent" as="xs:double"
            select="$negative-German-uglygirl-speakers div $total-German-uglygirl-speakers * 100"/>
        <xsl:variable name="negative-German-nicegirl-speakers-percent" as="xs:double"
            select="$negative-German-nicegirl-speakers div $total-German-nicegirl-speakers * 100"/>
        <xsl:variable name="negative-German-FrauHolle-speakers-percent" as="xs:double"
            select="$negative-German-FrauHolle-speakers div $total-German-FrauHolle-speakers * 100"/>

        <xsl:variable name="neutral-English-uglygirl-speakers"
            select="count(//tale[1]//dialogue[@speaker = 'ugly girl' and @stateofbeing = 'neutral'])"/>
        <xsl:variable name="neutral-English-nicegirl-speakers"
            select="count(//tale[1]//dialogue[@speaker = 'pretty girl' and @stateofbeing = 'neutral'])"/>
        <xsl:variable name="neutral-English-FrauHolle-speakers"
            select="count(//tale[1]//dialogue[@speaker = 'old woman' and @stateofbeing = 'neutral'])"/>
        <xsl:variable name="neutral-German-uglygirl-speakers"
            select="count(//tale[2]//dialogue[@speaker = 'die Faule' and @stateofbeing = 'neutral'])"/>
        <xsl:variable name="neutral-German-nicegirl-speakers"
            select="count(//tale[2]//dialogue[@speaker = 'beautiful' and @stateofbeing = 'neutral'])"/>
        <xsl:variable name="neutral-German-FrauHolle-speakers"
            select="count(//tale[2]//dialogue[@speaker = 'Frau Holle' and @stateofbeing = 'neutral'])"/>

        <xsl:variable name="neutral-English-uglygirl-speakers-percent" as="xs:double"
            select="$neutral-English-uglygirl-speakers div $total-English-uglygirl-speakers * 100"/>
        <xsl:variable name="neutral-English-nicegirl-speakers-percent" as="xs:double"
            select="$neutral-English-nicegirl-speakers div $total-English-nicegirl-speakers * 100"/>
        <xsl:variable name="neutral-English-FrauHolle-speakers-percent" as="xs:double"
            select="$neutral-English-FrauHolle-speakers div $total-English-FrauHolle-speakers * 100"/>
        <xsl:variable name="neutral-German-uglygirl-speakers-percent" as="xs:double"
            select="$neutral-German-uglygirl-speakers div $total-German-uglygirl-speakers * 100"/>
        <xsl:variable name="neutral-German-nicegirl-speakers-percent" as="xs:double"
            select="$neutral-German-nicegirl-speakers div $total-German-nicegirl-speakers * 100"/>
        <xsl:variable name="neutral-German-FrauHolle-speakers-percent" as="xs:double"
            select="$neutral-German-FrauHolle-speakers div $total-German-FrauHolle-speakers * 100"/>

        <!--BARS-->


        <rect x="60" y="-{$positive-English-uglygirl-speakers-percent * $yscale}"
            height="{$positive-English-uglygirl-speakers-percent * $yscale}" width="{$bar-width}"
            fill="#75333a"/>
        <rect x="60"
            y="{($max-height * $yscale) + ($negative-English-uglygirl-speakers-percent * $yscale)}"
            height="{$neutral-English-uglygirl-speakers-percent * $yscale}" width="{$bar-width}"
            fill="#a25c29"/>
        <rect x="60" y="{$max-height * $yscale}"
            height="{$negative-English-uglygirl-speakers-percent * $yscale}" width="{$bar-width}"
            fill="#446460"/>

        <text x="55" y="20" fill="black" font-size="12">LAZY</text>
        <text x="30" y="35" fill="black" font-size="12">DAUGHTER</text>
        <text x="45" y="50" fill="black" font-size="10">(ENGLISH)</text>


        <rect x="120" y="-{$positive-German-uglygirl-speakers-percent * $yscale}"
            height="{$positive-German-uglygirl-speakers-percent * $yscale}" width="{$bar-width}"
            fill="#75333a"/>
        <rect x="120"
            y="{($max-height * $yscale) + ($negative-German-uglygirl-speakers-percent * $yscale)}"
            height="{$neutral-German-uglygirl-speakers-percent * $yscale}" width="{$bar-width}"
            fill="#a25c29"/>
        <rect x="120" y="{$max-height * $yscale}"
            height="{$negative-German-uglygirl-speakers-percent * $yscale}" width="{$bar-width}"
            fill="#446460"/>

        <text x="115" y="20" fill="black" font-size="12">LAZY</text>
        <text x="100" y="35" fill="black" font-size="12">DAUGHTER</text>
        <text x="105" y="50" fill="black" font-size="10">(GERMAN)</text>

        <rect x="220" y="-{$positive-English-nicegirl-speakers-percent * $yscale}"
            height="{$positive-English-nicegirl-speakers-percent * $yscale}" width="{$bar-width}"
            fill="#75333a"/>
        <rect x="220"
            y="{($max-height * $yscale) + ($negative-English-nicegirl-speakers-percent * $yscale)}"
            height="{$neutral-English-nicegirl-speakers-percent * $yscale}" width="{$bar-width}"
            fill="#a25c29"/>
        <rect x="220" y="{$max-height * $yscale}"
            height="{$negative-English-nicegirl-speakers-percent * $yscale}" width="{$bar-width}"
            fill="#446460"/>

        <text x="195" y="20" fill="black" font-size="12">BEAUTIFUL</text>
        <text x="190" y="35" fill="black" font-size="12">DAUGHTER</text>
        <text x="200" y="50" fill="black" font-size="10">(ENGLISH)</text>

        <rect x="280" y="-{$positive-German-nicegirl-speakers-percent * $yscale}"
            height="{$positive-German-nicegirl-speakers-percent * $yscale}" width="{$bar-width}"
            fill="#75333a"/>
        <rect x="280"
            y="{($max-height * $yscale) + ($negative-German-nicegirl-speakers-percent * $yscale)}"
            height="{$neutral-German-nicegirl-speakers-percent * $yscale}" width="{$bar-width}"
            fill="#a25c29"/>
        <rect x="280" y="{$max-height * $yscale}"
            height="{$negative-German-nicegirl-speakers-percent * $yscale}" width="{$bar-width}"
            fill="#446460"/>

        <text x="265" y="20" fill="black" font-size="12">BEAUTIFUL</text>
        <text x="267" y="35" fill="black" font-size="12">DAUGHTER</text>
        <text x="265" y="50" fill="black" font-size="10">(GERMAN)</text>
        
        <rect x="380" y="-{$positive-English-FrauHolle-speakers-percent * $yscale}"
            height="{$positive-English-FrauHolle-speakers-percent * $yscale}" width="{$bar-width}"
            fill="#75333a"/>
        <rect x="380"
            y="{($max-height * $yscale) + ($negative-English-FrauHolle-speakers-percent * $yscale)}"
            height="{$neutral-English-FrauHolle-speakers-percent * $yscale}" width="{$bar-width}"
            fill="#a25c29"/>
        <rect x="380" y="{$max-height * $yscale}"
            height="{$negative-English-FrauHolle-speakers-percent * $yscale}" width="{$bar-width}"
            fill="#446460"/>
        
        <text x="368" y="20" fill="black" font-size="12">FRAU</text>
        <text x="367" y="35" fill="black" font-size="12">HOLLE</text>
        <text x="365" y="50" fill="black" font-size="10">(GERMAN)</text>
        
        <rect x="440" y="-{$positive-German-FrauHolle-speakers-percent * $yscale}"
            height="{$positive-German-FrauHolle-speakers-percent * $yscale}" width="{$bar-width}"
            fill="#75333a"/>
        <rect x="440"
            y="{($max-height * $yscale) + ($negative-German-FrauHolle-speakers-percent * $yscale)}"
            height="{$neutral-German-FrauHolle-speakers-percent * $yscale}" width="{$bar-width}"
            fill="#a25c29"/>
        <rect x="440" y="{$max-height * $yscale}"
            height="{$negative-German-FrauHolle-speakers-percent * $yscale}" width="{$bar-width}"
            fill="#446460"/>

        <text x="428" y="20" fill="black" font-size="12">FRAU</text>
        <text x="427" y="35" fill="black" font-size="12">HOLLE</text>
        <text x="425" y="50" fill="black" font-size="10">(GERMAN)</text>
        
        <rect x="150" y="-230" height="10" width="10" fill="#75333a"/>
        <text x="165" y="-220" fill="black" font-size="12">POSITIVE</text>

        <rect x="240" y="-230" height="10" width="10" fill="#a25c29"/>
        <text x="255" y="-220" fill="black" font-size="12">NEUTRAL</text>

        <rect x="330" y="-230" height="10" width="10" fill="#446460"/>
        <text x="345" y="-220" fill="black" font-size="12">NEGATIVE</text>

        <text transform="rotate(270)" style="text-anchor:end;" x="180" y="-15" color="black"
            font-size="12">% OF TYPES OF DIALOGUE</text>
        <text x="110" y="-270" fill="black" font-size="14">FRAU HOLLE: TYPES OF DIALOGUE
            SPOKEN</text>
        <text x="140" y="-255" fill="black" font-size="14">BY DAUGHTERS AND FRAU HOLLE</text>

    </xsl:template>
</xsl:stylesheet>
