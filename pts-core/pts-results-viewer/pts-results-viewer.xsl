<!--

Phoronix Test Suite "Trondheim"
URLs: http://www.phoronix.com, http://www.phoronix-test-suite.com/
Copyright (C) 2008, Phoronix Media
Copyright (C) 2008, Michael Larabel

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.

-->

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Phoronix Test Suite - <xsl:value-of select="PhoronixTestSuite/Suite/Title" /> - Results Viewer</title>
		<link href="../pts-results-viewer/pts-viewer.css" rel="stylesheet" type="text/css" />
		<script src="../pts-results-viewer/pts.js" type="text/javascript"></script>
	</head>
	<body>
		<div id="pts_header_top">
			<div id="pts_header_top_center">
				<div id="pts_header_top_title">Phoronix Test Suite</div>
				<div id="pts_header_top_link_group"><a href="http://www.phoronix-test-suite.com/">Phoronix Test Suite</a><a href="http://global.phoronix-test-suite.com/index.php?k=results">PTS Global</a></div>
			</div>
		</div>
		<div id="pts_container">

			<div class="pts_box">

				<h1><xsl:value-of select="PhoronixTestSuite/Suite/Title" /></h1>
				<div class="pts_chart_box">
					<p><xsl:value-of select="PhoronixTestSuite/Suite/Name" /> v<xsl:value-of select="PhoronixTestSuite/Suite/Version" /> (<xsl:value-of select="PhoronixTestSuite/Suite/Type" /> Benchmarks)</p>
					<p id="tsd_show" style="display: none;"><div class="pts_area_box"><p><xsl:value-of select="PhoronixTestSuite/Suite/Description"/></p><p style="font-size: 11px;">This test is maintained by <xsl:value-of select="PhoronixTestSuite/Suite/Maintainer" />.</p><p><a onclick="switchShow('tsd_hidden');switchShow('tsd_show');">&lt;&lt; Hide Test Details</a></p></div></p>
					<p class="pts_benchmark_descriptor" id="tsd_hidden"><a onclick="switchShow('tsd_hidden');switchShow('tsd_show');hideObject('tips_show');showObject('tips_hidden');">Show Test Details &gt;&gt;</a></p>
				</div>

				<xsl:variable name="idcount"><xsl:value-of select="count(PhoronixTestSuite/System)" /></xsl:variable>
				<xsl:variable name="idwidth"><xsl:value-of select="floor(820 div $idcount) - 3" /></xsl:variable>

				<h1>System Hardware</h1>
				<div class="pts_chart_box">
				<xsl:for-each select="PhoronixTestSuite/System"><div class="pts_column_head"><xsl:attribute name="style">width: <xsl:value-of select="$idwidth" />px;</xsl:attribute><xsl:value-of select="AssociatedIdentifiers" /></div></xsl:for-each>
				<xsl:for-each select="PhoronixTestSuite/System"><div class="pts_column_body"><xsl:attribute name="style">width: <xsl:value-of select="$idwidth" />px;</xsl:attribute><xsl:value-of select="Hardware" /></div></xsl:for-each>
				</div>
				<h1>System Software</h1>
				<div class="pts_chart_box">
				<xsl:for-each select="PhoronixTestSuite/System"><div class="pts_column_head"><xsl:attribute name="style">width: <xsl:value-of select="$idwidth" />px;</xsl:attribute><xsl:value-of select="AssociatedIdentifiers" /></div></xsl:for-each>
				<xsl:for-each select="PhoronixTestSuite/System"><div class="pts_column_body"><xsl:attribute name="style">width: <xsl:value-of select="$idwidth" />px;</xsl:attribute><xsl:value-of select="Software" /></div></xsl:for-each>
				</div>
				<h1>Additional Details</h1>
				<div class="pts_chart_box">
				<xsl:for-each select="PhoronixTestSuite/System"><div class="pts_column_head"><xsl:attribute name="style">width: <xsl:value-of select="$idwidth" />px;</xsl:attribute><xsl:value-of select="AssociatedIdentifiers" /></div></xsl:for-each>
				<xsl:for-each select="PhoronixTestSuite/System"><div class="pts_column_body"><xsl:attribute name="style">width: <xsl:value-of select="$idwidth" />px;</xsl:attribute><strong>Test Administrator:</strong> <xsl:value-of select="Author" /><br /><strong>Test Date/Time:</strong> <xsl:value-of select="TestDate" /><br /><strong>PTS Version:</strong> <xsl:value-of select="Version" /><br /><strong>Test Notes:</strong><br /><xsl:value-of select="TestNotes" /></div></xsl:for-each>
				</div>
			</div>

			<div class="pts_box">
				<h1>Test Results</h1>

				<div id="pts_benchmark_area">
					<xsl:for-each select="PhoronixTestSuite/Benchmark">
						<div class="pts_benchmark_bar"><span class="pts_benchmark_bar_header"><xsl:value-of select="Name"/></span> <span class="pts_benchmark_bar_version">v<xsl:value-of select="Version"/></span><br /><strong><xsl:value-of select="Attributes"/></strong></div>
						<div class="pts_benchmark_text">
								<xsl:if test="not(contains(ResultFormat,'MULTI_'))">
									<xsl:for-each select="Results/Group">
										<div style="padding: 5px 0;">
											<xsl:for-each select="Entry">
												<strong><xsl:value-of select="Identifier"/>:</strong><span style="padding-left: 5px;"><xsl:value-of select="Value"/></span><br />
											</xsl:for-each>
										</div>
									</xsl:for-each>
								</xsl:if>
						</div>
						<div class="pts_benchmark_img_area"><img width="580" height="300"><xsl:attribute name="src">result-graphs/<xsl:number value="position()" />.png</xsl:attribute></img></div>
					</xsl:for-each>
				</div>


			</div>
		</div>
		<div id="pts_header_bottom">
			<div id="pts_header_bottom_center">The <a href="http://www.phoronix-test-suite.com/">Phoronix Test Suite</a> is developed by <a href="http://www.phoronix.com/">Phoronix</a>, an Internet resource devoted to Linux hardware reviews, video driver articles, and much more.<br />Copyright &#xA9; 2008 by Phoronix Media.</div>
		</div>

	</body>
</html>
</xsl:template>
</xsl:stylesheet>
