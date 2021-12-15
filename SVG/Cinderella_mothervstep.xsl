<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/2000/svg" xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="bar-width" as="xs:integer" select="20"/>
    <xsl:variable name="space" as="xs:double" select="$bar-width div 2"/>
    <xsl:variable name="max-width" as="xs:double" select="20 * ($bar-width + $space) + $space"/>
    <xsl:variable name="max-height" as="xs:double" select="-100"/>
    <xsl:variable name="yscale" as="xs:integer" select="2"/>
        
   <xsl:template match="/">
       <svg height="400">
           <g transform="translate(30,330)">
               
             <!--axis-->
               <text x="-10" y="0" fill="black" font-size="12">0%</text>
               <text x="-10" y="{-$yscale * 25}" fill="black" font-size="12">25%</text>
               <text x="-10" y="{-$yscale * 50}" fill="black" font-size="12">50%</text>
               <text x="-10" y="{-$yscale * 75}" fill="black" font-size="12">75%</text>
               <text x="-15" y="{-$yscale * 100}" fill="black" font-size="12">100%</text>
               <line x1="20" x2="{$max-width}" y1="{-$yscale * 25}" y2="{-$yscale * 25}" stroke="black" opacity="0.5" stroke-dasharray="2" stroke-width="0.5"/>
               <line x1="20" x2="{$max-width}" y1="{-$yscale * 50}" y2="{-$yscale * 50}" stroke="black" opacity="0.5" stroke-dasharray="2" stroke-width="0.5"/>
               <line x1="20" x2="{$max-width}" y1="{-$yscale * 75}" y2="{-$yscale * 75}" stroke="black" opacity="0.5" stroke-dasharray="2" stroke-width="0.5"/>
               <line x1="20" x2="{$max-width}" y1="{$max-height * $yscale}" y2="{$max-height * $yscale}" stroke="black" opacity="0.5" stroke-dasharray="2" stroke-width="0.5"/>
               <xsl:apply-templates select="//tales"/>
              
               <line x1="20" x2="20" y1="0" y2="{$max-height * $yscale}" stroke="black" stroke-width="1"/>
               <line x1="20" x2="{$max-width}" y1="0" y2="0" stroke="black" stroke-width="1"/>
               
               
          </g>
       </svg>
   </xsl:template>
    <xsl:template match="tales">
        <xsl:variable name="total-English-mother-speakers" select="count(//tale[1]//dialogue[@speaker='original wife'])"/>
        <xsl:variable name="total-English-stepmother-speakers" select="count(//tale[1]//dialogue[@speaker='new wife'])"/>
        <xsl:variable name="total-German-mother-speakers" select="count(//tale[2]//dialogue[@speaker='mother'])"/>
        <xsl:variable name="total-German-stepmother-speakers" select="count(//tale[2]//dialogue[@speaker='stepmother'])"/>
        
        <xsl:variable name="positive-English-mother-speakers" select="count(//tale[1]//dialogue[@speaker='original wife' and @stateofbeing='positive'])"/>
        <xsl:variable name="positive-English-stepmother-speakers" select="count(//tale[1]//dialogue[@speaker='new wife' and @stateofbeing='positive'])"/>
        <xsl:variable name="positive-German-mother-speakers" select="count(//tale[2]//dialogue[@speaker='mother' and @stateofbeing='positive'])"/>
        <xsl:variable name="positive-German-stepmother-speakers" select="count(//tale[2]//dialogue[@speaker='stepmother' and @stateofbeing='positive'])"/>
        
        <xsl:variable name="positive-English-mother-speakers-percent" as="xs:double" select="$positive-English-mother-speakers div $total-English-mother-speakers * 100"/>
        <xsl:variable name="positive-English-stepmother-speakers-percent" as="xs:double" select="$positive-English-stepmother-speakers div $total-English-stepmother-speakers * 100"/>
        <xsl:variable name="positive-German-mother-speakers-percent" as="xs:double" select="$positive-German-mother-speakers div $total-German-mother-speakers * 100"/>
        <xsl:variable name="positive-German-stepmother-speakers-percent" as="xs:double" select="$positive-German-stepmother-speakers div $total-German-stepmother-speakers * 100"/>
        
        <xsl:variable name="negative-English-mother-speakers" select="count(//tale[1]//dialogue[@speaker='original wife' and @stateofbeing='negative'])"/>
        <xsl:variable name="negative-English-stepmother-speakers" select="count(//tale[1]//dialogue[@speaker='new wife' and @stateofbeing='negative'])"/>
        <xsl:variable name="negative-German-mother-speakers" select="count(//tale[2]//dialogue[@speaker='mother' and @stateofbeing='negative'])"/>
        <xsl:variable name="negative-German-stepmother-speakers" select="count(//tale[2]//dialogue[@speaker='stepmother' and @stateofbeing='negative'])"/>
        
        <xsl:variable name="negative-English-mother-speakers-percent" as="xs:double" select="$negative-English-mother-speakers div $total-English-mother-speakers * 100"/>
        <xsl:variable name="negative-English-stepmother-speakers-percent" as="xs:double" select="$negative-English-stepmother-speakers div $total-English-stepmother-speakers * 100"/>
        <xsl:variable name="negative-German-mother-speakers-percent" as="xs:double" select="$negative-German-mother-speakers div $total-German-mother-speakers * 100"/>
        <xsl:variable name="negative-German-stepmother-speakers-percent" as="xs:double" select="$negative-German-stepmother-speakers div $total-German-stepmother-speakers * 100"/>
        
        <xsl:variable name="neutral-English-mother-speakers" select="count(//tale[1]//dialogue[@speaker='original wife' and @stateofbeing='neutral'])"/>
        <xsl:variable name="neutral-English-stepmother-speakers" select="count(//tale[1]//dialogue[@speaker='new wife' and @stateofbeing='neutral'])"/>
        <xsl:variable name="neutral-German-mother-speakers" select="count(//tale[2]//dialogue[@speaker='mother' and @stateofbeing='neutral'])"/>
        <xsl:variable name="neutral-German-stepmother-speakers" select="count(//tale[2]//dialogue[@speaker='stepmother' and @stateofbeing='neutral'])"/>
        
        <xsl:variable name="neutral-English-mother-speakers-percent" as="xs:double" select="$neutral-English-mother-speakers div $total-English-mother-speakers * 100"/>
        <xsl:variable name="neutral-English-stepmother-speakers-percent" as="xs:double" select="$neutral-English-stepmother-speakers div $total-English-stepmother-speakers * 100"/>
        <xsl:variable name="neutral-German-mother-speakers-percent" as="xs:double" select="$neutral-German-mother-speakers div $total-German-mother-speakers * 100"/>
        <xsl:variable name="neutral-German-stepmother-speakers-percent" as="xs:double" select="$neutral-German-stepmother-speakers div $total-German-stepmother-speakers * 100"/>
        
        <!--BARS-->
        
       
        <rect x="60" y="-{$positive-English-mother-speakers-percent * $yscale}" height="{$positive-English-mother-speakers-percent * $yscale}" width="{$bar-width}" fill="#75333a"/>
        <rect x="60" y="{($max-height * $yscale) + ($negative-English-mother-speakers-percent * $yscale)}" height="{$neutral-English-mother-speakers-percent * $yscale}" width="{$bar-width}" fill="#a25c29"/>
        <rect x="60" y="{$max-height * $yscale}" height="{$negative-English-mother-speakers-percent * $yscale}" width="{$bar-width}" fill="#446460"/>
        
        <text x="40" y="20" fill="black" font-size="12">MOTHER</text>
        <text x="40" y="35" fill="black" font-size="10">(ENGLISH)</text>
        
        <rect x="120" y="-{$positive-German-mother-speakers-percent * $yscale}" height="{$positive-German-mother-speakers-percent * $yscale}" width="{$bar-width}" fill="#75333a"/>
        <rect x="120" y="{($max-height * $yscale) + ($negative-German-mother-speakers-percent * $yscale)}" height="{$neutral-German-mother-speakers-percent * $yscale}" width="{$bar-width}" fill="#a25c29"/>
        <rect x="120" y="{$max-height * $yscale}" height="{$negative-German-mother-speakers-percent * $yscale}" width="{$bar-width}" fill="#446460"/>
        
        <text x="105" y="20" fill="black" font-size="12">MOTHER</text>
        <text x="105" y="35" fill="black" font-size="10">(GERMAN)</text>
        
        <rect x="220" y="-{$positive-English-stepmother-speakers-percent * $yscale}" height="{$positive-English-stepmother-speakers-percent * $yscale}" width="{$bar-width}" fill="#75333a"/>
        <rect x="220" y="{($max-height * $yscale) + ($negative-English-stepmother-speakers-percent * $yscale)}" height="{$neutral-English-stepmother-speakers-percent * $yscale}" width="{$bar-width}" fill="#a25c29"/>
        <rect x="220" y="{$max-height * $yscale}" height="{$negative-English-stepmother-speakers-percent * $yscale}" width="{$bar-width}" fill="#446460"/>
        
        <text x="212" y="20" fill="black" font-size="12">STEP-</text>
        <text x="205" y="35" fill="black" font-size="12">MOTHER</text>
        <text x="205" y="50" fill="black" font-size="10">(ENGLISH)</text>
        
        <rect x="280" y="-{$positive-German-stepmother-speakers-percent * $yscale}" height="{$positive-German-stepmother-speakers-percent * $yscale}" width="{$bar-width}" fill="#75333a"/>
        <rect x="280" y="{($max-height * $yscale) + ($negative-German-stepmother-speakers-percent * $yscale)}" height="{$neutral-German-stepmother-speakers-percent * $yscale}" width="{$bar-width}" fill="#a25c29"/>
        <rect x="280" y="{$max-height * $yscale}" height="{$negative-German-stepmother-speakers-percent * $yscale}" width="{$bar-width}" fill="#446460"/>
        
        <text x="272" y="20" fill="black" font-size="12">STEP-</text>
        <text x="265" y="35" fill="black" font-size="12">MOTHER</text>
        <text x="265" y="50" fill="black" font-size="10">(GERMAN)</text>
        
        <rect x="60" y="-230" height="10" width="10" fill="#75333a"/>
        <text x="70" y="-220" fill="black" font-size="12">POSITIVE</text>
        
        <rect x="150" y="-230" height="10" width="10" fill="#a25c29"/>
        <text x="160" y="-220" fill="black" font-size="12">NEUTRAL</text>
        
        <rect x="240" y="-230" height="10" width="10" fill="#446460"/>
        <text x="250" y="-220" fill="black" font-size="12">NEGATIVE</text>
        
        <text transform="rotate(270)" style="text-anchor:end;" x="180" y="-15" color="black" font-size="12"
            >% OF TYPES OF DIALOGUE</text>
        <text x="20" y="-270" fill="black" font-size="14">CINDERELLA: TYPES OF DIALOGUE SPOKEN</text>
        <text x="40" y="-255" fill="black" font-size="14">BY MOTHERS AND STEPMOTHERS</text>
 
    </xsl:template>
</xsl:stylesheet>