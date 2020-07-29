<!--  This file is part of the book                  -->
<!--   Applied Algebra   -->
<!--                                                 -->
<!--  Copyright (C) 2016 Sean Laverty (with others, via Katherine Yoshiwara)            -->
<!--
 Parts of this file were adapted from the author guide at https://github.com/rbeezer/mathbook and the analagous file at https://github.com/twjudson/aata 
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!--
 Assumes current file is in mfg/xsl and that the mathbook repository is adjacent 
-->
<xsl:import href="../../mathbook/xsl/mathbook-html.xsl"/>
<!--
 Or make a thin customization layer and use 'select' to provide overrides 
-->
<!--    -->
<!--  List Chapters and Sections in Table of Contents  -->
<xsl:param name="toc.level" select="'3'"/>
<!--simple numbering -->
<xsl:param name="numbering.projects.level" select="'1'" />
<xsl:param name="numbering.theorems.level" select="'1'" /> 
<xsl:param name="numbering.maximum.level" select="'2'" /> 
<xsl:param name="numbering.equations.level" select="'1'" />
<xsl:param name="numbering.footnotes.level" select="'1'" />
<xsl:template match="exercises//exercise" mode="xref-number">
    <xsl:apply-templates select="." mode="serial-number" />
</xsl:template>
<!-- Knowls -->
<xsl:param name="html.knowl.example" select="'no'" />
<xsl:param name="html.knowl.exercise.inline" select="'yes'" />
<xsl:param name="html.knowl.example.solution" select="'no'" />
<xsl:param name="html.knowl.warning" select="'no'" />
<xsl:param name="html.knowl.technology" select="'no'" />
<!-- color theme -->
<xsl:param name="html.css.colorfile"   select="'colors_default.css'" />

<!--
 Exercises have "solution"s which should be put in the back. 
-->
<!--  Not sure what to do for homework solutions  -->
<xsl:param name="exercise.divisional.hint" select="'yes'" />
<xsl:param name="exercise.divisional.answer" select="'no'" />
<xsl:param name="exercise.divisional.solution" select="'no'" />
</xsl:stylesheet>