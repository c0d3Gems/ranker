import Search from '../_api/search/_search';

export async function get({ params }) {
	const { query } = params;
	const result = await Search.getAll(query);
	return {
		body: JSON.stringify(result)
	};
}
