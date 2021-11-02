<script>
	const thisYear = new Date().getFullYear();
</script>

<footer>
	<div>
		<div class="col">
			<a href="/institutii"><h2>Instituții de învățământ</h2></a>
			<a href="/gradinite">Grădinițe</a>
			<a href="/scoli">Școli</a>
			<a href="/colegii">Colegii</a>
			<a href="/licee">Licee</a>
			<a href="/postliceale">Postliceale</a>
			<a href="/universitati">Universități</a>
			<a href="/academii">Academii</a>
		</div>
		<div class="col">
			<a href="/cadre-didactice"><h2>Cadre didactice</h2></a>
			<a href="/invatatori">Învățători</a>
			<a href="/educatori">Educatori</a>
			<a href="/profesori">Profesori</a>
		</div>
		<div class="col">
			<h2>Altele</h2>
			<a href="/login">Autentificare</a>
			<a href="/confidentialitate">Politica de Confidențialitate & Cookie</a>
			<a href="/termeni-si-conditii">Termeni & Condiții</a>
			<!-- <a href="/sitemap.xml">Sitemap</a>
			<a href="/sitemaps.xml">Sitemap Institutii</a> -->
		</div>
		<div class="col">
			<a href="/blog"> <h2>Blog</h2></a>
		</div>
	</div>
	<div class="mark">
		Copyright &copy;<a href="/"> analistul.com</a>
		{thisYear}
	</div>
</footer>

<style>
	.col {
		vertical-align: top;
		display: inline-block;
		margin: 0 20px;
	}
	.col a,
	.col h2 {
		display: block;
		text-align: left;
	}
	.col a {
		margin: 15px 0;
	}
	footer {
		min-height: 25px;
		color: white;
		background-color: black;
		text-align: center;
		box-sizing: border-box;
		padding: 5px 10px;
		width: 100%;
		font-family: monospace;
		font-size: 8pt;
	}
	footer .mark a {
		margin: 0 5px;
	}
	.mark {
		margin: 10px 0;
	}
</style>
