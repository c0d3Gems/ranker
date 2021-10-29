export async function get(req) {
	const { idx } = req.params;
	console.log(idx);
	const headers = {
		'Cache-Control': 'max-age=0, s-maxage=3600',
		'Content-Type': 'application/xml'
	};
	return {
		headers,
		body: `<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
		<sitemap>
			<loc>https://analistul.com/sitemaps.xml</loc>
		</sitemap>
		<sitemap>
			<loc>https://analistul.com/sitemaps/institutii.xml</loc>
		</sitemap>
	</sitemapindex>
	`
	};
}
