import Reviews from '../../../_api/recenzii/institutii';

export async function get({ params }) {
	const { id } = params;
	const result = await Reviews.getAll(id);
	return {
		body: JSON.stringify(result)
	};
}
