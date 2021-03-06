import Institutii from '../../_api/institutii/Institutii';
export async function get(req) {
	const { idx } = req.params;
	console.log(idx);

	const institutiiArr = await Institutii.getAllIds(Number(idx));

	const body = `<urlset
		xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
		xmlns:news="http://www.google.com/schemas/sitemap-news/0.9"
		xmlns:xhtml="http://www.w3.org/1999/xhtml"
		xmlns:image="http://www.google.com/schemas/sitemap-image/1.1"
	>
		${institutiiArr
			.map(
				(i) =>
					`<url>
					<loc>https://analistul.com/institutii/${i.id}</loc>
					<changefreq>daily</changefreq>
				</url>`
			)
			.join('')}
	</urlset>
	`;

	const headers = {
		'Cache-Control': 'max-age=0, s-maxage=3600',
		'Content-Type': 'application/xml'
	};
	return {
		headers,
		body
	};
}

// `<urlset
// 		xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
// 		xmlns:news="http://www.google.com/schemas/sitemap-news/0.9"
// 		xmlns:xhtml="http://www.w3.org/1999/xhtml"
// 		xmlns:image="http://www.google.com/schemas/sitemap-image/1.1"
// 	>
// 		<url>
// 			<loc>https://analistul.com/institutii/91832</loc>
// 			<changefreq>daily</changefreq>
// 		</url>
// 	</urlset>
// 	`;
