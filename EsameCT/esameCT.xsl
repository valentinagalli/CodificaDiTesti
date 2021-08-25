<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:html="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    <!-- Applica questo template al nodo radice indicato dal carattere / -->
    <xsl:template match="/">

        <html>
            <head>
                <title><xsl:text>Prolusioni 29-30</xsl:text></title> 
                <link rel="stylesheet" type="text/css" href="./esameCT.css" />
                <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.js"></script>
                <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
                <script type="text/javascript" src="esameCT.js"/>
                <style>
                    body{
                        background-color: #ECDFD6;
                    }
                </style>
            </head>
            <body>
                <h1>
                    <xsl:apply-templates select="tei:TEI//tei:titleStmt/tei:title"/>
                </h1>
                <div>
                    <xsl:apply-templates select="tei:TEI//tei:fileDesc" mode="originale"/>
                </div>
                <div>
                   <xsl:apply-templates select="tei:TEI//tei:fileDesc" mode="digitale"/>
                </div>
                <button type="button" id="cambioPagina" data-click="false">visualizza pagina 30</button>
                <button type="button" id="cambioLingua" data-click="false">leggi in italiano</button>
                <button type="button" id="cambioAbbr" data-click="false">visualizza edizione diplomatica</button>
                <p>passa il cursore sull'immagine per vedere la pericope corrispondente sul testo</p>
                <!--contenitore img e testo p29-->
                <div id="p29" style="display:grid; grid-template-columns:50%50%;">
                    <!--contenitore img-->
                    <div class="imgtesto">
                        <xsl:apply-templates select="(//tei:figure)[position()=1]"/>
                    </div>
                    <!--contenitore testo-->
                    <div>
                        <div class="fr">
                            <xsl:apply-templates select="(//tei:pb)[position()=1]"/>
                        </div>
                    </div>
                
                </div>
                <br/>
                <!--contenitore img e testo p30-->
                <div id="p30" style="display:grid; grid-template-columns:50%50%;">
                    <!--contenitore img-->
                    <div class="imgtesto">
                        <xsl:apply-templates select="(//tei:figure)[position()=2]"/>
                    </div>
                    <!--contenitore testo-->
                    <div class="fr">
                        <xsl:apply-templates select="(//tei:pb)[position()=2]"/>
                    </div>
                </div>
                
                <div id="note">
                    <xsl:apply-templates select="//tei:list[@type='notes']"/>
                </div>
                <div id="glossario">
                    <xsl:apply-templates select="//tei:list[@type='gloss']"/>
                </div>
                <div id="persone">
                    <xsl:apply-templates select="//tei:list[@type='person']"/>
                </div>
                <div id="footer" style="text-align:center;">
                    <p>Questo sito è stato realizzato per il progetto d'esame del corso Codifica di Testi a.a. 2020/2021</p>
                    <p>da <xsl:value-of select="//tei:editionStmt//tei:name"/></p>
                </div>
            </body>
        </html>

    </xsl:template>

    <!--template per la stampa del titolo del sito-->
    <xsl:template match="title">
        <xsl:value-of select="."/>
        <br/>
    </xsl:template>
    <!--template per info manoscritto originale-->
    <xsl:template match="tei:TEI//tei:fileDesc" mode="originale">
        <h3><xsl:text>Informazioni sul manoscritto originale</xsl:text></h3>
        <strong><xsl:text>Titolo: </xsl:text></strong>
        <span><xsl:value-of select="tei:sourceDesc//tei:title"/></span>
        <br/>
        <strong><xsl:text>Scritto da:</xsl:text></strong>
        <span><xsl:value-of select="tei:sourceDesc//tei:author"/></span>
        <br/>
        <strong><xsl:text>Contenuto: </xsl:text></strong>
        <span><xsl:value-of select="tei:sourceDesc//tei:msContents"/></span>
        <br/>
        <strong><xsl:text>Composizione: </xsl:text></strong>
        <span><xsl:value-of select="tei:sourceDesc//tei:extent"/></span>
        <br/>
        <strong><xsl:text>Aspetto: </xsl:text></strong>
        <span><xsl:value-of select="tei:sourceDesc//tei:foliation"/><xsl:text> </xsl:text><xsl:value-of select="tei:sourceDesc//tei:condition"/></span>
    </xsl:template>
    <!--template per info digitale-->
    <xsl:template match="tei:TEI//tei:fileDesc" mode="digitale">
        <h3><xsl:text>Informazioni sull'edizione digitale</xsl:text></h3>
        <strong><xsl:text>Titolo: </xsl:text></strong>
        <span><xsl:value-of select="//tei:titleStmt/tei:title"/></span>
        <br/>
        <strong><xsl:text>Codificato da: </xsl:text></strong>
        <span><xsl:value-of select="//tei:titleStmt//tei:respStmt"/></span>
        <br/>
        <strong><xsl:text>Pagine codificate: </xsl:text></strong>
        <span><xsl:value-of select="//tei:citedRange"/></span>
        <br/>
    </xsl:template>
    <!--template stampa immagini-->
    <xsl:template match="//tei:figure" name="imgpagine">    
            <xsl:choose>
                <xsl:when test="@n='1'">
                    <xsl:element name="img">
                        <xsl:attribute name="src">
                            <xsl:value-of select="(//tei:graphic)[position()=1]/@url"/>
                        </xsl:attribute>
                        <xsl:attribute name="style">
                            <xsl:text>clip-path:inset(5.5% 5.1% 5% 5.5%);</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                            <xsl:value-of select="(//tei:graphic)[position()=1]/@url"/>
                        </xsl:attribute>
                        <xsl:attribute name="usemap">
                            <xsl:text>#mappa29</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="width">
                            <xsl:text>100%</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                    <map name="mappa29" id="mappa29">
                        <xsl:for-each select="(..//tei:zone)[position()=1 to 12]">
                            <xsl:element name="area">
                                <xsl:attribute name="shape">
                                    <xsl:text>poly</xsl:text>
                                </xsl:attribute>
                                <xsl:attribute name="coords">
                                    <xsl:value-of select="./@points"/>
                                </xsl:attribute>
                                <xsl:attribute name="alt">
                                    <xsl:text>pericope evidenziata</xsl:text>
                                </xsl:attribute>
                                <xsl:attribute name="style">
                                    <xsl:text>cursor:pointer;</xsl:text>
                                </xsl:attribute>
                                <xsl:attribute name="class">
                                    <xsl:text>zona</xsl:text>
                                </xsl:attribute>
                                <xsl:attribute name="id">
                                    <xsl:value-of select="./@xml:id"/>
                                </xsl:attribute>
                            </xsl:element>
                        </xsl:for-each>
                    </map>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:element name="img">
                        <xsl:attribute name="src">
                            <xsl:value-of select="(//tei:graphic)[position()=2]/@url"/>
                        </xsl:attribute>
                        <xsl:attribute name="style">
                            <xsl:text>clip-path:inset(5.5% 6.5% 5.1% 5.6%);</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                            <xsl:value-of select="(//tei:graphic)[position()=2]/@url"/>
                        </xsl:attribute>
                        <xsl:attribute name="usemap">
                            <xsl:text>#mappa30</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="width">
                            <xsl:text>100%</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                    <map name="mappa30" id="mappa30">
                        <xsl:for-each select="(../..//tei:zone)[position()=13 to 17]">
                            <xsl:element name="area">
                                <xsl:attribute name="shape">
                                    <xsl:text>poly</xsl:text>
                                </xsl:attribute>
                                <xsl:attribute name="coords">
                                    <xsl:value-of select="./@points"/>
                                </xsl:attribute>
                                <xsl:attribute name="alt">
                                    <xsl:text>pericope evidenziata</xsl:text>
                                </xsl:attribute>
                                <xsl:attribute name="style">
                                    <xsl:text>cursor:pointer;</xsl:text>
                                </xsl:attribute>
                                <xsl:attribute name="class">
                                    <xsl:text>zona</xsl:text>
                                </xsl:attribute>
                                <xsl:attribute name="id">
                                    <xsl:value-of select="./@xml:id"/>
                                </xsl:attribute>
                            </xsl:element>
                        </xsl:for-each>
                    </map>
                </xsl:otherwise>
            </xsl:choose>
    </xsl:template>
    <!--template stampa pericopi-->
    <xsl:template match="//tei:pb">
        <xsl:choose>
            <xsl:when test="@xml:id='p29'">
                <xsl:for-each select="(//tei:ab)[position()= 1 to 12]">
                    <xsl:element name="span">
                        <xsl:attribute name="class">originale</xsl:attribute>
                        <xsl:attribute name="id"><xsl:value-of select="substring-after(./@facs,'#')"/></xsl:attribute>
                        <xsl:attribute name="style">style="margin-top:120px;</xsl:attribute>
                        <xsl:apply-templates/>
                    </xsl:element>
                </xsl:for-each>
                <xsl:for-each select="(//tei:text//tei:ab)[position()= 18 to 29]">
                    <xsl:element name="span">
                        <xsl:attribute name="class">traduzione</xsl:attribute>
                        <xsl:attribute name="id"><xsl:value-of select="substring-after(./@facs,'#')"/></xsl:attribute>
                        <xsl:apply-templates/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="(//tei:ab)[position()= 13 to 17]">
                    <xsl:element name="span">
                        <xsl:attribute name="class">originale</xsl:attribute>
                        <xsl:attribute name="id"><xsl:value-of select="substring-after(./@facs,'#')"/></xsl:attribute>
                        <xsl:attribute name="style">style="margin-top:120px;</xsl:attribute>
                        <xsl:apply-templates/>
                    </xsl:element>
                </xsl:for-each>
                <xsl:for-each select="(//tei:text//tei:ab)[position()= 30 to 34]">
                    <xsl:element name="span">
                        <xsl:attribute name="class">traduzione</xsl:attribute>
                        <xsl:attribute name="id"><xsl:value-of select="substring-after(./@facs,'#')"/></xsl:attribute>
                        <xsl:apply-templates/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!--template abbr e expan strong-->
    <xsl:template match="//tei:choice"> 
        <strong class="abbr"> 
            <xsl:value-of select=".//tei:abbr"/>
        </strong>
        <strong class="expan"> 
            <xsl:value-of select=".//tei:expan"/>
        </strong>
        <strong class="sic"> 
            <xsl:value-of select=".//tei:sic"/>
        </strong>
        <strong class="corr"> 
            <xsl:value-of select=".//tei:corr"/>
        </strong>
    </xsl:template>
    <!--template ex strong-->
    <xsl:template match="//tei:ex"> 
        <strong class="ex"> 
            <xsl:value-of select="."/>
        </strong>
    </xsl:template>
    <!--template per gli "a capo"-->
    <xsl:template match="//tei:lb">   
        <br/>                         
    </xsl:template>                   
    <xsl:template match="//tei:del">
        <xsl:for-each select="tei:lb">
            <br/>
        </xsl:for-each>
        <xsl:text></xsl:text>
    </xsl:template>


    <!--template per i numeri in apice delle note-->
    <xsl:template match="//tei:term">
        <xsl:apply-templates/>   
        <xsl:choose>
            <xsl:when test="@*[contains(.,'#nota1')]"> 
                <a href="#note">
                    <xsl:text>&#185;</xsl:text>
                </a>
            </xsl:when>
            <xsl:when test="@*[contains(.,'#nota2')]">
                <a href="#note">
                    <xsl:text>&#178;</xsl:text>
                </a>
            </xsl:when>
            <xsl:when test="@*[contains(.,'#nota3')]">
                <a href="#note">
                    <xsl:text>&#179;</xsl:text>
                </a>
            </xsl:when>
            <xsl:when test="@*[contains(.,'#nota4')]">
                <a href="#note">
                    <xsl:text>&#8308;</xsl:text>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text></xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!--template glossario-->
    <xsl:template match="//tei:list[@type='gloss']">
        <p><b>Glossario dal <xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="//tei:list[@type='gloss']/tei:item/tei:gloss/@target"/></xsl:attribute><xsl:attribute name="target"><xsl:text>_blank</xsl:text></xsl:attribute><xsl:text>progetto "Ontology_F_d_S.owl"</xsl:text></xsl:element></b><button type="button" id="tendaGloss" data-click="false" style="display: inline-block;">▼</button></p>
        <ul id="listaG">
            <xsl:for-each select="//tei:list[@type='gloss']/tei:label">
                <li><b><xsl:value-of select="."/><xsl:text>: </xsl:text></b><xsl:value-of select="following-sibling::tei:item/tei:gloss"/></li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    <!--template note-->
    <xsl:template match="//tei:list[@type='notes']">
        <p><b>Note da <xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="//tei:bibl[@xml:id='notes']/tei:ref/@target"/></xsl:attribute><xsl:attribute name="target"><xsl:text>_blank</xsl:text></xsl:attribute><xsl:value-of select="//tei:bibl[@xml:id='notes']/tei:title[@type='main']"/><xsl:text>: </xsl:text><xsl:value-of select="//tei:bibl[@xml:id='notes']/tei:title[@type='sub']"/></xsl:element></b></p>
        <ol>
            <xsl:for-each select="//tei:list[@type='notes']/tei:label">
                <li><b><xsl:value-of select="."/><xsl:text>: </xsl:text></b><xsl:value-of select="following-sibling::tei:item/tei:gloss"/></li>
            </xsl:for-each>
        </ol>
    </xsl:template>
    <!--template persone-->
    <xsl:template match="//tei:list[@type='person']">
        <p><b>Persone nominate nel testo</b><button type="button" id="tendaPers" data-click="false" style="display: inline-block;">▼</button></p>
        <ul id="listaP">
            <li><b><xsl:value-of select="//tei:list[@type='person']//tei:forename"/><xsl:text>:</xsl:text></b><xsl:text> né en </xsl:text><xsl:value-of select="//tei:list[@type='person']//tei:birth//tei:date"/><xsl:text> en </xsl:text><xsl:value-of select="//tei:list[@type='person']//tei:birth//tei:placeName"/><xsl:text> mort en </xsl:text><xsl:value-of select="//tei:list[@type='person']//tei:death//tei:date"/><xsl:text> en </xsl:text><xsl:value-of select="//tei:list[@type='person']//tei:death//tei:placeName"/></li>
        </ul>
    </xsl:template>

</xsl:stylesheet>