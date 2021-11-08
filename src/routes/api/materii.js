import Materii from '../_api/materii';

export async function get(req) {
	const materii = await Materii.getAll();

	return {
		body: JSON.stringify(materii)
	};
}
