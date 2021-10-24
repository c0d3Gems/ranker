import Auth from '../../_api/auth';

export async function post({ body }) {
	const result = await Auth.googleAuth(body);
	// console.log(body, result);
	return {
		body: JSON.stringify(result)
	};
}
