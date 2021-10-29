import Institutii from '../_api/institutii/Institutii';
export async function get(req) {
	const institutiiSitemaps = await Institutii.getNumberOfSitemaps();
	const headers = {
		'Cache-Control': 'max-age=0, s-maxage=3600',
		'Content-Type': 'application/xml'
	};
	let body = `<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">`;

	for (let i = 0; i < institutiiSitemaps?.count; ++i) {
		body += `<sitemap>
			<loc>https://analistul.com/sitemaps/institutii/${i}.xml</loc>
		</sitemap>`;
	}

	body += '</sitemapindex>';
	return {
		headers,
		body
	};
}
