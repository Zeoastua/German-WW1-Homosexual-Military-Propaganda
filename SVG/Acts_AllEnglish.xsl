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
        <svg height="400" width="700">
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
        <xsl:variable name="total-English-Cinderella-acts"
            select="count(//tale[1]//act)"/>
        <xsl:variable name="total-English-FrauHolle-acts"
            select="count(//tale[2]//act)"/>
        <xsl:variable name="total-English-HanselGretel-acts"
            select="count(//tale[3]//act)"/>
        <xsl:variable name="total-English-RedCap-acts"
            select="count(//tale[4]//act)"/>
        <xsl:variable name="total-English-SnowWhite-acts"
            select="count(//tale[5]//act)"/>
        <xsl:variable name="total-English-Rapunzel-acts"
            select="count(//tale[6]//act)"/>
        <xsl:variable name="total-English-Sweetheart-acts"
            select="count(//tale[7]//act)"/>
        <xsl:variable name="total-English-Juniper-acts"
            select="count(//tale[8]//act)"/>
        <xsl:variable name="total-English-SixSwans-acts"
            select="count(//tale[9]//act)"/>
        <xsl:variable name="total-English-Twelve-acts"
            select="count(//tale[10]//act)"/>
        
        <xsl:variable name="benevolent-English-Cinderella-acts"
            select="count(//tale[1]//act[@effect = 'benevolent'])"/>
        <xsl:variable name="benevolent-English-FrauHolle-acts"
            select="count(//tale[2]//act[@effect = 'benevolent'])"/>
        <xsl:variable name="benevolent-English-HanselGretel-acts"
            select="count(//tale[3]//act[@effect = 'benevolent'])"/>
        <xsl:variable name="benevolent-English-RedCap-acts"
            select="count(//tale[4]//act[@effect = 'benevolent'])"/>
        <xsl:variable name="benevolent-English-SnowWhite-acts"
            select="count(//tale[5]//act[@effect = 'benevolent'])"/>
        <xsl:variable name="benevolent-English-Rapunzel-acts"
            select="count(//tale[6]//act[@effect = 'benevolent'])"/>
        <xsl:variable name="benevolent-English-Sweetheart-acts"
            select="count(//tale[7]//act[@effect = 'benevolent'])"/>
        <xsl:variable name="benevolent-English-Juniper-acts"
            select="count(//tale[8]//act[@effect = 'benevolent'])"/>
        <xsl:variable name="benevolent-English-SixSwans-acts"
            select="count(//tale[9]//act[@effect = 'benevolent'])"/>
        <xsl:variable name="benevolent-English-Twelve-acts"
            select="count(//tale[10]//act[@effect = 'benevolent'])"/>
        
        <xsl:variable name="benevolent-English-Cinderella-acts-percent" as="xs:double"
            select="$benevolent-English-Cinderella-acts div $total-English-Cinderella-acts * 100"/>
        <xsl:variable name="benevolent-English-FrauHolle-acts-percent" as="xs:double"
            select="$benevolent-English-FrauHolle-acts div $total-English-FrauHolle-acts * 100"/>
        <xsl:variable name="benevolent-English-HanselGretel-acts-percent" as="xs:double"
            select="$benevolent-English-HanselGretel-acts div $total-English-HanselGretel-acts * 100"/>
        <xsl:variable name="benevolent-English-RedCap-acts-percent" as="xs:double"
            select="$benevolent-English-RedCap-acts div $total-English-RedCap-acts * 100"/>
        <xsl:variable name="benevolent-English-SnowWhite-acts-percent" as="xs:double"
            select="$benevolent-English-SnowWhite-acts div $total-English-SnowWhite-acts * 100"/>
        <xsl:variable name="benevolent-English-Rapunzel-acts-percent" as="xs:double"
            select="$benevolent-English-Rapunzel-acts div $total-English-Rapunzel-acts * 100"/>
        <xsl:variable name="benevolent-English-Sweetheart-acts-percent" as="xs:double"
            select="$benevolent-English-Sweetheart-acts div $total-English-Sweetheart-acts * 100"/>
        <xsl:variable name="benevolent-English-Juniper-acts-percent" as="xs:double"
            select="$benevolent-English-Juniper-acts div $total-English-Juniper-acts * 100"/>
        <xsl:variable name="benevolent-English-SixSwans-acts-percent" as="xs:double"
            select="$benevolent-English-SixSwans-acts div $total-English-SixSwans-acts * 100"/>
        <xsl:variable name="benevolent-English-Twelve-acts-percent" as="xs:double"
            select="$benevolent-English-Twelve-acts div $total-English-Twelve-acts * 100"/>
        
        <xsl:variable name="hostile-English-Cinderella-acts"
            select="count(//tale[1]//act[@effect = 'hostile'])"/>
        <xsl:variable name="hostile-English-FrauHolle-acts"
            select="count(//tale[2]//act[@effect = 'hostile'])"/>
        <xsl:variable name="hostile-English-HanselGretel-acts"
            select="count(//tale[3]//act[@effect = 'hostile'])"/>
        <xsl:variable name="hostile-English-RedCap-acts"
            select="count(//tale[4]//act[@effect = 'hostile'])"/>
        <xsl:variable name="hostile-English-SnowWhite-acts"
            select="count(//tale[5]//act[@effect = 'hostile'])"/>
        <xsl:variable name="hostile-English-Rapunzel-acts"
            select="count(//tale[6]//act[@effect = 'hostile'])"/>
        <xsl:variable name="hostile-English-Sweetheart-acts"
            select="count(//tale[7]//act[@effect = 'hostile'])"/>
        <xsl:variable name="hostile-English-Juniper-acts"
            select="count(//tale[8]//act[@effect = 'hostile'])"/>
        <xsl:variable name="hostile-English-SixSwans-acts"
            select="count(//tale[9]//act[@effect = 'hostile'])"/>
        <xsl:variable name="hostile-English-Twelve-acts"
            select="count(//tale[10]//act[@effect = 'hostile'])"/>
        
        <xsl:variable name="hostile-English-Cinderella-acts-percent" as="xs:double"
            select="$hostile-English-Cinderella-acts div $total-English-Cinderella-acts * 100"/>
        <xsl:variable name="hostile-English-FrauHolle-acts-percent" as="xs:double"
            select="$hostile-English-FrauHolle-acts div $total-English-FrauHolle-acts * 100"/>
        <xsl:variable name="hostile-English-HanselGretel-acts-percent" as="xs:double"
            select="$hostile-English-HanselGretel-acts div $total-English-HanselGretel-acts * 100"/>
        <xsl:variable name="hostile-English-RedCap-acts-percent" as="xs:double"
            select="$hostile-English-RedCap-acts div $total-English-RedCap-acts * 100"/>
        <xsl:variable name="hostile-English-SnowWhite-acts-percent" as="xs:double"
            select="$hostile-English-SnowWhite-acts div $total-English-SnowWhite-acts * 100"/>
        <xsl:variable name="hostile-English-Rapunzel-acts-percent" as="xs:double"
            select="$hostile-English-Rapunzel-acts div $total-English-Rapunzel-acts * 100"/>
        <xsl:variable name="hostile-English-Sweetheart-acts-percent" as="xs:double"
            select="$hostile-English-Sweetheart-acts div $total-English-Sweetheart-acts * 100"/>
        <xsl:variable name="hostile-English-Juniper-acts-percent" as="xs:double"
            select="$hostile-English-Juniper-acts div $total-English-Juniper-acts * 100"/>
        <xsl:variable name="hostile-English-SixSwans-acts-percent" as="xs:double"
            select="$hostile-English-SixSwans-acts div $total-English-SixSwans-acts * 100"/>
        <xsl:variable name="hostile-English-Twelve-acts-percent" as="xs:double"
            select="$hostile-English-Twelve-acts div $total-English-Twelve-acts * 100"/>
        
        <xsl:variable name="ambiguous-English-Cinderella-acts"
            select="count(//tale[1]//act[@effect = 'ambiguous'])"/>
        <xsl:variable name="ambiguous-English-FrauHolle-acts"
            select="count(//tale[2]//act[@effect = 'ambiguous'])"/>
        <xsl:variable name="ambiguous-English-HanselGretel-acts"
            select="count(//tale[3]//act[@effect = 'ambiguous'])"/>
        <xsl:variable name="ambiguous-English-RedCap-acts"
            select="count(//tale[4]//act[@effect = 'ambiguous'])"/>
        <xsl:variable name="ambiguous-English-SnowWhite-acts"
            select="count(//tale[5]//act[@effect = 'ambiguous'])"/>
        <xsl:variable name="ambiguous-English-Rapunzel-acts"
            select="count(//tale[6]//act[@effect = 'ambiguous'])"/>
        <xsl:variable name="ambiguous-English-Sweetheart-acts"
            select="count(//tale[7]//act[@effect = 'ambiguous'])"/>
        <xsl:variable name="ambiguous-English-Juniper-acts"
            select="count(//tale[8]//act[@effect = 'ambiguous'])"/>
        <xsl:variable name="ambiguous-English-SixSwans-acts"
            select="count(//tale[9]//act[@effect = 'ambiguous'])"/>
        <xsl:variable name="ambiguous-English-Twelve-acts"
            select="count(//tale[10]//act[@effect = 'ambiguous'])"/>
        
        <xsl:variable name="ambiguous-English-Cinderella-acts-percent" as="xs:double"
            select="$ambiguous-English-Cinderella-acts div $total-English-Cinderella-acts * 100"/>
        <xsl:variable name="ambiguous-English-FrauHolle-acts-percent" as="xs:double"
            select="$ambiguous-English-FrauHolle-acts div $total-English-FrauHolle-acts * 100"/>
        <xsl:variable name="ambiguous-English-HanselGretel-acts-percent" as="xs:double"
            select="$ambiguous-English-HanselGretel-acts div $total-English-HanselGretel-acts * 100"/>
        <xsl:variable name="ambiguous-English-RedCap-acts-percent" as="xs:double"
            select="$ambiguous-English-RedCap-acts div $total-English-RedCap-acts * 100"/>
        <xsl:variable name="ambiguous-English-SnowWhite-acts-percent" as="xs:double"
            select="$ambiguous-English-SnowWhite-acts div $total-English-SnowWhite-acts * 100"/>
        <xsl:variable name="ambiguous-English-Rapunzel-acts-percent" as="xs:double"
            select="$ambiguous-English-Rapunzel-acts div $total-English-Rapunzel-acts * 100"/>
        <xsl:variable name="ambiguous-English-Sweetheart-acts-percent" as="xs:double"
            select="$ambiguous-English-Sweetheart-acts div $total-English-Sweetheart-acts * 100"/>
        <xsl:variable name="ambiguous-English-Juniper-acts-percent" as="xs:double"
            select="$ambiguous-English-Juniper-acts div $total-English-Juniper-acts * 100"/>
        <xsl:variable name="ambiguous-English-SixSwans-acts-percent" as="xs:double"
            select="$ambiguous-English-SixSwans-acts div $total-English-SixSwans-acts * 100"/>
        <xsl:variable name="ambiguous-English-Twelve-acts-percent" as="xs:double"
            select="$ambiguous-English-Twelve-acts div $total-English-Twelve-acts * 100"/>
        
        <!--BARS-->
        
        
        <rect x="30" y="-{$benevolent-English-Cinderella-acts-percent * $yscale}"
            height="{$benevolent-English-Cinderella-acts-percent * $yscale}" width="{$bar-width}"
            fill="#75333a"/>
        <rect x="30"
            y="{($max-height * $yscale) + ($hostile-English-Cinderella-acts-percent * $yscale)}"
            height="{$ambiguous-English-Cinderella-acts-percent * $yscale}" width="{$bar-width}"
            fill="#a25c29"/>
        <rect x="30" y="{$max-height * $yscale}"
            height="{$hostile-English-Cinderella-acts-percent * $yscale}" width="{$bar-width}"
            fill="#446460"/>
        
        <text x="0" y="20" fill="black" font-size="11">CINDERELLA</text>
        
        
        <rect x="90" y="-{$benevolent-English-FrauHolle-acts-percent * $yscale}"
            height="{$benevolent-English-FrauHolle-acts-percent * $yscale}" width="{$bar-width}"
            fill="#75333a"/>
        <rect x="90"
            y="{($max-height * $yscale) + ($hostile-English-FrauHolle-acts-percent * $yscale)}"
            height="{$ambiguous-English-FrauHolle-acts-percent * $yscale}" width="{$bar-width}"
            fill="#a25c29"/>
        <rect x="90" y="{$max-height * $yscale}"
            height="{$hostile-English-FrauHolle-acts-percent * $yscale}" width="{$bar-width}"
            fill="#446460"/>  
        
        <text x="85" y="20" fill="black" font-size="11">FRAU</text>
        <text x="80" y="30" fill="black" font-size="11">HOLLE</text>
        
        <rect x="150" y="-{$benevolent-English-HanselGretel-acts-percent * $yscale}"
            height="{$benevolent-English-HanselGretel-acts-percent * $yscale}" width="{$bar-width}"
            fill="#75333a"/>
        <rect x="150"
            y="{($max-height * $yscale) + ($hostile-English-HanselGretel-acts-percent * $yscale)}"
            height="{$ambiguous-English-HanselGretel-acts-percent * $yscale}" width="{$bar-width}"
            fill="#a25c29"/>
        <rect x="150" y="{$max-height * $yscale}"
            height="{$hostile-English-HanselGretel-acts-percent * $yscale}" width="{$bar-width}"
            fill="#446460"/>
        
        <text x="140" y="20" fill="black" font-size="11">HANSEL</text>
        <text x="148" y="30" fill="black" font-size="11">AND</text>
        <text x="140" y="40" fill="black" font-size="11">GRETEL</text>
       
        
        <rect x="210" y="-{$benevolent-English-RedCap-acts-percent * $yscale}"
            height="{$benevolent-English-RedCap-acts-percent * $yscale}" width="{$bar-width}"
            fill="#75333a"/>
        <rect x="210"
            y="{($max-height * $yscale) + ($hostile-English-RedCap-acts-percent * $yscale)}"
            height="{$ambiguous-English-RedCap-acts-percent * $yscale}" width="{$bar-width}"
            fill="#a25c29"/>
        <rect x="210" y="{$max-height * $yscale}"
            height="{$hostile-English-RedCap-acts-percent * $yscale}" width="{$bar-width}"
            fill="#446460"/>
        
        <text x="200" y="20" fill="black" font-size="11">LITTLE</text>
        <text x="205" y="30" fill="black" font-size="11">RED</text>
        <text x="205" y="40" fill="black" font-size="11">CAP</text>
       
        <rect x="270" y="-{$benevolent-English-SnowWhite-acts-percent * $yscale}"
            height="{$benevolent-English-SnowWhite-acts-percent * $yscale}" width="{$bar-width}"
            fill="#75333a"/>
        <rect x="270"
            y="{($max-height * $yscale) + ($hostile-English-SnowWhite-acts-percent * $yscale)}"
            height="{$ambiguous-English-SnowWhite-acts-percent * $yscale}" width="{$bar-width}"
            fill="#a25c29"/>
        <rect x="270" y="{$max-height * $yscale}"
            height="{$hostile-English-SnowWhite-acts-percent * $yscale}" width="{$bar-width}"
            fill="#446460"/>
        
        <text x="260" y="20" fill="black" font-size="11">LITTLE</text>
        <text x="261" y="30" fill="black" font-size="11">SNOW</text>
        <text x="260" y="40" fill="black" font-size="11">WHITE</text>
        
        <rect x="330" y="-{$benevolent-English-Rapunzel-acts-percent * $yscale}"
            height="{$benevolent-English-Rapunzel-acts-percent * $yscale}" width="{$bar-width}"
            fill="#75333a"/>
        <rect x="330"
            y="{($max-height * $yscale) + ($hostile-English-Rapunzel-acts-percent * $yscale)}"
            height="{$ambiguous-English-Rapunzel-acts-percent * $yscale}" width="{$bar-width}"
            fill="#a25c29"/>
        <rect x="330" y="{$max-height * $yscale}"
            height="{$hostile-English-Rapunzel-acts-percent * $yscale}" width="{$bar-width}"
            fill="#446460"/>
        
        <text x="315" y="20" fill="black" font-size="11">RAPUNZEL</text>
       
        
        <rect x="390" y="-{$benevolent-English-Sweetheart-acts-percent * $yscale}"
            height="{$benevolent-English-Sweetheart-acts-percent * $yscale}" width="{$bar-width}"
            fill="#75333a"/>
        <rect x="390"
            y="{($max-height * $yscale) + ($hostile-English-Sweetheart-acts-percent * $yscale)}"
            height="{$ambiguous-English-Sweetheart-acts-percent * $yscale}" width="{$bar-width}"
            fill="#a25c29"/>
        <rect x="390" y="{$max-height * $yscale}"
            height="{$hostile-English-Sweetheart-acts-percent * $yscale}" width="{$bar-width}"
            fill="#446460"/>
        
        <text x="380" y="20" fill="black" font-size="11">SWEET-</text>
        <text x="382" y="30" fill="black" font-size="11">HEART</text>
        <text x="377" y="40" fill="black" font-size="11">ROLAND</text>
        
        <rect x="450" y="-{$benevolent-English-Juniper-acts-percent * $yscale}"
            height="{$benevolent-English-Juniper-acts-percent * $yscale}" width="{$bar-width}"
            fill="#75333a"/>
        <rect x="450"
            y="{($max-height * $yscale) + ($hostile-English-Juniper-acts-percent * $yscale)}"
            height="{$ambiguous-English-Juniper-acts-percent * $yscale}" width="{$bar-width}"
            fill="#a25c29"/>
        <rect x="450" y="{$max-height * $yscale}"
            height="{$hostile-English-Juniper-acts-percent * $yscale}" width="{$bar-width}"
            fill="#446460"/>
        <text x="449" y="20" fill="black" font-size="11">THE</text>
        <text x="439" y="30" fill="black" font-size="11">JUNIPER</text>
        <text x="447" y="40" fill="black" font-size="11">TREE</text>
        
        <rect x="510" y="-{$benevolent-English-SixSwans-acts-percent * $yscale}"
            height="{$benevolent-English-SixSwans-acts-percent * $yscale}" width="{$bar-width}"
            fill="#75333a"/>
        <rect x="510"
            y="{($max-height * $yscale) + ($hostile-English-SixSwans-acts-percent * $yscale)}"
            height="{$ambiguous-English-SixSwans-acts-percent * $yscale}" width="{$bar-width}"
            fill="#a25c29"/>
        <rect x="510" y="{$max-height * $yscale}"
            height="{$hostile-English-SixSwans-acts-percent * $yscale}" width="{$bar-width}"
            fill="#446460"/>
        
        <text x="509" y="20" fill="black" font-size="11">THE</text>
        <text x="511" y="30" fill="black" font-size="11">SIX</text>
        <text x="503" y="40" fill="black" font-size="11">SWANS</text>
        
        <rect x="570" y="-{$benevolent-English-Twelve-acts-percent * $yscale}"
            height="{$benevolent-English-Twelve-acts-percent * $yscale}" width="{$bar-width}"
            fill="#75333a"/>
        <rect x="570"
            y="{($max-height * $yscale) + ($hostile-English-Twelve-acts-percent * $yscale)}"
            height="{$ambiguous-English-Twelve-acts-percent * $yscale}" width="{$bar-width}"
            fill="#a25c29"/>
        <rect x="570" y="{$max-height * $yscale}"
            height="{$hostile-English-Twelve-acts-percent * $yscale}" width="{$bar-width}"
            fill="#446460"/>
        
        <text x="569" y="20" fill="black" font-size="11">THE</text>
        <text x="560" y="30" fill="black" font-size="11">TWELVE</text>
        <text x="555" y="40" fill="black" font-size="11">BROTHERS</text>
        
        <rect x="175" y="-230" height="10" width="10" fill="#75333a"/>
        <text x="190" y="-220" fill="black" font-size="12">BENEVOLENT</text>
        
        <rect x="280" y="-230" height="10" width="10" fill="#a25c29"/>
        <text x="295" y="-220" fill="black" font-size="12">AMBIGUOUS</text>
        
        <rect x="375" y="-230" height="10" width="10" fill="#446460"/>
        <text x="390" y="-220" fill="black" font-size="12">HOSTILE</text>
        
        <text transform="rotate(270)" style="text-anchor:end;" x="180" y="-15" color="black"
            font-size="12">% OF TYPES OF ACTS</text>
        <text x="200" y="-270" fill="black" font-size="14">ENGLISH TALES: TYPES OF ACTS
          </text>
        
        
    </xsl:template>
</xsl:stylesheet>
